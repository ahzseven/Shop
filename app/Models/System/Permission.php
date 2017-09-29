<?php

namespace App\Models\System;

use Cache;
use Illuminate\Database\Eloquent\Model;

class Permission extends Model
{
    protected $guarded = [];

    /**
     * 定义:多对多关系
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function roles()
    {
        return $this->belongsToMany(Role::class);
    }

    /**
     * 定义关联关系:一对多
     * 第1参数(要关联的模型类),第2参数(中间表),第3参数(关联表的id:外键),第4参数(本表的id)
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function children()
    {
        return $this->hasMany(Permission::class, 'parent_id', 'id');
    }

    public function parent()
    {
        return $this->belongsTo(Permission::class, 'parent_id', 'id');
    }

    /**
     * 静态方法: 清除缓存
     */
    static function clear()
    {
        Cache::forget('system_permissions');
        Cache::forget('system_children_permissions');
    }

    /**
     * 静态方法(无需实例化即可调用)
     * 共三级分类
     * 获取一级分类下的二级分类
     *          二级分类下的三级分类
     * @return \Illuminate\Database\Eloquent\Collection|static[]
     */
    static public function get_permissions()
    {
        $permissions = Cache::rememberForever('system_permissions', function () {
            return self::with([
                'children' => function($query) {
                    $query->orderBy('sort_order')->orderBy('id');
                    $query->with([
                        'children' => function($query) {
                            $query->orderBy('sort_order')->orderBy('id');
                        }
                    ]);
                }
            ])->where('parent_id', 0)->orderBy('sort_order')->orderBy('id')->get();
        });

        return $permissions;
    }

    static function get_children()
    {
        $children_permissions = Cache::rememberForever('system_children_permissions', function () {
            return self::with([
                'children' => function ($query) {
                    $query->orderBy('sort_order');
                }
            ])->where('parent_id', 0)->orderBy('sort_order')->get();
        });

        return $children_permissions;
    }
}
