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
                <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">商品品牌</strong> / <small>Good Brands</small></div>
            </div>

            <hr>
            {{--引入新增成功提示--}}
            @include('layouts.admin._flash')

            <div class="am-g">
                <div class="am-u-sm-12 am-u-md-6">
                    <div class="am-btn-toolbar">
                        <div class="am-btn-group am-btn-group-xs">
                            <a class="am-btn am-btn-default" href="{{route('shop.brand.create')}}"><span class="am-icon-plus"></span> 新增</a>
                            <button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 保存</button>
                            <button type="button" class="am-btn am-btn-default"><span class="am-icon-archive"></span> 审核</button>
                            <button type="button" class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除</button>
                        </div>
                    </div>
                </div>
                <div class="am-u-sm-12 am-u-md-3">
                    <div class="am-form-group">
                        <select data-am-selected="{btnSize: 'sm'}">
                            <option value="option1">所有类别</option>
                            <option value="option2">IT业界</option>
                            <option value="option3">数码产品</option>
                            <option value="option3">笔记本电脑</option>
                            <option value="option3">平板电脑</option>
                            <option value="option3">只能手机</option>
                            <option value="option3">超极本</option>
                        </select>
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
                                <th class="table-check"><input type="checkbox"></th>
                                <th class="table-id">ID</th>
                                <th class="table-title">缩略图</th>
                                <th class="table-type">品牌名称</th>
                                <th class="table-author am-hide-sm-only">品牌网址</th>
                                <th class="table-author am-hide-sm-only">品牌商品</th>
                                <th class="table-author am-hide-sm-only">品牌描述</th>
                                <th class="table-type">显示</th>
                                <th class="table-type">排序</th>
                                <th class="table-date am-hide-sm-only">修改日期</th>
                                <th class="table-set">操作</th>
                            </tr>
                            </thead>
                            <tbody>

                            @foreach($brands as $brand)
                            <tr data-id="{{$brand->id}}">
                                <td><input type="checkbox"></td>
                                <td>{{$brand->id}}</td>
                                <td><img src="#">图片</td>
                                <td>{{$brand->name}}</td>
                                <td><a href="{{$brand->url}}" target="_blank">{{$brand->url}}</a></td>
                                <td><a href="{{route('shop.product.index', ['brand_id' => $brand->id])}}">查看商品</a></td>
                                <td>{{$brand->description}}</td>
                                <td>
                                    {!! change_attr($brand,'is_show') !!}
                                </td>
                                <td class="am-hide-sm-only">
                                    <input type="text" class="sort_order" style="width: 42px;" value="{{$brand->sort_order}}">
                                </td>
                                <td class="am-hide-sm-only">{{$brand->created_at}}</td>
                                <td>
                                    <div class="am-btn-toolbar">
                                        <div class="am-btn-group am-btn-group-xs">
                                            <a class="am-btn am-btn-default am-btn-xs am-text-secondary" href="{{route('shop.brand.show', $brand->id)}}"><span class="am-icon-pencil-square-o"></span> 编辑</a>
                                            <button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only button-delete"><span class="am-icon-trash-o"></span> 删除</button>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            @endforeach

                            </tbody>
                        </table>
                        <div class="am-cf">
                            共 {{ $brands->total()}} 条记录
                            <div class="am-fr">
                                    {{ $brands->links() }}
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
    $(document).ready(function () {
        NProgress.start();
    });

    $(window).load(function () {
        NProgress.done();
    });
</script>
<script>
    //修改排序值,自动排序
    $(function(){
        $(".sort_order").change(function(){
            var info = {
                id : $(this).parents('tr').data('id'),
                sort_order : $(this).val()
            };
//            console.log(info);
            $.ajax({
                type: 'PATCH',
                url: "{{route('shop.brand.sort_order')}}",
                data: info,
                success: function(){
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
                url: 'brand/' + id,
                data: {id : id},
                success: function(){
                    _this.parents('tr').fadeOut(500);
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
                url: "{{route('shop.brand.change_attr')}}",
                data: info,
                success: function(){
                    _this.toggleClass('am-icon-check am-icon-close');
                }
            });
        });


    });
</script>
@endsection