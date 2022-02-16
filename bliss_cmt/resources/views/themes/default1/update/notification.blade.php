<li class="nav-item dropdown notifications-menu">

    
    <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">

        <span class="dropdown-header">You have {!! $notification->count() !!} update(s).</span>

        <ul class="menu list-unstyled">

            @if($notification->count()>0)
            @foreach($notification as $notify)
            @if($notify->value)

            <li>&nbsp;&nbsp;&nbsp;{!! ucfirst($notify->value) !!}</li>
            <li class="clearfix"></li>
            @endif
            @endforeach
            @endif
        </ul>
    </div>
</li>

