@extends('layouts.admin.application')

@section('css')
    <style>
        .am-icon-close{
            color: red;
        }
        .am-icon-check{
            color: green;
        }
        .am-icon-close, .am-icon-check{
            cursor: pointer;
        }

    </style>
@endsection

@section('content')
    <div class="admin-content">
        <div class="admin-content-body">
            <div class="am-cf am-padding am-padding-bottom-0">
                <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">商品分类</strong> / <small>Good categorys</small></div>
            </div>

            <hr>
            {{--引入新增成功提示--}}
            @include('layouts.admin._flash')

            <div class="am-g">
                <div class="am-u-sm-12 am-u-md-6">
                    <div class="am-btn-toolbar">
                        <div class="am-btn-group am-btn-group-xs">
                            <a class="am-btn am-btn-default" href="{{route('shop.category.create')}}">
                                <span class="am-icon-plus"></span> 新增
                            </a>
                            <button type="button" id="button-all" class="am-btn am-btn-success">
                                <span class="am-icon-save"></span> 展开所有分类
                            </button>
                        </div>
                    </div>
                </div>
                <form>
                    <div class="am-u-sm-12 am-u-md-3">
                        <div class="am-input-group am-input-group-sm">
                            <input type="text" class="am-form-field" name="keyword" value="{{Request::input('keyword')}}">
                            <span class="am-input-group-btn">
                                <button class="am-btn am-btn-default" type="submit">搜索</button>
                            </span>
                        </div>
                    </div>
                </form>
            </div>

            <div class="am-g">
                <div class="am-u-sm-12">
                    <form class="am-form" action="" method="post">
                        <table class="am-table am-table-striped am-table-hover table-main">
                            <thead>
                            <tr>
                                <th class="table-check"><input type="checkbox" ></th>
                                <th class="table-id">ID</th>
                                <th class="table-title">缩略图</th>
                                <th class="table-type">分类名称</th>
                                <th class="table-author am-hide-sm-only">分类商品</th>
                                <th class="table-author am-hide-sm-only">分类描述</th>
                                <th class="table-type">显示</th>
                                <th class="table-type">排序</th>
                                <th class="table-date am-hide-sm-only">修改日期</th>
                                <th class="table-set">操作</th>
                            </tr>
                            </thead>
                            <tbody>

                            @foreach($categories as $category)
                                <tr class="xParent" data-id="{{$category->id}}">
                                    <td><input type="checkbox"></td>
                                    <td>{{$category->id}}</td>
                                    <td><img src="#">图片</td>
                                    <td>{{$category->name}}</td>
                                    <td><a href="{{route('shop.product.index', ['category_id' => $category->id])}}" target="_blank">查看所有分类商品</a></td>
                                    <td>{{$category->description}}</td>
                                    <td>
                                        {!! change_attr($category,'is_show') !!}
                                    </td>
                                    <td class="am-hide-sm-only">
                                        <input type="text" class="sort_order" style="width: 42px;" value="{{$category->sort_order}}">
                                    </td>
                                    <td class="am-hide-sm-only">{{$category->created_at}}</td>
                                    <td>
                                        <div class="am-btn-toolbar">
                                            <div class="am-btn-group am-btn-group-xs">
                                                <a class="am-btn am-btn-default am-btn-xs am-text-secondary" href="{{route('shop.category.show', $category->id)}}"><span class="am-icon-pencil-square-o"></span> 编辑</a>
                                                <button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only button-delete"><span class="am-icon-trash-o"></span> 删除</button>
                                            </div>
                                        </div>
                                    </td>
                                </tr>

                                @foreach($category->children as $cate)
                                    <tr class="xChildren" data-id="{{$cate->id}}">
                                        <td><input type="checkbox"></td>
                                        <td>{{$cate->id}}</td>
                                        <td><img src="#">图片</td>
                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;|--{{$cate->name}}</td>
                                        <td><a href="{{route('shop.product.index', ['category_id' => $cate->id])}}" target="_blank">查看所有分类商品</a></td>
                                        <td>{{$cate->description}}</td>
                                        <td>
                                            {!! change_attr($cate,'is_show') !!}
                                        </td>
                                        <td class="am-hide-sm-only">
                                            <input type="text" class="sort_order" style="width: 42px;" value="{{$cate->sort_order}}">
                                        </td>
                                        <td class="am-hide-sm-only">{{$cate->created_at}}</td>
                                        <td>
                                            <div class="am-btn-toolbar">
                                                <div class="am-btn-group am-btn-group-xs">
                                                    <a class="am-btn am-btn-default am-btn-xs am-text-secondary" href="{{route('shop.category.show', $cate->id)}}"><span class="am-icon-pencil-square-o"></span> 编辑</a>
                                                    <button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only button-delete"><span class="am-icon-trash-o"></span> 删除</button>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach
                            @endforeach

                            </tbody>
                        </table>
                        <div class="am-cf">
                            共 {{ $categories->total() }} 条记录
                            <div class="am-fr">
                                {{ $categories->links() }}
                            </div>
                        </div>
                    </form>
                </div>

            </div>
        </div>

        <footer class="admin-content-footer">
            <hr>
            <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
        </footer>

    </div>
@endsection

@section('js')
    <script>
        //进度条(注意jQuery版本,可能无法加载load函数)
        $(document).ready(function () {
            NProgress.start();
        });

        $(window).load(function () {
            NProgress.done();
        });


        $(function(){
            //二级分类展开与折叠
            $("tr.xParent").dblclick(function(){
                $(this).toggleClass('am-active');
                $(".child_" + this.id).toggle();
            });

            $("#button-all").click(function(){
                $("tr.xParent").toggleClass('am-active');
                $("tr.xChildren").toggle();
            });

            //修改排序值,自动排序
            $(".sort_order").change(function(){
                var info = {
                    id : $(this).parents('tr').data('id'),
                    sort_order : $(this).val()
                };
            console.log(info);
                $.ajax({
                    type: 'PATCH',
                    url: "{{route('shop.category.sort_order')}}",
                    data: info,
                    success: function(){
                        //自动刷新
                        window.location.reload();
                    }
                });
            });

            //删除
            $(document).on('click', '.button-delete', function(){
                var id    = $(this).parents('tr').data('id');
                var _this = $(this);
                $.ajax({
                    type: 'DELETE',
                    url: 'category/' + id,
                    data: {id : id},
                    success: function(data){
                        //为真,分类下面还有子类
                        if (data.status == 1) {
                            alert(data.msg);
                        } else {
                            _this.parents('tr').fadeOut(500);
                        }
                    }
                });
            });

            //改变属性
            $('.change_attr').click(function(){
                var info = {
                    id : $(this).parents('tr').data('id'),
                    attr : $(this).attr('data-attr')
                };
                var _this = $(this);
                $.ajax({
                    type: 'PATCH',
                    url: "{{route('shop.category.change_attr')}}",
                    data: info,
                    success: function(){
                        _this.toggleClass('am-icon-check am-icon-close');
                    }
                });
            });


        });
    </script>
@endsection