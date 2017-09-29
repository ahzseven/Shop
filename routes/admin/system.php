<?php
Route::group([
    'prefix'    => 'system',  //前缀
    'namespace' => 'System',  //命名空间首字母大写
    'as'        => 'system.'
], function(){
    //日志路由
    Route::get('logs', '\Rap2hpoutre\LaravelLogViewer\LogViewerController@index')->name('logs');

    //加载缓存页面
    Route::get('cache', 'CacheController@index')->name('cache.index');
    //清除缓存
    Route::delete('cache', 'CacheController@destroy')->name('cache.destroy');


    //加载系统设置首页
    Route::get('config', 'InfoController@index')->name('config.index');
    //更新
    Route::put('config/{id}', 'InfoController@update')->name('config.update');

    // 用户权限
    Route::patch('permission/sort_order', 'PermissionController@sort_order')->name('permission.sort_order');
    Route::resource('permission', 'PermissionController');
    Route::resource('user', 'UserController');
    Route::resource('role', 'RoleController');

});