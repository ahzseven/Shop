<div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
    <div class="am-offcanvas-bar admin-offcanvas-bar">
        <ul class="am-list admin-sidebar-list">
            <li>
                <a href="/admin" class="sh" id="sh"><span class="am-icon-home"></span> 首页</a>
            </li>
            <li class="admin-parent">
                <a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-amazon"></span> shop商城 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav">
                    <li>
                        <a href="{{route('shop.brand.index')}}" class="am-on">
                            <span class="am-icon-apple"></span> 品牌管理
                        </a>
                    </li>
                    <li>
                        <a href="{{route('shop.category.index')}}">
                            <span class="am-icon-th-list"></span> 分类管理
                        </a>
                    </li>
                    <li>
                        <a href="{{route('shop.product.index')}}" class="am-cf">
                            <span class="am-icon-th-large"></span> 商品管理<span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span>
                        </a>
                    </li>
                    <li>
                        <a href="{{route('shop.product.trash')}}"><span class="am-icon-trash"></span> 商品回收站
                        </a>
                    </li>
                    <li>
                        <a href="{{route('shop.customer.index')}}">
                            <span class="am-icon-th"></span> 会员管理<span class="am-badge am-badge-secondary am-margin-right am-fr"></span>
                        </a>
                    </li>

                </ul>
            </li>
            <li><a href="admin-form.html"><span class="am-icon-pencil-square-o"></span> 表单</a></li>
            <li class="am-panel">
                <a data-am-collapse="{parent: '#collapase-nav-1', target: '#user-nav'}"><span class="am-icon-cogs"></span> 系统管理 <span class="am-icon-angle-right am-fr am-margin-right"></span>
                </a>
                <ul class="am-list am-collapse admin-sidebar-sub" id="user-nav">
                    <li><a href="{{route('system.permission.index')}}"><i class="am-icon-lock am-margin-left-sm"></i> 权限管理 </a></li>
                    <li><a href="{{route('system.role.index')}}"><i class="am-icon-user-secret am-margin-left-sm"></i> 角色管理 </a></li>
                    <li><a href="{{route('system.user.index')}}"><i class="am-icon-users am-margin-left-sm"></i> 用户管理 </a></li>
                    <li><a href="{{route('system.config.index')}}"><i class="am-icon-cog am-margin-left-sm"></i> 系统设置 </a></li>
                    <li><a href="{{route('system.cache.index')}}"><i class="am-icon-refresh am-margin-left-sm"></i> 清理缓存 </a></li>
                    <li><a href="{{route('system.logs')}}"><i class="am-icon-file-text am-margin-left-sm"></i> 系统日志 </a></li>
                </ul>
            </li>
        </ul>

        <div class="am-panel am-panel-default admin-sidebar-panel">
            <div class="am-panel-bd">
                <p><span class="am-icon-bookmark"></span> 公告</p>
                <p>时光静好，与君语；细水流年，与君同。—— Amaze UI</p>
            </div>
        </div>

        <div class="am-panel am-panel-default admin-sidebar-panel">
            <div class="am-panel-bd">
                <p><span class="am-icon-tag"></span> wiki</p>
                <p>Welcome to the Amaze UI wiki!</p>
            </div>
        </div>
    </div>
</div>