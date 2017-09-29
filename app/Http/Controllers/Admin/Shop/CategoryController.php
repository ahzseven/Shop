<?php

namespace App\Http\Controllers\Admin\Shop;

use App\Models\Shop\Category;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CategoryController extends Controller
{
    /**
     * 分类首页&模糊查询&分页
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $where = function($query) use($request){
            if ($request->has('keyword') && $request->keyword != '') {
                $value = '%'.$request->keyword.'%';
                $query->where('name', 'like', $value);
            }
        };
        //第一种foreach查询
//        $categories = Category::where('parent_id', 0)->orderBy('sort_order', 'desc')->paginate(env('pageSize'));
//        foreach($categories as $key => $value) {
//            //获取一级分类的id
//            $child = $value['id'];
//            //获取一级分类下的所有子类
//            $categories[$key]['children'] = Category::where('parent_id', $child)->get();
//        }

        $categories = Category::with(['children' => function($query){
            $query->orderBy('sort_order', 'desc');
    }])->orderBy('sort_order', 'desc')->where('parent_id', 0)->paginate(env('pageSize'));

        return view('admin.shop.category.index', compact('categories'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = Category::where('parent_id', '=', 0)->get();
        return view('admin.shop.category.create', compact('categories'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
//            'url'        => 'required|url',
            'name'       => 'required|unique:categories|max:255',
            'sort_order' => 'required|integer|max:255'
        ]);
        Category::create($request->all());
        Category::clear();

        return redirect(route('shop.category.index'))->with('success', '新增成功');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $categories = Category::where('parent_id', '=', 0)->get();
        $category = Category::find($id);
        return view('admin.shop.category.edit', [
            'category'   => $category,
            'categories' => $categories
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
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
        $this->validate($request, [
//            'url'        => 'required|url',
            'name'       => 'required|unique:categories|max:255',
            'sort_order' => 'required|integer|max:255'
        ]);
        $category = Category::find($id);
        $category->update($request->all());
        Category::clear();

        return redirect(route('shop.category.index'))->with('success', '编辑成功');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $result    = Category::find($id);
        $parent_id = $result->parent_id;
        $num       = Category::where('parent_id', '=', $id)->count('id');
//        return $num;
        if ($parent_id == 0 && $num != 0) {
            return ['status' => 1, 'msg' => '请先清除一级分类下的数据'];
        }
        Category::destroy($id);
        Category::clear();
    }

    /**
     * 更新排序
     * @param Request $request
     */
    public function sort_order(Request $request)
    {
        $category = Category::find($request->id);
        $category->sort_order = $request->sort_order;
        $category->save();
        Category::clear();
    }

    /**
     * 改变属性值
     * @param Request $request
     */
    public function change_attr(Request $request)
    {
        $category = Category::find($request->id);
        $attr = $request->attr;
        $category->$attr = !$category->$attr;
        $category->save();
        Category::clear();
    }
}
