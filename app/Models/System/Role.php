<?php

namespace App\Models\System;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    //插入中间表的字段要设为黑名单
    protected $guarded = ['permission_id'];

    /**定义:多对多
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function permissions()
    {
        return $this->belongsToMany(Permission::class);
    }
}
