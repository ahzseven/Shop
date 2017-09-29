@extends('layouts.admin.application')

@section('css')
    <link rel="stylesheet" href="/vendor/markdown/css/editormd.min.css"/>
    <link rel="stylesheet" href="/vendor/webupload/dist/webuploader.css" />
    <link rel="stylesheet" type="text/css" href="/vendor/webupload/style.css" />
@endsection

@section('content')
    <div class="admin-content">

        <div class="am-cf am-padding">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">编辑用户组</strong> /
                <small>Edit Role</small>
            </div>
        </div>

        @include('layouts.admin._flash')

        <div class="am-g">
            <div class="am-u-sm-12 am-u-md-12">

                <div class="am-tab-panel">
                    <form class="am-form " action="{{route('system.role.update', $role->id)}}" method="post">
                        {{ csrf_field() }}
                        {{ method_field('PUT') }}
                        <div class="am-g am-margin-top">
                            <div class="am-u-sm-4 am-u-md-2 am-text-right">
                                用户组名
                            </div>
                            <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
                                <input type="text" class="am-input-sm" name="name" placeholder="请输入用户组名" value="{{$role->name}}">
                            </div>
                        </div>

                        <div class="am-g am-margin-top">
                            <div class="am-u-sm-4 am-u-md-2 am-text-right">
                                权限列表
                            </div>

                            <div class="am-u-sm-8 am-u-md-8 am-u-end col-end">

                                @foreach($permissions as $permission)
                                    <div class="am-panel am-panel-default">
                                        <div class="am-panel-hd">
                                            <label class="am-checkbox-inline am-danger">
                                                <input data-am-ucheck type="checkbox" value="{{$permission->id}}" name="permission_id[]" class="permission1" @if($role_permissions->contains($permission->id)) checked @endif>
                                                <span class="am-badge am-badge-secondary am-text-sm am-radius">{{$permission->label}}</span>
                                            </label>
                                        </div>
                                        <div class="am-panel-bd">

                                            @foreach($permission->children as $children)
                                                <div class="am-g am-margin-top ">
                                                    <div class="am-u-sm-4 am-u-md-3 am-text-right permission-div2">
                                                        <label class="am-checkbox-inline am-danger">
                                                            <input data-am-ucheck type="checkbox" value="{{$children->id}}" name="permission_id[]" class="permission2" @if($role_permissions->contains($children->id)) checked @endif>
                                                            <span class="am-badge am-badge-success am-radius">{{$children->label}}</span>
                                                        </label>
                                                    </div>
                                                    <div class="am-u-sm-8 am-u-md-9 am-u-end col-end permission-div3">

                                                        @foreach($children->children as $c)
                                                            <label class="am-checkbox-inline  am-danger">
                                                                <input data-am-ucheck type="checkbox" value="{{$c->id}}" class="permissions3" name="permission_id[]" @if($role_permissions->contains($c->id)) checked @endif>
                                                                {{$c->label}}
                                                            </label>
                                                        @endforeach

                                                    </div>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>

                        <div class="am-margin">
                            <button type="submit" class="am-btn am-btn-primary">保存修改</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection


@section('js')
    <script>
        $(function () {
            /**
             * 一级分类选中,所属之类都选中
             */
            $('.permission1').click(function(){
                var checked = $(this).prop('checked');
                $(this).parents('.am-panel-hd').next().find('input').prop('checked', checked);
            });

            $('.permission2').click(function(){
                var checked = $(this).prop('checked');
                $(this).parents('.permission-div2').next().find('input').prop('checked', checked);

                //如果所有子类全部选中,自动选中所属一级分类
                var $body  = $(this).parents('.am-panel-bd');
                $panel = $(this).parents('.am-panel');
                length_checked = $body.find('.permission2:checked').length;
                //一个子类被选中,所属一级分类自动选中
                if (length_checked > 0) {
                    $panel.find('.permission1').prop('checked', true);
                } else {
                    $panel.find('.permission1').prop('checked', false);
                }
            });

            //三级子类被选中,自动选中一级和二级分类
            $('.permission3').click(function(){
                var $permission_div3 = $(this).parents('.permission-div3');
                $permission_div2 = $permission_div3.siblings('.permission-div2');
                $body = $(this).parents('.am-panel-bd');
                $panel = $(this).parents('.am-panel');

                length3_checked = $permission_div3.find("input:checked").length;
                //一个三级被选中,自动选中二级
                if (length3_checked > 0) {
                    $permission_div2.find('.permission2').prop('checked', true);
                } else {
                    $permission_div2.find('.permission2').prop('checked', false);
                }

                //一个二级被选中,自动选中一级
                length2_checked = $body.find('.permission2:checked').length;
                if (length2_checked > 0) {
                    $panel.find('.permisssion1').prop('checked', true);
                } else {
                    $panel.find('.permisssion1').prop('checked', false);
                }
            });


        });
    </script>
@endsection