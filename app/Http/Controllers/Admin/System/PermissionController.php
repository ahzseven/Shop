<?php

namespace App\Http\Controllers\Admin\System;

use App\Models\System\Permission;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class PermissionController extends Controller
{
    public function __construct()
    {
        view()->share([
            //调用查询三级分类的静态方法
            'permissions' => Permission::get_permissions(),
//            'data' => Permission::find(1)
        ]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
//        $data = Permission::get_permissions();
//        return $data;
        return view('admin.system.permission.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
//        return $request->all();
        Permission::create($request->all());
        Permission::clear();
        return redirect(route('system.permission.index'))->with('success', '新增成功~');
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
    public function edit(Request $request, $id)
    {
//        return $id;
//        $data = Permission::find($id);



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
        $permission = Permission::find($id);
        $permission->update($request->all());
        Permission::clear();

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Permission::destroy($id);
        Permission::clear();

        return redirect(route('system.permission.index'))->with('success', '删除成功~');
    }

    /**
     * 排序
     * @param Request $request
     */
    public function sort_order(Request $request)
    {
        $permission = Permission::find($request->id);
        $permission->sort_order = $request->sort_order;
        $permission->save();
        Permission::clear();

    }
}
