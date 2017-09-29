<?php
Route::group([
    'prefix' => 'ads',
    'namespace' => 'Ads',
    'as' => 'ads.'
], function(){
    //广告分类路由
    Route::resource('category', 'CategoryController');


    //广告路由
    Route::resource('ad', 'AdController');
});