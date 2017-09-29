<!doctype html>
<html class="no-js fixed-layout">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>SHOP 商城后台管理1.0</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="/vendor/amazeui/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="/vendor/amazeui/assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="/vendor/amazeui/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="/vendor/amazeui/assets/css/admin.css">
    <link rel="stylesheet" href="/vendor/admin/common.css">
    <link rel="stylesheet" href="/vendor/admin/nprogress/nprogress.css">
    <script src="/vendor/amazeui/assets/js/jquery.min.js"></script>
    <script src="/vendor/admin/echarts.min.js"></script>
    @yield('css')
    <style>
        /*.am-on{*/
            /*background-color: green;*/
        /*}*/
        /*.in{*/
            /*background-color: #0a001f;*/
        /*}*/
    </style>
</head>
<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
以获得更好的体验！</p>
<![endif]-->

@include('layouts.admin._header')

<div class="am-cf admin-main">
    <!-- sidebar start -->
    @include('layouts.admin._sitebar')
    <!-- sidebar end -->

    <!-- content start -->
   @yield('content')
    <!-- content end -->

</div>

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<!--[if (gte IE 9)|!(IE)]><!-->
<!--<![endif]-->
<script src="/vendor/amazeui/assets/js/amazeui.min.js"></script>
<script src="/vendor/amazeui/assets/js/app.js"></script>
<script src="/vendor/admin/nprogress/nprogress.js"></script>
<script src="/vendor/admin/common.js"></script>
<script src="/js/destroy.js"></script>
    @yield('js')
<script>

    //导航栏js,遍历它下面的ul li 的每个a，检查它的href和主机的url是否相等或者，主机的地址含有href（新增、编辑）
    $(".am-list ul li a").each(function () {
        if(this.href == location.href || location.href.match(this.href)){
            $(this).parents('ul').addClass('am-in');
            $(this).addClass('am-active');
        }

    });
    $(".am-list li a").each(function () {
        if(this.href == window.location.href){
            $(this).parents('ul').addClass('am-in');
            $(this).addClass('am-active');
        }

    });
</script>
</body>
</html>
