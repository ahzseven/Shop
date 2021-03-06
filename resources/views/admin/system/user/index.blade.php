@extends('layouts.admin.application')

@section('css')
    {{--日期查询插件--}}
    <link rel="stylesheet" href="/vendor/daterangepicker/daterangepicker.css">


@endsection

@section('content')
    <div class="admin-content">
        <div class="am-cf am-padding">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">用户管理</strong> /
                <small>Good Brands</small>
            </div>
        </div>

        @include('layouts.admin._flash')
        <div class="am-g">
            <div class="am-u-sm-12 am-u-md-6">
                <div class="am-btn-toolbar">
                    <div class="am-btn-group am-btn-group-xs">
                        <a class="am-btn am-btn-default" href="{{route('system.user.create')}}">
                            <span class="am-icon-plus"></span> 新增
                        </a>
                    </div>
                </div>
            </div>

            <div class="am-u-sm-12 am-u-md-3">
                <form method="get">
                    <div class="am-input-group am-input-group-sm">
                        <input type="text" class="am-form-field" name="keyword" value="">
                        <span class="am-input-group-btn">
                            <button class="am-btn am-btn-default" type="submit">搜索</button>
                        </span>
                    </div>
                </form>
            </div>
        </div>

        <div class="am-g">
            <div class="am-u-sm-12">
                <form class="am-form">
                    <table class="am-table am-table-striped am-table-hover table-main">
                        <thead>
                        <tr>
                            <th class="table-id">编号</th>
                            <th class="table-thumb">用户名</th>
                            <th class="table-thumb">真实姓名</th>
                            <th class="table-thumb">所属用户组</th>
                            <th class="table-name">邮箱</th>
                            <th>创建时间</th>
                            <th class="table-set">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($users as $user)
                        <tr data-id="{{$user->id}}">
                            <td>{{$user->id}}</td>
                            <td>{{$user->name}}</td>
                            <td>{{$user->realname}}</td>
                            <td>{{$user->roles->implode('name', ', ')}}</td>
                            <td>{{$user->email}}</td>
                            <td>{{$user->created_at}}</td>
                            <td>
                                <div class="am-btn-toolbar">
                                    <div class="am-btn-group am-btn-group-xs">
                                        @if($user->id != 1)
                                        <a class="am-btn am-btn-default am-btn-xs am-text-secondary" href="{{route('system.user.edit', $user->id)}}">
                                            <span class="am-icon-pencil-square-o"></span> 编辑
                                        </a>

                                        <a class="am-btn am-btn-default am-btn-xs am-text-secondary" href="{{route('system.user.destroy', $user->id)}}" data-method="delete" data-token="{{csrf_token()}}" data-confirm="确认删除吗?">
                                            <span class="am-icon-pencil-square-o"></span> 删除
                                        </a>
                                        @endif
                                    </div>
                                </div>
                            </td>
                        </tr>
                        @endforeach
                        </tbody>
                    </table>

                    共 {{$users->total()}} 条记录

                    <div class="am-cf">
                        <div class="am-fr">


                        </div>
                    </div>
                    <hr>
                </form>
            </div>
        </div>
    </div>
@endsection

