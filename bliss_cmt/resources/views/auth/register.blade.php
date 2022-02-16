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
        <i class="fas fa-check-circle"> </i> <b> {!! Lang::get('lang.success') !!} </b>
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        {{Session::get('status')}}
    </div>
    @endif

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

<div id="content" class="site-content col-md-12">
   
    <div id="corewidgetbox" class="wid">
   
       
    </div>
    
    <div class="col-md-6 offset-md-3 form-helper">
        
        <div class="login-box" style=" width: 490px;"  valign = "center">
            
            <div class="form-border">
     
                <div align="center">
                    
                    <h4 style="background-color: #18479D;"> 
                        <a href="https://www.blissmedicalcentre.com/" class="logo"><img src="{{ asset('company/Blisslogo.jpg')}}" width="100px;"></a>
                    </h4>    
                </div>
               
                <div>
                    
                    <h3 class="box-title" align="center">{{Lang::get('lang.registration')}}</h3>
                </div>   

                <div>
                    
                    <placeholder="Let’s set up your account in just a couple of steps.">
                </div>      

                <!-- form open -->
                {!!  Form::open(['action'=>'Auth\AuthController@postRegister', 'method'=>'post']) !!}

                <!-- fullname -->
                <div class="form-group has-feedback {{ $errors->has('full_name') ? 'has-error' : '' }}" style="display: -webkit-box;">
            
                    {!! Form::text('full_name',null,['placeholder'=>Lang::get('lang.full_name'),'class' => 'form-control']) !!}
                    <span class="glyphicon glyphicon-user form-control-feedback" style="top: 9px;left: -25px;color: #6c757d;"></span>
                </div>

                <!-- Email -->
                @if (($email_mandatory->status == 1 || $email_mandatory->status == '1'))
                <div class="form-group has-feedback {{ $errors->has('email') ? 'has-error' : '' }}" style="display: -webkit-box;">
                    {!! Form::text('email',null,['placeholder'=>Lang::get('lang.email'),'class' => 'form-control']) !!}
                    <span class="glyphicon glyphicon-envelope form-control-feedback" style="top: 9px;left: -25px;color: #6c757d;"></span>
                </div>
                @elseif (($settings->status == 0 || $settings->status == '0') && ($email_mandatory->status == 0 || $email_mandatory->status == '0'))
                <div class="form-group has-feedback {{ $errors->has('email') ? 'has-error' : '' }}" style="display: -webkit-box;">
                    {!! Form::text('email',null,['placeholder'=>Lang::get('lang.email'),'class' => 'form-control']) !!}
                    <span class="glyphicon glyphicon-envelope form-control-feedback" style="top: 9px;left: -25px;color: #6c757d;"></span>
                </div>
                @else
                    {!! Form::hidden('email', null) !!}
                @endif

                @if($settings->status == '1' || $settings->status == 1)
                <div class='row'>
                    <div class="col-md-3">
                        <div class="form-group {{ $errors->has('code') ? 'has-error' : '' }}">
                        {!! Form::text('code',null,['placeholder'=>91,'class' => 'form-control']) !!}
                        </div>    
                    </div>
                    <div class="col-md-9">
                        <div class="form-group has-feedback {{ $errors->has('mobile') ? 'has-error' : '' }}" style="display: -webkit-box;">
                        {!! Form::text('mobile',null,['placeholder'=>Lang::get('lang.mobile'),'class' => 'form-control']) !!}
                        <span class="glyphicon glyphicon-phone form-control-feedback" style="top: 9px;left: -25px;color: #6c757d;"></span>
                        </div>
                    </div>
                </div>
                @else
                    {!! Form::hidden('mobile', null) !!}
                    {!! Form::hidden('code', null) !!}

                @endif

                <div class="form-group has-feedback {{ $errors->has('role') ? 'has-error' : '' }}" style="display: -webkit-box;">
                           
                    <select name="role" class="form-group" style="width:100%;height:35px;border:1px solid #f1d6d6;color:#6e6262">
                        <option value="">Select User</option>
                        <option value="user">User</option>
                        <option value="agent">Agent</option>
                    </select>
                </div>
                @php

                   $servicelist= \App\Model\helpdesk\Agent\Service::all();
                   $companyname = "Bliss medical centre";
                   $data['location'] = \App\Model\helpdesk\Agent_panel\Organization::select('address')->where('name',$companyname)->get();
                   
                @endphp

               <!--  <div class="  {{ $errors->has('department') ? 'has-error' : '' }}" >
                           
                    <select name="dept" class="form-group has-feedback" style="width:100%;height:35px;border:1px solid #f1d6d6;color:#6e6262">
                        <option value="">Select Department</option>
                        @foreach($servicelist as $val)
                        <option value="{{$val->id}}">{{$val->service_name}}</option>
                        @endforeach
                        
                    </select>
                </div> -->


               
                <!-- Password -->
                <div class="form-group has-feedback {{ $errors->has('password') ? 'has-error' : '' }}" style="display: -webkit-box;">
                           
                    {!! Form::password('password',['placeholder'=>Lang::get('lang.password'),'class' => 'form-control']) !!}
                    <span class="glyphicon glyphicon-lock form-control-feedback" style="top: 9px;left: -25px;color: #6c757d;"></span>

                </div>
                <!-- Confirm password -->
                <div class="form-group has-feedback {{ $errors->has('password_confirmation') ? 'has-error' : '' }}" style="display: -webkit-box;">
                           
                    {!! Form::password('password_confirmation',['placeholder'=>Lang::get('lang.retype_password'),'class' => 'form-control']) !!}
                    <span class="glyphicon glyphicon-log-in form-control-feedback" style="top: 9px;left: -25px;color: #6c757d;"></span>

                </div>
                
                <div >
                    
                    <button type="submit" class="btn btn-default btn-block btn-flat" style="background-color:#18479D;color:#ffffff;">{!! Lang::get('lang.register') !!}</button>
                </div>

                <div>
                  
                    <div class="checkbox icheck" align="center">
                        <label class="mb-0">
                           Already got an account? <a href="{{url('auth/login')}}" class="text-center">{!! Lang::get('lang.login') !!}</a>                
                        </label>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            @include('themes.default1.client.layout.social-login')
                        </div>
                    </div>
                </div><!-- /.col --> 
            </div>
        </div>
    </div>
</div>
{!! Form::close()!!}  

@stop
