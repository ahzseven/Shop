<?php

namespace App\Http\Controllers\Admin\System;

use App\User;
use App\Models\System\Role;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class UserController extends Controller
{
    public function __construct()
    {
        view()->share([
            'roles' => Role::all(),
        ]);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users = User::paginate(env('pageSize'));
//        return $user;
        return view('admin.system.user.index', compact('users'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.system.user.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
//        $user = User::create([
//            'name' => $request->name,
//            'email' => $request->email,
//            'phone' => $request->phone,
//            'password' => bcrypt($request->password),
//        ]);
        $user = User::create($request->all());
        $user->roles()->sync($request->role_id);
        return redirect(route('system.user.index'))->with('success', '新增成功~');
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
        $user = User::find($id);
        //获取所有$id相关的用户角色--集合值
        $user_roles = $user->roles->pluck('id');
        return view('admin.system.user.edit', compact('user', 'user_roles'));
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
        $user = User::find($id);

        if ($request->has('password') && $request->password != '') {
            if (!\Hash::check($request->old_password, $user->password)) {
                return back()->with('alert', '原始密码错误~');
            }
            $user->password = bcrypt($request->password);
        }

        $user->name     = $request->name;
        $user->email    = $request->email;
        $user->realname = $request->realname;
        $user->save();

        //更新$id用户组信息
        $user->roles()->sync($request->role_id);
        return redirect(route('system.user.index'))->with('success', '修改成功~');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        User::destroy($id);
        return redirect(route('system.user.index'))->with('success', '删除成功');
    }
}
