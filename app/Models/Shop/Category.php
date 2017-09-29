<?php

namespace App\Models\Shop;

use Cache;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $guarded = [];

    /**
     * 建立关系模型
     * 一级分类下有多种子类:一对多
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function children()
    {
        return $this->hasMany('App\Models\Shop\Category', 'parent_id', 'id');
    }

    //一个分类有多个商品
    public function products()
    {
        return $this->belongsToMany('App\Models\Shop\Product');
    }

    //清除缓存
    static function clear()
    {
        Cache::forget('shop_categories');
    }

    /**
     * 生成分类数据
     * @return mixed
     */
    static function get_categories()
    {
        $categories = Cache::rememberForever('shop_categories', function () {
            return self::with([
                'children' => function ($query) {
                    $query->orderBy('sort_order')->orderBy('id');
                }
            ])->where('parent_id', 0)->orderBy('sort_order')->orderBy('id')->get();
        });

        return $categories;
    }


    /**
     * 筛选分类时,屏蔽掉没有商品的分类
     * @return \Illuminate\Database\Eloquent\Collection|\Illuminate\Support\Collection|static[]
     */
    static function filter_categories()
    {
        $categories = self::has('children.products')->with([
            'children' => function ($query) {
                $query->has('products');
            }
        ])->get();

        return $categories;
    }

    /**
     * 检查是否有子类
     * @param $id
     * @return bool
     */
    static function check_children($id)
    {
        $category = self::with('children')->find($id);
        if ($category->children->isEmpty()) {
            return true;
        }

        return false;
    }

    /**
     * 检查当前分类是否有商品
     */
    static function check_products($id)
    {
        $category = self::with('products')->find($id);
        if ($category->products->isEmpty()) {
            return true;
        }
        return false;
    }

}
