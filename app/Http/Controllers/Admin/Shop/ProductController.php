<?php

namespace App\Http\Controllers\Admin\Shop;

use App\Models\Shop\ProductGallery;
use Illuminate\Http\Request;
use App\Models\Shop\Product;
use App\Models\Shop\Brand;
use App\Models\Shop\Category;
use App\Http\Controllers\Controller;

class ProductController extends Controller
{
    public function __construct()
    {
        view()->share([
            'categories' => Category::with('children')->where('parent_id', 0)->orderBy('sort_order', 'desc')->get(),
            'brands' => Brand::orderBy('sort_order')->get(),
            'filter_categories' => Category::filter_categories()
        ]);
    }

    /**
     * 模糊查询--显示首页
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //模糊查询固定写法
        $where = function ($query) use ($request) {

            //按商品名称查询
            if ($request->has('name') and $request->name != '') {
                $search = "%" . $request->name . "%";
                $query->where('name', 'like', $search);
            }

            //按分类id查询
            if ($request->has('category_id') and $request->category_id != '-1') {
                $category_id = $request->category_id;
                $product_ids = \DB::table('category_product')->where('category_id', $category_id)->pluck('product_id');
                $query->whereIn('id', $product_ids);
            }

            //按品牌查询
            if ($request->has('brand_id') and $request->brand_id != '-1') {
                $query->where('brand_id', $request->brand_id);
            }

            //按上架(is_onsale)状态查询
            if ($request->has('is_onsale') and $request->is_onsale != '-1') {
                $query->where('is_onsale', $request->is_onsale);
            }

            //按时间查询
            if ($request->has('created_at') and $request->created_at != '') {
                $time = explode(" ~ ", $request->input('created_at'));
                //***00和23时间前面一定要加一空格***
                $start_time = $time[0] . ' 00:00:00';
                $end_time   = $time[1] . ' 23:59:59';
                $query->whereBetween('created_at', [$start_time, $end_time]);
            }

        };

        //模糊查询->is_top倒序->创建日期倒序->分页--返回商品首页&获取的数据
        $products = Product::where($where)->orderBy('is_top','desc')->orderBy('created_at', 'desc')->paginate(env('pageSize'));
        return view('admin.shop.product.index', compact('products'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.shop.product.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $product = Product::create($request->all());

        //多张图片插入商品相册表
        if ($request->has('imgs')) {
            foreach ($request->imgs as $img) {
                $product->product_galleries()->create(['img' => $img]);
            }
        }

        //商品所属分类
        $product->categories()->sync($request->category_id);

        return redirect(route('shop.product.index'))->with('success', '新增商品成功');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $product = Product::with('product_galleries', 'brand', 'categories')->find($id);

        //当前商品对应的分类id
        $p_categories = $product->categories->pluck('id');
//        return $p_categories;

        return view('admin.shop.product.edit', compact('product', 'p_categories'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $product = Product::find($id);

        //同步更新category_product表数据
        $product->categories()->sync($request->category_id);

        //更新数据
        $product->update($request->all());

        if ($request->has('imgs')) {
            foreach ($request->imgs as $img) {
                $product->product_galleries()->create(['img' => $img]);
            }
        }

        return redirect(route('shop.product.index'))->with('success', '编辑商品成功');
    }

    public function delete_img(Request $request, $id)
    {
        $gallery_id = $request->input('gallery_id');
        if ($gallery_id) {
            ProductGallery::where('id', $gallery_id)->delete();
            return ['status' => 1, 'msg' => '删除成功'];
        }
    }

    /**
     * 单条软删除
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request, $id)
    {
//        return $id;
        Product::destroy($id);

        return redirect(route('shop.product.index'))->with('success', '删除商品成功');
    }

    /**
     * 改变属性值
     * @param Request $request
     */
    public function change_attr(Request $request)
    {
        $product = Product::find($request->id);
        $attr = $request->attr;
        $product->$attr = !$product->$attr;
        $product->save();
    }

    /**
     * 批量软删除
     * @param Request $request
     */
    public function delete_all(Request $request)
    {
        return $request->all();
        //$id可能为数组
        $id = $request->input('checked_id');
//        return $id;
        //参数可以为数组
        Product::destroy($id);
    }

    /**
     * 商品回收站首页--软删除后的数据
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function trash()
    {
        $products = Product::with('brand', 'categories')->onlyTrashed()->get();
        return view('admin.shop.product.trash', compact('products'));
    }

    /**
     * 处理ajax传值过来的id,进行单条或多条还原
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function recover(Request $request)
    {
        //$id可能为数组
        $id = $request->input('id');
//        return $id;
        //判断是否为数组
        if (is_array($id)) {
            Product::withTrashed()->whereIn('id', $id)->restore();
        } else {
            Product::withTrashed()->find($id)->restore();
        }

//        return back()->with('success', '还原成功');
    }

    /**
     * 永久删除--包含单条和多条删除
     * 跟id相关的数据都删除
     * @param Request $request
     */
    public function del(Request $request)
    {
        //$id可能为数组
        $id = $request->input('id');
//        return $id;
        if (is_array($id)) {
            Product::withTrashed()->whereIn('id', $id)->forceDelete();
            \DB::table('category_product')->whereIn('product_id', $id)->delete();
            ProductGallery::whereIn('product_id', $id)->delete();
        } else {
            Product::withTrashed()->find($id)->forceDelete();
            \DB::table('category_product')->where('product_id', $id)->delete();
            ProductGallery::where('product_id', $id)->delete();
        }
        return ['status' => 1];
    }
}
