<?php

namespace App\Http\Controllers\Admin\System;

use Cache; //引入缓存类
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CacheController extends Controller
{
    /**
     * 加载清除缓存页面
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index()
    {
        return view('admin.system.cache.index');
    }

    /**
     * 清除缓存
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy()
    {
        Cache::flush();
        return back()->with('success', '清除缓存成功');
    }
}
