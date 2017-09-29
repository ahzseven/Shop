@extends('layouts.admin.application')
@section('css')

@endsection
@section('content')
    <!-- content start -->
    <div class="admin-content">
        <div class="admin-content-body">
            <div class="am-cf am-padding">
                <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">首页</strong> / <small>一些常用模块</small></div>
            </div>

            <ul class="am-avg-sm-1 am-avg-md-4 am-margin am-padding am-text-center admin-content-list">
                <li><a href="#" class="am-text-success"><span class="am-icon-btn am-icon-file-text"></span><br/>新增页面<br/>2300</a></li>
                <li><a href="#" class="am-text-warning"><span class="am-icon-btn am-icon-briefcase"></span><br/>成交订单<br/>308</a></li>
                <li><a href="#" class="am-text-danger"><span class="am-icon-btn am-icon-recycle"></span><br/>昨日访问<br/>80082</a></li>
                <li><a href="#" class="am-text-secondary"><span class="am-icon-btn am-icon-user-md"></span><br/>在线用户<br/>3000</a></li>
            </ul>

            <hr>
            <div class="am-g">
                <div class="am-u-sm-6">
                    <div id="main-l" style="width: 560px;height:400px;"></div>
                    <script>
                        var myChart = echarts.init(document.getElementById('main-l'));

                        // 指定图表的配置项和数据
                        option = {
                            title: {
                                text: '折线图'
                            },
                            tooltip: {
                                trigger: 'axis'
                            },
                            legend: {
                                data:['邮件营销','联盟广告','视频广告','直接访问','搜索引擎']
                            },
                            grid: {
                                left: '3%',
                                right: '4%',
                                bottom: '3%',
                                containLabel: true
                            },
                            toolbox: {
                                feature: {
                                    saveAsImage: {}
                                }
                            },
                            xAxis: {
                                type: 'category',
                                boundaryGap: false,
                                data: ['周一','周二','周三','周四','周五','周六','周日']
                            },
                            yAxis: {
                                type: 'value'
                            },
                            series: [
                                {
                                    name:'邮件营销',
                                    type:'line',
                                    stack: '总量',
                                    data:[120, 132, 101, 134, 90, 230, 210]
                                },
                                {
                                    name:'联盟广告',
                                    type:'line',
                                    stack: '总量',
                                    data:[220, 182, 191, 234, 290, 330, 310]
                                },
                                {
                                    name:'视频广告',
                                    type:'line',
                                    stack: '总量',
                                    data:[150, 232, 201, 154, 190, 330, 410]
                                },
                                {
                                    name:'直接访问',
                                    type:'line',
                                    stack: '总量',
                                    data:[320, 332, 301, 334, 390, 330, 320]
                                },
                                {
                                    name:'搜索引擎',
                                    type:'line',
                                    stack: '总量',
                                    data:[820, 932, 901, 934, 1290, 1330, 1320]
                                }
                            ]
                        };



                        myChart.setOption(option);

                    </script>
                </div>
                <div class="am-u-sm-6">
                    <div id="main-r" style="width: 480px;height:400px;"></div>
                    <script>
                        var myChart = echarts.init(document.getElementById('main-r'));

                        // 指定图表的配置项和数据
                        option = {
                            title : {
                                text: '某站点用户访问来源',
                                subtext: '纯属虚构',
                                x:'center'
                            },
                            tooltip : {
                                trigger: 'item',
                                formatter: "{a} <br/>{b} : {c} ({d}%)"
                            },
                            legend: {
                                orient: 'vertical',
                                left: 'left',
                                data: ['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']
                            },
                            series : [
                                {
                                    name: '访问来源',
                                    type: 'pie',
                                    radius : '55%',
                                    center: ['50%', '60%'],
                                    data:[
                                        {value:335, name:'直接访问'},
                                        {value:310, name:'邮件营销'},
                                        {value:234, name:'联盟广告'},
                                        {value:135, name:'视频广告'},
                                        {value:1548, name:'搜索引擎'}
                                    ],
                                    itemStyle: {
                                        emphasis: {
                                            shadowBlur: 10,
                                            shadowOffsetX: 0,
                                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                                        }
                                    }
                                }
                            ]
                        };



                        myChart.setOption(option);

                    </script>
                </div>
            </div>

            <div class="am-g">

            </div>
        </div>

        <footer class="admin-content-footer">
            <hr>
            <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
        </footer>
    </div>
@endsection
    <!-- content end -->

