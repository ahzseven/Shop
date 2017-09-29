<?php
/**
 * Created by PhpStorm.
 * Author: Seven
 * Date: 2017/9/6
 * Time: 23:10
 */
Route::group([
    'prefix'    => 'shop',  //前缀
    'namespace' => 'Shop',  //命名空间首字母大写
    'as'        => 'shop.'
], function(){

    //自定义--品牌管理/排序路由(一定要在资源路由前面****)
    Route::patch('brand/sort_order', 'BrandController@sort_order')->name('brand.sort_order');
    //自定义--品牌管理/改变属性路由(一定要在资源路由前面)
    Route::patch('brand/change_attr', 'BrandController@change_attr')->name('brand.change_attr');

    //自定义--分类管理/排序路由(一定要在资源路由前面)
    Route::patch('category/sort_order', 'CategoryController@sort_order')->name('category.sort_order');
    //自定义--分类管理/改变属性路由(一定要在资源路由前面)
    Route::patch('category/change_attr', 'CategoryController@change_attr')->name('category.change_attr');

    //自定义--商品管理/改变属性路由(一定要在资源路由前面)
    Route::patch('product/change_attr', 'ProductController@change_attr')->name('product.change_attr');
    //自定义--商品管理/批量删除路由(一定要在资源路由前面)
    Route::patch('product/delete_all', 'ProductController@delete_all')->name('product.delete_all');
    //自定义--商品管理/删除图片路由(一定要在资源路由前面)
    Route::delete('product/delete_img/{id}', 'ProductController@delete_img')->name('product.delete_img');

    //自定义--商品回收站/路由(一定要在资源路由前面)
    Route::get('product/trash', 'ProductController@trash')->name('product.trash');
    Route::patch('product/trash', 'ProductController@recover')->name('product.recover');
    Route::delete('product/del', 'ProductController@del')->name('product.del');

    //品牌管理资源路由控制器
    Route::resource('brand', 'BrandController');

    //分类管理资源路由控制器
    Route::resource('category', 'CategoryController');

    //商品管理资源路由控制器
    Route::resource('product', 'ProductController');

    //会员管理资源路由控制器
    Route::resource('customer', 'CustomerController');

});