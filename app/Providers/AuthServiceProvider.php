<?php

namespace App\Providers;

use Illuminate\Support\Facades\Gate;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;
use App\Models\System\Permission;

class AuthServiceProvider extends ServiceProvider
{
    /**
     * The policy mappings for the application.
     *
     * @var array
     */
    protected $policies = [
        'App\Model' => 'App\Policies\ModelPolicy',
    ];

    /**
     * Register any authentication / authorization services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerPolicies();

        /**
         * Gates 是一个用于判断用户是否有权进行某项操作的闭包,使用前,先在boot()中注册
         * Gate::define  注册Gate
         * 下面的$user是当前登录用户，laravel会处理,在调用的时候不用传入
         */
        foreach ($this->getPermissions() as $permission) {
            Gate::define($permission->name, function ($user) use ($permission) {
                return $user->hasPermission($permission);
            });
        }
    }

    //获取所有权限
    protected function getPermissions()
    {
        return Permission::with('roles')->get();
    }

}
