<?php

namespace App\Models\Shop;

use Illuminate\Database\Eloquent\Model;

class Brand extends Model
{
    protected $guarded = [];

    //一个品牌有多个商品
    public function products()
    {
        return $this->hasMany('App\Models\Shop\Product');
    }
}
