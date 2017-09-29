@extends('layouts.admin.application')

@section('content')
    <div class="admin-content">
        <div class="admin-content-body">
            <div class="am-cf am-padding am-padding-bottom-0">
                <div class="am-fl am-cf">
                    <strong class="am-text-primary am-text-lg">清除缓存</strong> /
                    <small>Clean Cache</small>
                </div>
            </div>
            @include('layouts.admin._flash')
            <hr>
            <div class="am-g">

                <div class="am-g am-margin-top">

                    <div class="am-u-md-8 am-u-md-offset-2">
                        <a href="{{route('system.cache.destroy')}}" data-method="delete" data-token="{{csrf_token()}}" class="am-btn am-btn-success am-radius am-btn-block">
                            <i class="am-icon-refresh am-icon-spin"></i>
                            清除缓存
                        </a>
                    </div>
                </div>
            </div>

        </div>

        <footer class="admin-content-footer">
            <hr>
            <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
        </footer>
    </div>
@endsection
