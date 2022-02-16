@extends('themes.default1.client.layout.client')

@section('title')
{!! Lang::get('lang.submit_a_ticket') !!} -
@stop

@section('submit')
class = "nav-item active"
@stop
<!-- breadcrumbs -->
@section('breadcrumb')
<div class="site-hero clearfix">
    <ol class="breadcrumb breadcrumb-custom">
        <li class="text">{!! Lang::get('lang.you_are_here') !!}: </li>
        <li><a href="{!! URL::route('form') !!}">{!! Lang::get('lang.submit_a_ticket') !!}</a></li>
    </ol>
</div>
@stop
<!-- /breadcrumbs -->
@section('check')


@stop
<!-- content -->
@section('content')

<div id="content" class="site-content col-md-9">

    @if(Session::has('message'))
    <div class="alert alert-success alert-dismissable" style="margin-left:195px;">
        <i class="fas  fa-check-circle"></i>
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        {!! Session::get('message') !!}
    </div>
    @endif


    @if (count($errors) > 0)
    @if(Session::has('check'))
    <?php goto a; ?>
    @endif
    <div>

    </div>
    @if(!Session::has('error'))
    <div class="alert alert-danger alert-dismissable" style="margin-left:200px;margin-top:20px;">
        <i class="fas fa-ban"></i>
        <b>{!! Lang::get('lang.alert') !!} !</b>
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <ul>
            @foreach ($errors->all() as $error)
            <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
    @endif
    <?php a: ?>
    @endif

    <?php
        $encrypter = app('Illuminate\Encryption\Encrypter');
        $encrypted_token = $encrypter->encrypt(csrf_token());
        ?>
    <input id="token" type="hidden" value="{{$encrypted_token}}">

    <article class="hentry">

        <div id="form-border" class="comment-respond"
            style="background : #fff;border:1px solid #18479D;border-top-width: 5px;">

            <section id="section-categories" style="margin-left:12px;margin-right: 12px;">

                <!-- <form action="{{route('form')}}">
                    <p>Search Client</p>
                    <div class="row">

                        <div class="col-md-12 form-group" style="margin-left: 250px;">
                            <strong>Please search by

                                <input type="radio" name="search_by" id="mobilesno"
                                    value="<?php if(isset($search_by) && $search_by =='1') echo $search_by  ?>"
                                    <?php if(isset($search_by) && $search_by =='1'){ echo "checked=checked";}  ?>>Mobile
                                No


                                <input type="radio" name="search_by" id="membersno"
                                    value="<?php if(isset($search_by) && $search_by =='2') echo $search_by  ?>"
                                    <?php if(isset($search_by) && $search_by=='2'){ echo "checked=checked";} ?>>Member
                                No

                                &nbsp;&nbsp;</strong><input type="text" name="search" id="search"
                                placeholder="Mobile No" maxlength="12" style="width:182px;">
                            &nbsp;<span><input type="submit" value="Search" class="btn btn-default"
                                    style="background-color:#18479D;color:#ffffff;" /></span>
                        </div>
                    </div>
                </form> -->

                <!--search result show-->
                <!-- @if(isset($search) )
                <div class="row" style="margin-left: 2px;margin-right: 0px;margin-bottom: 25px;">
                    <table class="table table-striped">
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>Member No</th>
                            <th>Mobile No</th>
                            <th>Member Type</th>
                            <th>Location</th>
                            <th>Visit Date</th>
                            <th>Scheme</th>
                        </tr>
                        @foreach($search as $row)

                        @foreach($row as $val)
                        <tr>
                            <td><input type="radio" name="select_clientdata" class="select_clientdata"
                                    data-cid="{{$val->id}}"></td>
                            <td class="cname">{{$val->client_name}}</td>
                            <td class="memberno">{{$val->member_no}}</td>
                            <td class="mobile_no">{{$val->mobile_no}}</td>
                            <td class="member_type">{{($val->member_type=='0')?'Principal':'Dependent'}}</td>
                            <td class="client_loc">{{$val->location}}</td>
                            <td class="visit_date">{{$val->v_date}}</td>
                            <td class="schema">{{$val->scheme}}</td>

                        </tr>
                        @endforeach
                        @endforeach
                    </table>

                </div>
                @endif -->
                <!--search result show End-->

                {!! Form::open(['action'=>'Client\helpdesk\FormController@postedForm','method'=>'post']) !!}
                <div>
                    <div class="row">

                        <div class="col-md-12"><button type="button" class="col-md-12 text-left btn-default btn-xs"
                                style="background-color:#18479D;color:#ffffff;">Client details</button></div>
                    </div>
                    <div class="row" style="margin-top:30px;">
                        <div class="col-md-3 form-group">
                            <strong>Client Full Name<span class="text-red"> *</span></strong>
                            <input class="form-control input-sm" placeholder="Client First Name"  
                                 name="patientfullname" type="text" id="patientfullname"  >
                        </div>
                        
                        <div class="col-md-2 form-group ">
                            <strong>Member No<span class="text-red"> *</span></strong>
                            <input class="form-control input-sm" placeholder="Member No"  
                                name="memberno" type="text" id="memberno"  >
                        </div>
                        <div class="col-md-2 form-group ">
                            <strong>Mobile No<span class="text-red"> *</span></strong>
                            <input class="form-control input-sm" placeholder="Mobile No"  
                               name="mobiles" type="text" id="mobile"  >

                        </div>
                         
                    </div>

                    <div class="row" style="margin-top: 30pox;">
 
                        <!-- <div class="col-md-3 form-group ">
                            <strong>Recent Visit Date</strong>
                            <input class="form-control input-sm" placeholder="Date" value="10/01/2022" readonly="true"
                                name="recent_visit_date" type="text" id="recent_visit_date">
                        </div> -->
                        <div class="col-md-4 form-group ">
                            <strong>Scheme<span class="text-red"> *</span></strong>
                            <input class="form-control input-sm" placeholder="Scheme"  
                           name="clientschema" type="text" id="clientschema"  >
                        </div>
                    </div>
                    <!--hidden field start-->
                    <div class="row">
                        @if(Auth::user())

                        {!! Form::hidden('Name',Auth::user()->user_name,['class' => 'form-control']) !!}
                        @else
                        <div class="col-md-2 form-group {{ $errors->has('Name') ? 'has-error' : '' }}">
                            {!! Form::label('Name',Lang::get('lang.name')) !!}<span class="text-red"> *</span>
                            {!! Form::text('name',null,['class' => 'form-control']) !!}
                        </div>
                        @endif

                        @if(Auth::user())

                        {!! Form::hidden('Email',Auth::user()->email,['class' => 'form-control']) !!}

                        @else
                        <div class="col-md-2 form-group {{ $errors->has('Email') ? 'has-error' : '' }}">
                            {!! Form::label('Email',Lang::get('lang.email')) !!}

                            {!! Form::email('email',null,['class' => 'form-control']) !!}
                        </div>
                        @endif
                        @if(!Auth::user())

                        <div class="col-md-2 form-group {{ Session::has('country_code_error') ? 'has-error' : '' }}">
                            {!! Form::label('Code',Lang::get('lang.country-code')) !!}
                            @if(isset($email_mandatory->status) == 0 || isset($email_mandatory->status) == '0')
                            <span class="text-red"> *</span>
                            @endif

                            {!! Form::text('Code',null,['class' => 'form-control', 'placeholder' => $phonecode, 'title'
                            => Lang::get('lang.enter-country-phone-code')]) !!}
                        </div>
                        <div class="col-md-2 form-group {{ $errors->has('mobile') ? 'has-error' : '' }}">
                            {!! Form::label('mobile',Lang::get('lang.mobile_number')) !!}
                            @if($email_mandatory->status == 0 || $email_mandatory->status == '0')
                            <span class="text-red"> *</span>
                            @endif
                            {!! Form::text('mobile',null,['class' => 'form-control']) !!}
                        </div>
                        <div class="col-md-2 form-group {{ $errors->has('Phone') ? 'has-error' : '' }}">
                            {!! Form::label('Phone',Lang::get('lang.phone')) !!}
                            {!! Form::text('Phone',null,['class' => 'form-control']) !!}
                        </div>
                        @else
                        {!! Form::hidden('mobile',Auth::user()->mobile,['class' => 'form-control']) !!}
                        {!! Form::hidden('Code',Auth::user()->country_code,['class' => 'form-control']) !!}
                        {!! Form::hidden('Phone',Auth::user()->phone_number,['class' => 'form-control']) !!}

                        @endif
                        <div class="col-md-2">
                            <!--  <?php
                            $forms = App\Model\helpdesk\Form\Forms::get();
                            $helptopic = App\Model\helpdesk\Manage\Help_topic::where('status', '=', 1)->get();
                            ?> -->
                            <input type="hidden" name="helptopic" value="1">
                            <!-- <select name="helptopic" class="form-control" id="selectid">
                                
                                @foreach($helptopic as $topic)
                                <option value="{!! $topic->id !!}">{!! $topic->topic !!}</option>
                                @endforeach
                            </select> -->
                        </div>
                    </div>

                    <!-- priority -->
                    <?php 
                         $Priority = App\Model\helpdesk\Settings\CommonSettings::select('status')->where('option_name','=', 'user_priority')->first(); 
                         $user_Priority=$Priority->status;
                        ?>

                    @if(Auth::user())

                    @if(Auth::user()->active == 1)
                    @if($user_Priority == 1)

                    <div class="col-md-12 form-group">
                        <div class="row">
                            <div class="col-md-1">
                                <label>{!! Lang::get('lang.priority') !!}:</label>
                            </div>
                            <div class="col-md-12">
                                <?php $Priority = App\Model\helpdesk\Ticket\Ticket_Priority::where('status','=',1)->get(); ?>
                                {!! Form::select('priority',
                                ['Priority'=>$Priority->pluck('priority_desc','priority_id')->toArray()],null,['class'
                                => 'form-control select']) !!}
                            </div>
                        </div>
                    </div>
                    @endif
                    @endif
                    @endif
                    <!--hidden field end-->


                    <div class="row">
                        <p style="margin-left:20px;">Ticket</p>
                        <div class="col-md-12"><button type="button" class="col-md-12 text-left btn-default btn-xs"
                                style="background-color:#18479D;color:#ffffff;">Create New Ticket</button></div>
                    </div>

                    <div class="row" style="margin-top: 30px;">
                        <div class="col-md-2 form-group ">
                            <strong>Company<span class="text-red"> *</span></strong>
                            <select name="company" class="form-control" id="selectid" readonly>

                                <option value="1">Bliss Healthcare Limited</option>

                            </select>
                        </div>
                        <div class="col-md-2 form-group">
                            <strong>Client Locations<span class="text-red"> *</span></strong>

                            <select name="company_location" class="form-control" id="client_location">
                                
                                <option value="" selected>Select Centre</option>
                                @foreach($centres as $val)
                                <option value="{{$val->centre}}">{{$val->centre}}</option>
                                @endforeach
                            </select>
                        </div>


                        <div class="col-md-3 form-group ">
                            <strong>Service<span class="text-red"> *</span></strong>

                            <select name="service" class="form-control" id="service">
                                <option value="" selected>Select Service</option>
                                @foreach($servicelist as $val)
                                <option value="{{$val->id}}">{{$val->service_name}}</option>
                                @endforeach

                            </select>
                        </div>
                        <div class="col-md-3 form-group ">
                            <strong>Service Issue<span class="text-red"> *</span></strong>
                            <select name="service_issue" class="form-control" id="service_issue">

                            </select>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-9 form-group ">
                            <strong>Subject</strong><span class="text-red"> *</span>
                            <input class="form-control input-sm" maxlength="50" name="Subject" type="text" id="Subject"
                                value="{{old('Subject')}}">
                        </div>

                        <div class="col-md-3 form-group ">
                            <strong>Reported Via</strong><span class="text-red">*</span>

                            <select name="reported_via" class="form-control" id="reported_via">
                                @foreach($reported as $val)
                                <option value="{{$val->id}}">{{$val->name}}</option>
                                @endforeach
                            </select>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-md-12 form-group ">
                            <strong>Message</strong><span class="text-red"> *</span>
                            <textarea class="form-control input-sm" name="Details"
                                id="Details">{{old('Details')}}</textarea>
                        </div>
                    </div>
                    <div class="row">

                        <div class="col-md-12 form-group"><input style="background-color:#18479D;color:#ffffff;"
                                class="form-group btn btn-default pull-left"
                                onclick="this.disabled=true;this.value=&quot;Sending, please wait...&quot;;this.form.submit();"
                                type="submit" value="Submit"></div>

                    </div>
                </div>
                {!! Form::close() !!}
            </section>
        </div>
    </article>
</div>

<!--
|====================================================
| SELECTED FORM STORED IN SCRIPT
|====================================================
-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $('#service').on('change', function(e) {
        let serviceid = $('#service').val();
        $.ajax({
            type: "get",
            url: "{{url('/get-service')}}",
            data: {
                serviceid: serviceid
            },
            dataType: "json",
            success: function(data) {
                $('#service_issue').empty();
                var select = '<option value="">Select Service Issue</option>'
                $('#service_issue').html(select);
                $.each(data, function(index, val) {
                    $('#service_issue').append('<option value ="' + val
                        .service_issue_name + '">' + val.service_issue_name +
                        '</option>');
                });

            },
            error: function(response) {
                console.log(response);
            }
        })
    })
    $('.select_clientdata').click(function() {

        let clientid = $(this).attr('data-cid');
        var cname = $(this).closest("tr").find(".cname").text();
        var memberno = $(this).closest("tr").find(".memberno").text();
        var mobileno = $(this).closest("tr").find(".mobile_no").text();
        var member_type = $(this).closest("tr").find(".member_type").text();


        var client_loc = $(this).closest("tr").find(".client_loc").text();
        var visit_date = $(this).closest("tr").find(".visit_date").text();
        var schema = $(this).closest("tr").find(".schema").text();


        $('#patientfullname').val(cname);
        $('#memberno').val(memberno);
        $('#mobile').val(mobileno);
        $('#membertype').val(member_type);
        $('#locationname').val(client_loc);
        $('#recent_visit_date').val(visit_date);
        $('#clientschema').val(schema);


    })




});
$('#mobilesno').click(function() {
    $('#mobilesno').prop('checked', true);
    $('#mobilesno').val('1');
    $('#search').attr("placeholder", "Mobile No");

    $('#membersno').prop('checked', false);
    $('#membersno').val('');
})
$('#membersno').click(function() {
    $('#membersno').prop('checked', true);
    $('#membersno').val('2');
    $('#search').attr("placeholder", "Member No");
    $('#mobilesno').prop('checked', false);
    $('#mobilesno').val('');
})



var helpTopic = $("#selectid").val();
send(helpTopic);
$("#selectid").on("change", function() {
    helpTopic = $("#selectid").val();
    send(helpTopic);
});

function send(helpTopic) {
    $.ajax({
        url: "{{url('/get-helptopic-form')}}",
        data: {
            'helptopic': helpTopic
        },
        type: "GET",
        dataType: "html",
        success: function(response) {
            $("#response").html(response);
        },
        error: function(response) {
            $("#response").html(response);
        }
    });

};

$(function() {
    //Add text editor
    $("textarea").summernote({
        height: 200,
        tabsize: 2,
        toolbar: [
            ['style', ['bold', 'italic', 'underline', 'clear']],
            ['font', ['strikethrough', 'superscript', 'subscript']],
            ['fontsize', ['fontsize']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']]
        ]
    });
});
</script>
@stop