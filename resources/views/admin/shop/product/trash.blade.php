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
                <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">商品回收站</strong> / <small>Goods Trash</small></div>
            </div>

            <hr>
            {{--引入新增成功提示--}}
            @include('layouts.admin._flash')

            <div class="am-g">
                <div class="am-u-sm-12 am-u-md-6">
                    <div class="am-btn-toolbar">
                        <div class="am-btn-group am-btn-group-xs">
                            <button type="button" id="restore-all" class="am-btn am-btn-success">
                                <span class="am-icon-save"></span> 全部还原
                            </button>
                            <button type="button" id="delete-all" class="am-btn am-btn-warning">
                                <span class="am-icon-trash"></span> 全部删除
                            </button>
                        </div>
                    </div>
                </div>
                <form>
                    <div class="am-u-sm-12 am-u-md-3">
                        <div class="am-input-group am-input-group-sm">
                            <input type="text" class="am-form-field" name="keyword" value="">
                            <span class="am-input-group-btn">
                                <button class="am-btn am-btn-default" type="submit">搜索</button>
                            </span>
                        </div>
                    </div>
                </form>
            </div>

            <div class="am-g">
                <div class="am-u-sm-12">
                    <form class="am-form" id="form">
                        <table class="am-table am-table-striped am-table-hover table-main">
                            <thead>
                            <tr>
                                <th class="table-check"><input type="checkbox" id="check-all"></th>
                                <th class="table-id">ID</th>
                                <th class="table-title">缩略图</th>
                                <th class="table-type">商品名称</th>
                                <th class="table-author am-hide-sm-only">单价</th>
                                <th class="table-author am-hide-sm-only">所属分类</th>
                                <th class="table-type">品牌</th>
                                <th class="table-date am-hide-sm-only">发布日期/删除日期</th>
                                <th class="table-set">操作</th>
                            </tr>
                            </thead>
                            <tbody>

                            @foreach($products as $product)
                                <tr data-id="{{$product->id}}">
                                    <td><input type="checkbox" class="checked_id" value="{{$product->id}}" name="id[]"></td>
                                    <td>{{$product->id}}</td>
                                    <td><img src="{{$product->image}}" style="width: 60px;height: 40px;"></td>
                                    <td>{{$product->name}}</td>
                                    <td>{{$product->price}}</td>
                                    <td>{{ $product->categories->implode('name', ', ') }}</td>
                                    <td class="am-hide-sm-only">
                                        {{$product->brand->name}}
                                    </td>
                                    <td class="am-hide-sm-only">{{$product->created_at}}~{{$product->deleted_at}}</td>
                                    <td>
                                        <div class="am-btn-toolbar">
                                            <div class="am-btn-group am-btn-group-xs">
                                                <button class="am-btn am-btn-success am-btn-xs am-text-secondary but-recover"><span class="am-icon-pencil-square-o"></span> 还原</button>
                                                <button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only but-delete"><span class="am-icon-trash-o"></span> 删除</button>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            @endforeach

                            </tbody>
                        </table>
                        <div class="am-cf">
                            {{--共 {{ $categories->total() }} 条记录--}}
                            <div class="am-fr">
{{--                                {{ $categories->links() }}--}}
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
        $(function(){
            //数据库中删除
            $(".but-delete").click(function(){
                var info = {
                    id : $(this).parents('tr').data('id')
                };
                var _this = $(this);

                $.ajax({
                    type: 'delete',
                    url: "{{route('shop.product.del')}}",
                    data: info,
                    success: function () {
//                        alert('单条删除成功');
                        window.location.reload();
                    }
                });
            });

            //单条还原
            $(".but-recover").click(function () {
                var info = {
                    id : $(this).parents('tr').data('id')
                };
                var _this = $(this);

                $.ajax({
                    type: 'patch',
                    url: "{{route('shop.product.recover')}}",
                    data: info,
                    success: function () {
//                        alert(data);
                        window.location.reload();
                    }
                });
            });

            //选中多条数据
            $("#check-all").click(function(){
                var checked = $(this).prop("checked");
                $('.checked_id').prop('checked', checked);
            });
            //选中单条数据
            $('input[name="checked_id[]"]').on('click',function(){
                var length = $('.checked_id:checked').length;
                var lengths = $('.checked_id').length;
//                console.log(length);
                if (length != lengths) {
                    $('#check-all').prop('checked', false);
                } else {
                    $('#check-all').prop('checked', true);
                }
            });
            //全部删除
            $('#delete-all').click(function(){
                var length = $('.checked_id:checked').length;
//                console.log(length);
                if (length == 0) {
                    alert('至少选中一条记录');
                    return false;
                }
                //ajax请求
                $.ajax({
                    type: 'delete',
                    url: "{{route('shop.product.del')}}",
                    data: $("#form").serialize(),
                    success: function(){
//                        alert('ajax请求成功');
                        window.location.reload();
                    }
                });

            });
            //全部还原
            $('#restore-all').click(function(){
                var length = $('.checked_id:checked').length;
                if (length == 0) {
                    alert('至少选中一条记录');
                    return false;
                }
                $.ajax({
                    type: 'patch',
                    url: "{{route('shop.product.recover')}}",
                    data: $("#form").serialize(),
                    success: function(){
//                        alert('还原成功');
                        window.location.reload();
                    }
                });
            });

        });
    </script>
@endsection