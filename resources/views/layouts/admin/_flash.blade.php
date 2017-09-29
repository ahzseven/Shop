@if (count($errors) > 0)
    <div class="am-alert am-alert-danger" data-am-alert>
        <button type="button" class="am-close">&times;</button>
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif

{{--新增成功提示--}}
@if (session('success'))
    <div class="am-g">
        <div class="am-u-md-12">
            <div class="am-alert am-alert-success">
                {{ session('success') }}
            </div>
        </div>
    </div>
@endif

@if (session('error'))
    <div class="am-g">
        <div class="am-u-md-12">
            <div class="am-alert am-alert-success">
                {{ session('error') }}
            </div>
        </div>
    </div>
@endif