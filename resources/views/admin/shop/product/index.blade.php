@extends('layouts.admin.application')
@section('css')
    {{--日期查询插件--}}
    <link rel="stylesheet" href="/vendor/daterangepicker/daterangepicker.css">
    <style>
        /*图片最高*/
        .thumb {
            max-height: 60px;
        }

        /*图标属性*/
         .am-icon-close{
             color: red;
         }
        .am-icon-check{
            color: green;
        }
        .am-icon-close, .am-icon-check{
            cursor: pointer;
        }

        /*日期插件*/
        .daterangepicker{
            display: none;
        }
    </style>
@endsection
@section('content')
    <div class="admin-content">

        <div class="am-cf am-padding">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">商品管理</strong> /
                <small>Product List</small>
            </div>
        </div>

        {{--引入提示--}}
        @include('layouts.admin._flash')

        <div class="am-g" style="height: 37px;">
            <div class="am-u-sm-12 am-u-md-3">
                <div class="am-btn-toolbar">
                    <div class="am-btn-group am-btn-group-xs">
                        <a type="button" class="am-btn am-btn-default" href="{{route('shop.product.create')}}">
                            <span class="am-icon-plus"></span> 新增
                        </a>
                        <button type="button" id="delete-all" class="am-btn am-btn-default" id="destroy_checked">
                            <span class="am-icon-trash-o"></span> 批量删除
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <hr>
        <div class="am-g">
            <div class="am-u-sm-12 am-u-md-12">
                <form class="am-form-inline" role="form" method="get">

                    <div class="am-form-group">
                        <input type="text" name="name" class="am-form-field am-input-sm" placeholder="商品名"
                               value="{{ Request::input('name') }}">
                    </div>

                    <div class="am-form-group">
                        <select data-am-selected="{btnSize: 'sm', maxHeight: 360, searchBox: 1}"
                                name="category_id">
                            <optgroup label="请选择">
                                <option value="-1">所有分类</option>
                            </optgroup>

                            @foreach($filter_categories as $category)
                                <optgroup label="{{$category->name}}">
                                    @foreach($category->children as $c)
                                        <option value="{{$c->id}}" @if($c->id == Request::input('category_id')) selected @endif>
                                            {{$c->name}}
                                        </option>
                                    @endforeach
                                </optgroup>
                            @endforeach

                        </select>
                    </div>

                    <div class="am-form-group">
                        <select data-am-selected="{btnSize: 'sm', maxHeight: 360, searchBox: 1}"
                                name="brand_id">
                            <option value="-1">所有品牌</option>
                            @foreach($brands as $brand)
                                <option value="{{ $brand->id }}" @if($brand->id == Request::input('brand_id')) selected @endif>
                                    {{$brand->name}}
                                </option>
                            @endforeach
                        </select>
                    </div>

                    <div class="am-form-group">
                        <select data-am-selected="{btnSize: 'sm'}" name="is_onsale" id="">
                            <option value="-1" @if(Request::input('is_onsale') == '-1') selected @endif>上架状态</option>
                            <option value="1" @if(Request::input('is_onsale') == '1') selected @endif>上架</option>
                            <option value="0" @if(Request::input('is_onsale') == '0') selected @endif>下架</option>
                        </select>
                    </div>

                    <div class="am-form-group">
                        <input type="text" id="created_at" placeholder="选择时间日期" name="created_at"
                               value="{{ Request::input('created_at') }}" class="am-form-field am-input-sm"/>
                    </div>

                    <button type="submit" class="am-btn am-btn-default am-btn-sm">查询</button>
                    <a href="{{route('shop.product.index')}}" class="am-btn am-btn-default am-btn-sm">重置</a>
                </form>
            </div>
        </div>


        <div class="am-g">
            <div class="am-u-sm-12">
                <form class="am-form" id="form">
                    <table class="am-table am-table-striped am-table-hover table-main">
                        <thead>
                        <tr>
                            <th class="table-check"><input type="checkbox" id="checked-all"/></th>
                            <th class="table-id">ID</th>
                            <th class="table-thumb">缩略图</th>
                            <th class="table-title">商品名称</th>
                            <th class="table-category">所属分类</th>
                            <th class="table-brand">品牌</th>
                            <th class="table-price">单价(元)</th>
                            <th class="am-hide-sm-only">上架</th>
                            <th class="am-hide-sm-only">置顶</th>
                            <th class="am-hide-sm-only">推荐</th>
                            <th class="am-hide-sm-only">热销</th>
                            <th class="am-hide-sm-only">新品</th>
                            <th class="am-hide-sm-only" style="width:10%">库存</th>
                            <th class="table-date am-hide-sm-only">上架日期</th>
                            <th class="table-set">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                            @foreach($products as $product)
                            <tr data-id="{{$product->id}}">
                                <td><input type="checkbox" value="{{$product->id}}" class="checked_id"
                                           name="checked_id[]"/></td>
                                <td>{{$product->id}}</td>
                                <td><img src="{{$product->image}}" style="width: 60px;height: 40px;"></td>
                                <td>{{$product->name}}</td>
                                <td>{{ $product->categories->implode('name', ', ') }}</td>
                                <td>{{$product->brand->name or '暂无'}}</td>
                                <td>
                                    <span class="am-icon-rmb">{{$product->price}}</span>
                                </td>
                                <td class="am-hide-sm-only">
                                    {!! change_attr($product, 'is_onsale') !!}
                                </td>
                                <td class="am-hide-sm-only">
                                    {!! change_attr($product, 'is_top') !!}
                                </td>
                                <td class="am-hide-sm-only">
                                    {!! change_attr($product, 'is_recommend') !!}
                                </td>
                                <td class="am-hide-sm-only">
                                    {!! change_attr($product, 'is_hot') !!}
                                </td>
                                <td class="am-hide-sm-only">
                                    {!! change_attr($product, 'is_new') !!}
                                </td>
                                <td class="am-hide-sm-only">
                                    <input type="text" name="stock" class="am-input-sm" value="{{$product->stock}}" style="width: 48px;">
                                </td>
                                <td class="am-hide-sm-only">{{$product->created_at}}</td>
                                <td>
                                    <div class="am-btn-toolbar">
                                        <div class="am-btn-group am-btn-group-xs">
                                            <a class="am-btn am-btn-default am-btn-xs am-text-secondary"
                                               href="{{route('shop.product.edit', $product->id)}}">
                                                <span class="am-icon-pencil-square-o"></span> 编辑
                                            </a>

                                            <a class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"
                                               href="{{route('shop.product.destroy', $product->id)}}"
                                               data-method="delete"
                                               data-token="{{ csrf_token() }}" data-confirm="确认删除?">
                                                <span class="am-icon-trash-o"></span> 删除
                                            </a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>

                    共 {{$products->total()}} 条记录

                    <div class="am-cf">
                        <div class="am-fr">
                            {{ $products->appends(Request::all())->links() }}
                        </div>
                    </div>
                    <hr/>
                </form>
            </div>

        </div>
        <footer class="admin-content-footer">
            <hr>
            <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
        </footer>
    </div>
@endsection

@section('js')
    <script src="/vendor/daterangepicker/moment.js"></script>
    <script src="/vendor/moment/locale/zh-cn.js"></script>
    <script src="/vendor/daterangepicker/daterangepicker.js"></script>
    <script src="/js/daterange_config.js"></script>
    <script>
        $(function () {
           //改变属性值
            $('.change_attr').click(function(){
                var info ={
                    id   : $(this).parents('tr').data('id'),
                    attr : $(this).attr('data-attr')
                };
                var _this = $(this);
                $.ajax({
                    type: 'PATCH',
                    url: "{{route('shop.product.change_attr')}}",
                    data: info,
                    success: function(){
                        _this.toggleClass('am-icon-check am-icon-close');
                    }
                });
            });

            //选中所有
            $('#checked-all').click(function(){
                //checked-all点击后,所有类(.checked_id)被选中
                var checked = $(this).prop('checked');
                $('.checked_id').prop('checked', checked);
            });
            //单个input框被点击
            $('input[name="checked_id[]"]').on('click',function(){
                var length = $('.checked_id:checked').length;
                var lengths = $('.checked_id').length;
//                console.log(lengths);
                if (length != lengths) {
                    $('#checked-all').prop('checked', false);
                } else {
                    $('#checked-all').prop('checked', true);
                }
            });
            //点击批量删除
            $('#delete-all').click(function(){
                var length = $('.checked_id:checked').length;
//                console.log(length);
                if (length == 0) {
                    alert('至少要选中一条记录');
                    return false;
                }

                //ajax请求把选中的id传给后台方法
                $.ajax({
                    type: 'PATCH',
                    url: "{{route('shop.product.delete_all')}}",
                    data: $("#form").serialize(),
                    success: function() {
//                        console.log($("#form").serialize());
//                        alert('哈哈哈');
                        window.location.reload();
                    }
                });

            });

        });
    </script>
@endsection