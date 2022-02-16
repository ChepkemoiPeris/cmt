@extends('themes.default1.client.layout.logclient')

@section('home')
    class = "nav-item active"
@stop

@section('breadcrumb')
    <div class="site-hero clearfix">
        <ol class="breadcrumb breadcrumb-custom">
            <li class="text">{!! Lang::get('lang.you_are_here') !!}: </li>
            <li><a href="{!! URL::route('/') !!}">{!! Lang::get('lang.home') !!}</a></li>
        </ol>
    </div>
@stop

@section('content')

    @if(Session::has('status'))
    <div class="alert alert-success alert-dismissable">
        <i class="fa  fa-check-circle"> </i> <b> {!! Lang::get('lang.success') !!} </b>
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        {{Session::get('status')}}
    </div>

    @endif

    @if(Session::has('error'))
    <div class="alert alert-danger alert-dismissable">
        <i class="fa  fa-check-circle"> </i> <b> {!! Lang::get('lang.alert') !!} </b>
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        {{Session::get('error')}}
    </div>
    @else

    @if (count($errors) > 0)
    <div class="alert alert-danger alert-dismissable">
        <i class="fa fa-ban"></i>
        <b>{!! Lang::get('lang.alert') !!} !</b>
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        @foreach ($errors->all() as $error)
        <li>{{ $error }}</li>
        @endforeach
    </div>
    @endif
    @endif

    <div id="content" class="site-content col-md-12">
        
        <div id="corewidgetbox" class="wid">
            
            
        </div>

        <script type="text/javascript"> $(function(){ $('.dialogerror, .dialoginfo, .dialogalert').fadeIn('slow');$("form").bind("submit", function(e){$(this).find("input:submit").attr("disabled", "disabled");});});</script>
        <script type="text/javascript" >try {if (top.location.hostname != self.location.hostname) { throw 1; }} catch (e) { top.location.href = self.location.href; }</script>

        <div class="col-md-6 offset-md-3 form-helper">
            
            <div class="login-box" style=" width: 490px;"  valign = "center">
            
                <div class="form-border">

                    <div align="center">

                        <h4 style="background-color: #18479D;"> <a href="http://www.faveohelpdesk.com" class="logo">
                            <a href="https://www.blissmedicalcentre.com/" class="logo"><img src="{{ asset('company/Blisslogo.jpg')}}" width="100px;"></a>
                        </h4>   
                    </div>

                    <div>
                        
                        <h4 class="box-title" align="center">{{Lang::get('lang.login_to_start_your_session')}}</h4>
                    </div>

                    <!-- form open -->
                    {!!  Form::open(['action'=>'Auth\AuthController@postLogin', 'method'=>'post']) !!}

                        <div class="form-group has-feedback {{ $errors->has('email') ? 'has-error' : '' }}" style="display: -webkit-box;">
                            {!! Form::text('email',null,['placeholder'=> 'Username' ,'class' => 'form-control']) !!}
                            <span class="glyphicon glyphicon-envelope form-control-feedback" style="top: 9px;left: -25px;color: #6c757d;"></span>
                        </div>

                        <div class="form-group has-feedback {{ $errors->has('password') ? 'has-error' : '' }}" style="display: -webkit-box;">
        
                            {!! Form::password('password',['placeholder'=>Lang::get("lang.password"),'class' => 'form-control']) !!}
                            <span class="glyphicon glyphicon-lock form-control-feedback" style="top: 9px;left: -25px;color: #6c757d;"></span>
                        </div>

                        <div>
                            <button type="submit" class="btn btn-default btn-block btn-flat" style="background-color:#18479D;color:#ffffff;">{!! Lang::get("lang.login") !!}</button>
                        </div>

                        <div class="row mt-2">

                            <div class="col-sm-6">

                                <div>
                                    
                                    <label>
                                        
                                        <input type="checkbox" name="remember"> {!! Lang::get("lang.remember") !!}
                                    </label>
                                </div>
                            </div>
                            
                            <div class="col-sm-6">
                 
                                <a href="{{url('password/email')}}">{!! Lang::get("lang.iforgot") !!}</a><br> 
                            </div>
                            
                           
                        </div>

                        <div>
                            @include('themes.default1.client.layout.social-login')
                        </div>

                    {!! Form::close()!!}  
                </div>
            </div>
        </div>
    </div>
@stop
