@extends('layouts.admin.application')

@section('content')
    <div class="admin-content">
        <div class="admin-content-body">
            <div class="am-cf am-padding am-padding-bottom-0">
                <div class="am-fl am-cf">
                    <strong class="am-text-primary am-text-lg">修改密码</strong> /
                    <small>Edit Password</small>
                </div>
            </div>
            @include('layouts.admin._flash')

            <hr>
            <div class="am-tabs am-margin" data-am-tabs="">
                <form class="am-form" action="{{route('update_password')}}" method="post">
                    {{csrf_field()}}
                    {{ method_field('PUT') }}
                    <div class="am-g am-margin-top">
                        <div class="am-u-sm-4 am-u-md-2 am-text-right">
                            用户名
                        </div>
                        <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
                            <input type="text" class="am-input-sm" value="{{Auth::user()->name}}" name="{{Auth::user()->name}}" style="font-weight: bold;" disabled>
                        </div>
                    </div>

                    <div class="am-g am-margin-top">
                        <div class="am-u-sm-4 am-u-md-2 am-text-right">
                            邮　箱
                        </div>
                        <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
                            <input type="email" class="am-input-sm" name="email" required>
                        </div>
                        <div class="am-hide-sm-only am-u-md-6">*必填</div>
                    </div>



                    <hr>
                    <div class="am-g am-margin-top">
                        <div class="am-u-sm-4 am-u-md-2 am-text-right">
                            旧密码
                        </div>
                        <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
                            <input type="text" class="am-input-sm" name="old_password" required>
                        </div>
                        <div class="am-hide-sm-only am-u-md-6">*必填</div>
                    </div>

                    <div class="am-g am-margin-top">
                        <div class="am-u-sm-4 am-u-md-2 am-text-right">
                            新密码
                        </div>
                        <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
                            <input type="text" class="am-input-sm" name="password" required>
                        </div>
                    </div>

                    <div class="am-g am-margin-top-sm">
                        <div class="am-u-sm-4 am-u-md-2 am-text-right admin-form-text">
                            确认密码
                        </div>
                        <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
                            <input type="text" class="am-input-sm" name="password_confirmation" required>
                            <div class="am-margin">
                                <button type="submit" class="am-btn am-btn-primary am-btn-xs">提交保存</button>
                                <button type="reset" class="am-btn am-btn-primary am-btn-xs">放弃保存</button>
                            </div>
                        </div>
                    </div>

                </form>
            </div>

        </div>

        <footer class="admin-content-footer">
            <hr>
            <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
        </footer>
    </div>
@endsection


