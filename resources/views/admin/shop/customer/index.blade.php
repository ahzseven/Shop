@extends('layouts.admin.application')

@section('css')
    {{--日期查询插件--}}
    <link rel="stylesheet" href="/vendor/daterangepicker/daterangepicker.css">
<style>
    .am-icon-female{
        color: red;
    }
    .am-icon-male{
        color: blue;
    }
    .am-icon-close, .am-icon-check{
        cursor: pointer;
    }

    /*日期插件默认不显示*/
    .daterangepicker{
        display: none;
    }
</style>
@endsection

@section('content')
    <div class="admin-content">

        <div class="am-cf am-padding">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">会员管理</strong> /
                <small>Customer Manage</small>
            </div>
        </div>



        <div class="am-g">
            <div class="am-u-sm-12 am-u-md-12">
                <form class="am-form-inline" role="form" method="get">

                    <div class="am-form-group">
                        <input type="text" name="nickname" class="am-form-field am-input-sm" placeholder="会员昵称" value="{{ Request::input('nickname') }}">
                    </div>

                    <div class="am-form-group">
                        <input type="text" name="openid" class="am-form-field am-input-sm" placeholder="微信OPEN_ID" value="{{ Request::input('openid') }}">
                    </div>

                    <div class="am-form-group">
                        <select data-am-selected="{btnSize: 'sm'}" name="sex" id="" style="display: none;">
                            <option value="-1">选择性别</option>
                            <option value="1" @if(Request::input('sex') == 1) selected @endif>男</option>
                            <option value="2" @if(Request::input('sex') == 2) selected @endif>女</option>
                        </select>
                        {{--<div class="am-selected am-dropdown " id="am-selected-zpw15" data-am-dropdown="">--}}
                            {{--<button type="button"--}}
                                    {{--class="am-selected-btn am-btn am-dropdown-toggle am-btn-sm am-btn-default"><span--}}
                                        {{--class="am-selected-status am-fl">选择性别</span> <i--}}
                                        {{--class="am-selected-icon am-icon-caret-down"></i></button>--}}
                            {{--<div class="am-selected-content am-dropdown-content"><h2 class="am-selected-header"><span--}}
                                            {{--class="am-icon-chevron-left">返回</span></h2>--}}
                                {{--<ul class="am-selected-list">--}}
                                    {{--<li class="am-checked" data-index="0" data-group="0" data-value="-1"><span--}}
                                                {{--class="am-selected-text">选择性别</span> <i class="am-icon-check"></i></li>--}}
                                    {{--<li class="" data-index="1" data-group="0" data-value="1"><span--}}
                                                {{--class="am-selected-text">男</span> <i class="am-icon-check"></i></li>--}}
                                    {{--<li class="" data-index="2" data-group="0" data-value="0"><span--}}
                                                {{--class="am-selected-text">女</span> <i class="am-icon-check"></i></li>--}}
                                {{--</ul>--}}
                                {{--<div class="am-selected-hint"></div>--}}
                            {{--</div>--}}
                        {{--</div>--}}
                    </div>

                    <div class="am-form-group">
                        <input type="text" id="created_at" placeholder="选择注册时间" name="created_at" value="{{ Request::input('created_at') }}" class="am-form-field am-input-sm">
                    </div>

                    <button type="submit" class="am-btn am-btn-default am-btn-sm">查询</button>
                </form>
            </div>
        </div>

        <div class="am-g">
            <div class="am-u-sm-12">
                <form class="am-form">
                    <table class="am-table am-table-striped am-table-hover table-main">
                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>头像</th>
                            <th>昵称</th>
                            <th>openid</th>
                            <th>性别</th>
                            <th class="am-hide-sm-only">关注时间</th>
                            <th class="table-set">操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        @foreach($customers as $customer)
                            <tr>
                                <td>{{$customer->id}}</td>
                                <td><img src="{{$customer->headimgurl}}" alt="" class="thumb" style="width: 60px;height: 40px;"></td>
                                <td>{{$customer->nickname}}</td>
                                <td>{{$customer->openid}}</td>

                                <td class="am-hide-sm-only">
                                    @if($customer->sex == 2)
                                        <span class="am-icon-female"></span>
                                    @else
                                        <span class="am-icon-male"></span>
                                    @endif

                                </td>
                                <td>{{$customer->created_at}}</td>

                                <td>
                                    <div class="am-btn-toolbar">
                                        <div class="am-btn-group am-btn-group-xs">
                                            <a class="am-btn am-btn-default am-btn-xs am-text-secondary" href="/shop/order?customer_id=11">
                                                <span class="am-icon-list-alt"></span> 查看订单
                                            </a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        @endforeach


                        </tbody>
                    </table>

                    共 {{$customers->total()}} 条记录

                    <div class="am-cf">
                        <div class="am-fr">
                            {{ $customers->appends(Request::all())->links() }}

                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@section('js')
    {{--日期插件以下4个js--}}
    <script src="/vendor/daterangepicker/moment.js"></script>
    {{--日期插件中文显示--}}
    <script src="/vendor/moment/locale/zh-cn.js"></script>
    <script src="/vendor/daterangepicker/daterangepicker.js"></script>
    <script src="/js/daterange_config.js"></script>
@endsection