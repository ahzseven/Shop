<?php

namespace App\Models\Shop;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Product extends Model
{
    use SoftDeletes;
    /**
     * 应该被调整为日期的属性
     *
     * @var array
     */
    protected $dates = ['deleted_at'];

    /**
     * 黑名单功能:数组内的表单值,不会被插入数据库
     * @var array
     */
    protected $guarded = ['file', 'category_id', 'imgs'];

    //每个商品属于某个品牌
    public function brand()
    {
        return $this->belongsTo('App\Models\Shop\Brand');
    }

    //一个商品可以属于多个分类
    public function categories()
    {
        return $this->belongsToMany('App\Models\Shop\Category');
    }

    //一个商品有多个图片
    public function product_galleries()
    {
        return $this->hasMany('App\Models\Shop\ProductGallery');
    }


}
