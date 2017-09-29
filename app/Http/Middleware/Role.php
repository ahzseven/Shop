<?php

namespace App\Http\Middleware;

use Closure;
use Route, URL, Auth, Gate;

class Role
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        //判断是否是超级管理员
        if (Auth::user()->hasRole('超级管理员')) {
            return $next($request);
        }

        //判断当前路由名称是否是后台首页
        if (Route::currentRouteName() == 'admin.index') {
            return $next($request);
        }


        $previousUrl = URL::previous(); //上一页的url赋值给变量
        //拒绝非法路由,返回错误信息
        if (Gate::denies(Route::currentRouteName())) {
            if ($request->ajax() && ($request->getMethod() != 'GET')) {
                return response()->json([
                    'status' => 0,
                    'code' => 403,
                    'msg' => '您没有权限执行此操作~'
                ]);
            } else {
                return response()->view('admin.errors.403', compact('previousUrl'));
            }
        }

        return $next($request);
    }
}
