<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

//上传图片
Route::resource('photos', 'PhotoController', ['only' => ['store']]);


Route::group(['prefix' => 'admin'], function(){
    Auth::routes();
    Route::group(['namespace'=>'Admin' ,'middleware' => ['auth', 'role', 'sidebar']], function () {
        //后台首页
        Route::get('/', 'IndexController@index')->name('admin.index');

        //加载修改密码页面
        Route::get('/change_password', 'IndexController@change_password')->name('change_password');
        //执行更新密码的方法
        Route::put('/update_password', 'IndexController@update_password')->name('update_password');


        //商城管理路由
        require 'admin/shop.php';

        //系统管理路由
        require 'admin/system.php';

        //广告管理路由
        require 'admin/ad.php';


    });

});


//Route::get('/home', 'HomeController@index')->name('home');
