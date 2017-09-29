<?php

namespace App\Http\Controllers\Auth;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * 覆盖AuthenticatesUsers类中的username()方法
     * @return string
     */
    public function username()
    {
        return 'name';
    }

    /**
     * 加入验证码验证
     * @param Request $request
     */
    protected function validateLogin(Request $request)
    {
        $this->validate($request, [
            //验证码必填,自动验证
            'captcha' => 'required|captcha',
            $this->username() => 'required|string',
            'password' => 'required|string',
        ]);
    }



    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = '/admin';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    /**
     * 多字段登录
     * @param Request $request
     * @return bool
     */
    public function attemptLogin(Request $request)
    {
        $username = $request->input('name');
        $password = $request->input('password');

        // 验证用户名登录方式
        $usernameLogin = $this->guard()->attempt(
            ['name' => $username, 'password' => $password], $request->has('remember')
        );
        if ($usernameLogin) {
            return true;
        }

        // 验证手机号登录方式
        $mobileLogin = $this->guard()->attempt(
            ['phone' => $username, 'password' => $password], $request->has('remember')
        );
        if ($mobileLogin) {
            return true;
        }

        // 验证邮箱登录方式
        $emailLogin = $this->guard()->attempt(
            ['email' => $username, 'password' => $password], $request->has('remember')
        );
        if ($emailLogin) {
            return true;
        }

        return false;
    }
}
