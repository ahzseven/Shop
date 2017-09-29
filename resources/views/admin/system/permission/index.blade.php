@extends('layouts.admin.application')

@section('css')
    <style>
        .permission{
            color: red;
            font-weight: 900;
        }
        .children{
            color: blue;
            font-weight: 600;
        }
        .child{
            color: #00a2d4;
        }
        .aparent, .bchild{
            cursor: pointer;
        }
        .xChildren{
            display: none;
        }
    </style>
@endsection

@section('content')
    <div class="admin-content">
        <div class="am-cf am-padding">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">权限管理</strong> /
                <small>Permission Manage</small>
            </div>
        </div>

        <div class="am-g">
            <div class="am-u-sm-12 am-u-md-6">
                <div class="am-btn-toolbar">
                    <div class="am-btn-group am-btn-group-xs">
                        <button type="button" id="doc-prompt-toggle" class="am-btn am-btn-success"><span class="am-icon-plus"></span> 新增权限菜单
                        </button>
                        <button type="button" id="button-all" class="am-btn am-btn-success"><span class="am-icon-plus"></span> 展开所有权限菜单
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <hr>

        {{--引入提示--}}
        @include('layouts.admin._flash')

        <div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt">
            <div class="am-modal-dialog">
                <div class="am-modal-hd">新增权限</div>
                <div class="am-modal-bd">
                    <form data-am-validator="" class="am-form" id="form" novalidate="novalidate">

                        {{ csrf_field() }}

                        <div id="_method"></div>
                        <div class="am-g am-margin-top">
                            <div class="am-u-sm-4 am-u-md-3">
                                上级菜单
                            </div>
                            <div class="am-u-sm-8 am-u-md-9">
                                <select id="select-add" class="am-field-valid am-modal-prompt-input" name="parent_id">
                                    <option value="0">顶级菜单</option>
                                    @foreach($permissions as $permission)
                                        <option class="permission" value="{{$permission->id}}">　　{{$permission->label}}</option>
                                        @foreach($permission->children as $children)
                                            <option class="children" value="{{$children->id}}">　　　　┗━{{$children->label}}</option>
                                        @endforeach
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="am-g am-margin-top">
                            <div class="am-u-sm-4 am-u-md-3">
                                图标
                            </div>
                            <div class="am-u-sm-8 am-u-md-9">
                                <div class="am-form-group am-form-icon"><i></i> <input type="text" placeholder="请输入图标的class" class="am-form-field am-input-sm am-modal-prompt-input form-icon" name="icon">
                                </div>
                            </div>
                        </div>
                        <div class="am-g am-margin-top">
                            <div class="am-u-sm-4 am-u-md-3">
                                权限名称
                            </div>
                            <div class="am-u-sm-8 am-u-md-9">
                                <input type="text" id="label" name="label" placeholder="请输入菜单名称" required="required" class="am-input-sm am-modal-prompt-input form-label"></div>
                        </div>
                        <div class="am-g am-margin-top">
                            <div class="am-u-sm-4 am-u-md-3">
                                路由名称
                            </div>
                            <div class="am-u-sm-8 am-u-md-9">
                                <textarea rows="4" id="le" placeholder="请输入权限名称" name="name" class="am-modal-prompt-input form-name" required="required"></textarea></div>
                        </div>
                        <hr>
                        <div class="am-modal-footer">
                            <span class="am-modal-btn" data-am-modal-cancel>取消</span>
                            <span class="am-modal-btn" data-am-modal-confirm>提交</span>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt-edit">
            <div class="am-modal-dialog">
                <div class="am-modal-hd">编辑权限</div>
                <div class="am-modal-bd">
                    <form data-am-validator="" class="am-form" id="form-edit" novalidate="novalidate">

                        {{ csrf_field() }}

                        <div class="am-g am-margin-top">
                            <div class="am-u-sm-4 am-u-md-3">
                                上级菜单
                            </div>
                            <div class="am-u-sm-8 am-u-md-9">
                                <select id="select" class="am-field-valid am-modal-prompt-input" name="parent_id">
                                    <option value="0">顶级菜单</option>
                                    @foreach($permissions as $permission)
                                        <option class="parent_id" value="{{$permission->id}}">　　{{$permission->label}}</option>
                                        @foreach($permission->children as $children)
                                            <option class="parent_id" value="{{$children->id}}">　　　　┗━{{$children->label}}</option>
                                        @endforeach
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="am-g am-margin-top">
                            <div class="am-u-sm-4 am-u-md-3">
                                图标
                            </div>
                            <div class="am-u-sm-8 am-u-md-9">
                                <div class="am-form-group am-form-icon"><i class=""></i> <input type="text" placeholder="请输入图标的class" class="am-form-field am-input-sm am-modal-prompt-input icon" name="icon">
                                </div>
                            </div>
                        </div>
                        <div class="am-g am-margin-top">
                            <div class="am-u-sm-4 am-u-md-3">
                                权限名称
                            </div>
                            <div class="am-u-sm-8 am-u-md-9">
                                <input type="text"  name="label" value="" required="required" class="am-input-sm am-modal-prompt-input label"></div>
                        </div>
                        <div class="am-g am-margin-top">
                            <div class="am-u-sm-4 am-u-md-3">
                                路由名称
                            </div>
                            <div class="am-u-sm-8 am-u-md-9">
                                <textarea rows="4" name="name" class="am-modal-prompt-input name" required="required">233</textarea></div>
                        </div>
                        <hr>
                        <div class="am-modal-footer">
                            <span class="am-modal-btn" data-am-modal-cancel>取消</span>
                            <span class="am-modal-btn" data-am-modal-confirm>提交</span>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="am-g">
            <div class="am-u-sm-12">
                <form class="am-form">
                    <table class="am-table am-table-striped am-table-hover table-main">
                        <thead>
                        <tr>
                            <th>ha</th>
                            <th>编号</th>
                            <th>路由名称</th>
                            <th>菜单名称</th>
                            <th>图标</th>
                            <th class="am-hide-sm-only">排序</th>
                            <th class="table-set">操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        @foreach($permissions as $permission)
                            <tr class="xParent" data-id="{{$permission->id}}" data-parent_id="{{$permission->parent_id}}">
                                <td class="permission"><span class="am-icon-plus aparent"></span></td>
                                <td>{{$permission->id}}</td>
                                <td>{{$permission->name}}</td>
                                <td class="permission"><i class="{{$permission->icon}}"></i> {{$permission->label}}</td>
                                <td>{{$permission->icon}}</td>
                                <td class="am-hide-sm-only">
                                    <input type="text" class="sort_order" style="width: 42px;" value="{{$permission->sort_order}}">
                                </td>
                                <td>
                                    <div class="am-btn-toolbar">
                                        <div class="am-btn-group am-btn-group-xs">
                                            <button type="button" class="am-btn am-btn-success am-btn-xs am-text-secondary button-add">
                                                <span class="am-icon-plus"></span> 新增
                                            </button>

                                            <button type="button" class="am-btn am-btn-success am-btn-xs am-text-secondary button-edit">
                                                <span class="am-icon-pencil-square-o"></span> 编辑
                                            </button>

                                            <a class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"
                                               href="{{route('system.permission.destroy', $permission->id)}}"
                                               data-method="delete"
                                               data-token="{{ csrf_token() }}" data-confirm="确认删除?">
                                                <span class="am-icon-trash-o"></span> 删除
                                            </a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                                @foreach($permission->children as $children)
                                    <tr class="xChildren" data-id="{{$children->id}}" data-parent_id="{{$children->parent_id}}">
                                        <td class="children"><span class="am-icon-plus bchildren"></span></td>
                                        <td>{{$children->id}}</td>
                                        <td>{{$children->name}}</td>
                                        <td class="children"><i>　　|--</i><i class="{{$children->icon}}"></i> {{$children->label}}</td>
                                        <td>{{$children->icon}}</td>
                                        <td class="am-hide-sm-only">
                                            <input type="text" class="sort_order" style="width: 42px;" value="{{$children->sort_order}}">
                                        </td>
                                        <td>
                                            <div class="am-btn-toolbar">
                                                <div class="am-btn-group am-btn-group-xs">
                                                    <button type="button" class="am-btn am-btn-success am-btn-xs am-text-secondary am-radius button-add">
                                                        <span class="am-icon-plus"></span> 新增
                                                    </button>

                                                    <button type="button" class="am-btn am-btn-success am-btn-xs am-radius am-text-secondary button-edit">
                                                        <span class="am-icon-pencil-square-o"></span> 编辑
                                                    </button>

                                                    <a class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only am-radius"
                                                       href="{{route('system.permission.destroy', $children->id)}}"
                                                       data-method="delete"
                                                       data-token="{{ csrf_token() }}" data-confirm="确认删除?">
                                                        <span class="am-icon-trash-o"></span> 删除
                                                    </a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                        @foreach($children->children as $child)
                                            <tr class="xChildren cchild" data-id="{{$child->id}}" data-parent_id="{{$child->parent_id}}">
                                                <td></td>
                                                <td>{{$child->id}}</td>
                                                <td>{{$child->name}}</td>
                                                <td class="child">　　　　|--{{$child->label}}</td>
                                                <td>{{$child->icon}}</td>
                                                <td class="am-hide-sm-only">
                                                    <input type="text" class="sort_order" style="width: 42px;" value="{{$child->sort_order}}">
                                                </td>
                                                <td>
                                                    <div class="am-btn-toolbar">
                                                        <div class="am-btn-group am-btn-group-xs">
                                                            <button type="button" class="am-btn am-radius am-btn-success am-btn-xs am-text-secondary button-edit">
                                                                <span class="am-icon-pencil-square-o"></span> 编辑
                                                            </button>

                                                            <a class="am-btn am-btn-default am-btn-xs am-radius am-text-danger am-hide-sm-only"
                                                               href="{{route('system.permission.destroy', $child->id)}}"
                                                               data-method="delete"
                                                               data-token="{{ csrf_token() }}" data-confirm="确认删除?">
                                                                <span class="am-icon-trash-o"></span> 删除
                                                            </a>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        @endforeach
                                @endforeach
                            @endforeach
                        </tbody>
                    </table>
                    <div class="am-cf">
                        <div class="am-fr">
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@section('js')
    <script>
        $(function() {
            //子类全部展开与折叠
//            $("tr.xParent").dblclick(function(){
//                $(this).toggleClass('am-active');
//                $(".child_" + this.id).toggle();
//            });

            $("#button-all").click(function(){
                $("tr.xParent").toggleClass('am-active');
                $("tr.xChildren").show();
            });

            //点击一级分类,所属二级分类展开/折叠
            $('.aparent').click(function(){
                $(this).toggleClass('am-icon-minus');
                var id = $(this).parents('tr').data('id');
                $('[data-parent_id='+id+']').toggle();

                child_id = $('[data-parent_id='+id+']');

                //循环每个二级分类,父类为当前二级分类的三级分类隐藏
                if (!$(this).hasClass('am-icon-minus')){
                    child_id.each(function(i){
                        parent_id = $(this).data('id');
                        $('[data-parent_id='+parent_id+']').hide();
                    });
                }
            });
            //点击二级分类,所属三级分类展开/折叠
            $('.bchildren').click(function () {
                $(this).toggleClass('am-icon-minus');
                var id = $(this).parents('tr').data('id');
                 child = $('[data-parent_id='+id+']');
                 child.toggle();
            });

            //新增权限
            $('#doc-prompt-toggle').on('click', function() {

                $('#my-prompt').modal({
                    relatedTarget: this,
                    onConfirm: function(e) {
                        //序列化表单里的name和值
                       var info = $("#form").serialize();
                        $.ajax({
                            type: 'post',
                            url: "{{route('system.permission.store')}}",
                            data: info,
                            success: function (e) {
                                window.location.reload();
                            }
                        });

                    },
                    onCancel: function(e) {
//                        alert('不想说!');
                    }
                });
            });

            //新增权限分类
            $('.button-add').on('click', function() {
                var parent = $(this).parents('tr').data('id');
                //select下拉项的值为parent_id,即被选中
                $("#select-add").val(parent);

                $('#my-prompt').modal({
                    relatedTarget: this,
                    onConfirm: function(e) {
                        //序列化表单里的name和值
                        var info = {
                            name : $("#form").find('.form-name').val(),
                            label: $("#form").find('.form-label').val(),
                            icon : $("#form").find('.form-icon').val(),
                            parent_id : $("#select-add").val()
                        };

                        $.ajax({
                            type: 'post',
                            url: "{{route('system.permission.store')}}",
                            data: info,
                            success: function (e) {
                                window.location.reload();
                            }
                        });

                    },
                    onCancel: function(e) {
//                        alert('不想说!');
                    }
                });
            });

            /**
             * 编辑权限
             * label有特殊字符 |-- 需要替换为空,再$.trim()清除空格
             */
            $('.button-edit').on('click', function() {
                var id     = $(this).parents('tr').data('id');
                    name   = $(this).parents('tr').find('td:eq(1)').text();
                    label  = $(this).parents('tr').find('td:eq(2)').text();
                    icon   = $(this).parents('tr').find('td:eq(3)').text();
                    sort_  = $(this).parents('tr').find('.sort_order').val();
                    parent = $(this).parents('tr').data('parent_id');
                //替换特殊符号为空
                label = label.replace(/[|-]/g, " ");
                //去除空格
                label = $.trim(label);

                $("#form-edit").find('.name').val(name);
                $("#form-edit").find('.label').val(label);
                $("#form-edit").find('.icon').val(icon);
                //编辑时显示图标
                $("#form-edit").find('i').addClass(icon);

                //select下拉项的值为parent_id,即被选中
                $("#select").val(parent);
                //模态框
                $('#my-prompt-edit').modal({
                    relatedTarget: this,
                    onConfirm: function(e) {
                        //获取数据name和值
                        var info = {
                            name : $("#form-edit").find('.name').val(),
                            label: $("#form-edit").find('.label').val(),
                            icon : $("#form-edit").find('.icon').val(),
                            parent_id : $("#select").val()
                        };
                        //更新数据
                        $.ajax({
                            type: 'put',
                            url: "permission/" + id,
                            data: info,
                            success: function () {
                                window.location.reload();
                            }
                        });

                    },
                    onCancel: function(e) {

                    }
                });
            });

            //自动排序
            $(".sort_order").change(function() {
                var info = {
                    id : $(this).parents('tr').data('id'),
                    sort_order : $(this).val()
                };
                console.log(info);
                $.ajax({
                    type: 'PATCH',
                    url: "{{route('system.permission.sort_order')}}",
                    data: info,
                    success: function(){
                        //自动刷新
                        window.location.reload();
                    }
                });
            });
        });
    </script>
@endsection