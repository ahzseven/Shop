<?php

namespace App\Http\Controllers\Admin\Shop;

use App\Models\Shop\Brand;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class BrandController extends Controller
{
    /**
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

        $brands = Brand::where($where)->orderBy('sort_order', 'desc')->paginate(env('pageSize'));

        return view('admin.shop.brand.index', compact('brands'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.shop.brand.create');
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
            'url'        => 'required|url',
            'name'       => 'required|unique:brands|max:255',
            'sort_order' => 'required|integer|max:255'
        ]);
        Brand::create($request->all());

        return redirect(route('shop.brand.index'))->with('success', '新增成功');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $brand = Brand::find($id);
        return view('admin.shop.brand.edit', compact('brand'));
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
            'url'        => 'required|url',
            'name'       => 'required|unique:brands|max:255',
            'sort_order' => 'required|integer|max:255'
        ]);
        $brand = Brand::find($id);
        $brand->update($request->all());

        return redirect(route('shop.brand.index'))->with('success', '编辑成功');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request,$id)
    {
        Brand::destroy($id);
    }

    /**
     * 更新排序
     * @param Request $request
     */
    public function sort_order(Request $request)
    {
        $brand = Brand::find($request->id);
        $brand->sort_order = $request->sort_order;
        $brand->save();
    }

    /**
     * 改变属性值
     * @param Request $request
     */
    public function change_attr(Request $request)
    {
        $brand = Brand::find($request->id);
        $attr = $request->attr;
        $brand->$attr = !$brand->$attr;
        $brand->save();
    }
}
