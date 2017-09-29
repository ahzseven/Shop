<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

use App\User;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash;
use Illuminate\Auth\Events\PasswordReset;
use Illuminate\Foundation\Auth\ResetsPasswords;
use App\Http\Controllers\Controller;
use Symfony\Component\CssSelector\Parser\Handler\HashHandler;

class IndexController extends Controller
{
    //后台首页admin/index.blade.php
    public function index()
    {
        return view('admin.index');
    }

    //显示修改密码页面
    public function change_password()
    {
        return view('admin.system.user.edit_password');
    }

    /**
     * 更新密码
     * @param Request $request
     * @return bool
     */
    public function update_password(Request $request)
    {
        //验证密码长度/必填/是否一致
        $this->validate($request, [
            'password' => 'required|string|min:6|confirmed'
        ]);

        $id = Auth::user()->id;
        $name     = $request->input('name');
        $email    = $request->input('email');
        $old_pwd  = $request->input('old_password');
        $new_pwd  = $request->input('password');

        // 验证邮箱&旧密码
        $email_password = Auth::attempt(
            ['email' => $email, 'password' => $old_pwd]
        );
        if ($email_password) {
            //保存新密码
            $user = User::find($id);
            $user->password = Hash::make($new_pwd);
            $user->save();
            User::where('name', '=', $name)->update(['password' => $new_pwd]);
        }
        return response()->json(['msg'=>'原始密码或邮箱不正确']);
    }

}
