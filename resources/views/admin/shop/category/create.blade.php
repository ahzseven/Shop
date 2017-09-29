@extends('layouts.admin.application')

@section('content')
    <div class="admin-content">
        <div class="admin-content-body">
            <div class="am-cf am-padding am-padding-bottom-0">
                <div class="am-fl am-cf">
                    <strong class="am-text-primary am-text-lg">新增分类</strong> /
                    <small>Create A New Category</small>
                </div>
            </div>
            @include('layouts.admin._flash')
            <hr>
            <div class="am-tabs am-margin" data-am-tabs="">
                <form class="am-form" action="{{route('shop.category.store')}}" method="post">
                    {{csrf_field()}}

                    <div class="am-g am-margin-top">
                        <div class="am-u-sm-4 am-u-md-2 am-text-right">
                            父级分类
                        </div>
                        <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
                            <div class="am-form-group">
                                <select id="doc-select-1" name="parent_id">
                                    <option value="0">一级分类</option>
                                    @foreach($categories as $category)
                                        <option value="{{$category->id}}">&nbsp;&nbsp;┣━{{$category->name}}</option>
                                    @endforeach
                                </select>
                                <span class="am-form-caret"></span>
                            </div>
                        </div>
                    </div>

                    <div class="am-g am-margin-top">
                        <div class="am-u-sm-4 am-u-md-2 am-text-right">
                            分类名称
                        </div>
                        <div class="am-u-sm-8 am-u-md-4">
                            <input type="text" class="am-input-sm" name="name">
                        </div>
                        <div class="am-hide-sm-only am-u-md-6">*必填，不可重复</div>
                    </div>

                    <div class="am-g am-margin-top">
                        <div class="am-u-sm-4 am-u-md-2 am-text-right">
                            缩略图
                        </div>
                        <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
                            <div class="am-form-group am-form-file">
                                <button type="button" class="am-btn am-btn-default am-btn-sm">
                                    <i class="am-icon-cloud-upload"></i> 选择要上传的文件</button>
                                <input type="file" multiple>
                            </div>
                        </div>
                    </div>

                    <hr>
                    <div class="am-g am-margin-top">
                        <div class="am-u-sm-4 am-u-md-2 am-text-right">
                            是否显示
                        </div>
                        <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
                            <label class="am-radio-inline"><input type="radio" value="1" name="is_show" checked> 是</label>
                            <label class="am-radio-inline"><input type="radio" name="is_show" value="0"> 否</label>
                        </div>
                    </div>

                    <div class="am-g am-margin-top">
                        <div class="am-u-sm-4 am-u-md-2 am-text-right">
                            排序
                        </div>
                        <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
                            <input type="text" class="am-input-sm" value="99" name="sort_order">
                        </div>
                    </div>

                    <div class="am-g am-margin-top-sm">
                        <div class="am-u-sm-4 am-u-md-2 am-text-right admin-form-text">
                            分类描述
                        </div>
                        <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
                            <textarea rows="6" name="description"></textarea>
                            <div class="am-margin">
                                <button type="submit" class="am-btn am-btn-primary am-btn-xs">提交保存</button>
                                <button type="reset" class="am-btn am-btn-primary am-btn-xs">放弃保存</button>
                            </div>
                        </div>
                    </div>

                </form>
            </div>

        </div>

        <footer class="admin-content-footer">
            <hr>
            <p class="am-padding-left">© 2017 AllMobilize, Inc. Licensed under MIT license.</p>
        </footer>
    </div>
@endsection