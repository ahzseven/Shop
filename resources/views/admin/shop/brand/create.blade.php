@extends('layouts.admin.application')

@section('content')
    <div class="admin-content">
        <div class="admin-content-body">
            <div class="am-cf am-padding am-padding-bottom-0">
                <div class="am-fl am-cf">
                    <strong class="am-text-primary am-text-lg">新增品牌</strong> /
                    <small>Create A New Brand</small>
                </div>
            </div>

            <hr>
            @include('layouts.admin._flash')
            <div class="am-tabs am-margin" data-am-tabs="">
                <form class="am-form" action="{{route('shop.brand.store')}}" method="post">
                    {{csrf_field()}}
                    <div class="am-g am-margin-top">
                        <div class="am-u-sm-4 am-u-md-2 am-text-right">
                            商品品牌
                        </div>
                        <div class="am-u-sm-8 am-u-md-4">
                            <input type="text" class="am-input-sm" name="name">
                        </div>
                        <div class="am-hide-sm-only am-u-md-6">*必填，不可重复</div>
                    </div>

                    <div class="am-g am-margin-top">
                        <div class="am-u-sm-4 am-u-md-2 am-text-right">
                            品牌网址
                        </div>
                        <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
                            <input type="text" class="am-input-sm" name="url">
                        </div>
                    </div>

                    <div class="am-g am-margin-top">
                        <div class="am-u-sm-4 am-u-md-2 am-text-right">
                            缩略图
                        </div>
                        <div class="am-u-sm-8 am-u-md-4 am-u-end col-end">
                            <div class="am-form-group am-form-file">
                                <button type="button" class="am-btn am-btn-sm am-btn-success">
                                    <i id="loading" class="am-icon-cloud-upload"></i> 选择要上传的图片</button>
                                <input type="file" id="image_upload">
                                <input type="hidden" name="image">
                            </div>
                            <hr data-am-widget="divider" style="" class="am-divider am-divider-dashed"/>

                            <div>
                                <img src="" id="img_show" style="max-height: 200px;">
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
                            品牌描述
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
            <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
        </footer>
    </div>
@endsection
@section('js')
    <script src="/vendor/html5-fileupload/jquery.html5-fileupload.js"></script>
    <script src="/js/upload.js"></script>
@endsection