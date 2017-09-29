<?php

namespace App\Http\Controllers\Admin\System;

use App\Models\System\Role;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\System\Permission;

class RoleController extends Controller
{
    public function __construct()
    {
        //获取所有权限列表
        view()->share(['permissions' => Permission::get_permissions() ]);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $roles = Role::paginate(env('pageSize'));
        return view('admin.system.role.index', compact('roles'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.system.role.create');
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
        $role = Role::create($request->all());
        //中间表同步所有permission_id值
        $role->permissions()->sync($request->permission_id);
        return redirect(route('system.role.index'))->with('success', '新增成功');
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
        $role = Role::with('permissions')->find($id);
        //当前角色对应的分类id:中间表中的permission_id值,组成的数组
        $role_permissions = $role->permissions->pluck('id');
//        return $role_permissions;

        return view('admin.system.role.edit', compact('role', 'role_permissions'));
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
        $role = Role::find($id);
        $role->name = $request->name;
        $role->save();

        $role->permissions()->sync($request->permission_id);
        return back()->with('success', '修改成功');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Role::destroy($id);
        return redirect(route('system.role.index'))->with('success', '删除成功');
    }
}
