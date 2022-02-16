@extends('themes.default1.agent.layout.agent')

@section('Users')
class="nav-link active"
@stop

@section('user-bar')
class="nav-link active"
@stop

@section('user')
class="active"
@stop

@section('user-directory')
class="nav-link active"
@stop

@section('HeadInclude')
@stop
<!-- header -->
@section('PageHeader')
<h1>{{Lang::get('lang.user_directory')}}</h1>
@stop
<!-- /header -->
<!-- breadcrumbs -->
@section('breadcrumbs')
<ol class="breadcrumb">
</ol>
@stop
<!-- /breadcrumbs -->
<!-- content -->
@section('content')
<!-- open a form -->

<!-- check whether success or not -->
@if(Session::has('success'))
<div class="alert alert-success alert-dismissable">
    <i class="fa  fa-check-circle"></i>
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
    {{Session::get('success')}}
</div>
@endif
<!-- failure message -->
@if(Session::has('warning'))
<div class="alert alert-warning alert-dismissable">
    <i class="fa fa-ban"></i><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
    <b>{!! Lang::get('lang.alert') !!} !</b>            
    {{Session::get('warning')}}
</div>
@endif
<!-- failure message -->
@if(Session::has('fails'))
<div class="alert alert-danger alert-dismissable">
    <i class="fa fa-ban"></i><button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
    <b>{!! Lang::get('lang.alert') !!} !</b>            
    {{Session::get('fails')}}
</div>
@endif
<?php

$user= DB::table('users')->where('active', '=', 1)->where('role','!=','user')
->where('is_delete', '=', 0)
->select('user_name', 'email', 'mobile', 'active', 'updated_at',
 'role', 'id', 'last_name', 'country_code', 'phone_number')
 ->orderBy('id', 'ASC')
 ->paginate(20);  
   

?>
<div class="card card-light">

    <div class="card-header">
        
        <h3 class="card-title">Reassign ticket</h3>
 
    </div>
    
    <div class="card-body">
    <div class=" table-responsive mailbox-messages" id="refresh2">
                    <p style="display:none;text-align:center;" id="show2" class="text-red"><b>Loading...</b></p>
                    <!-- table -->
                    <table class="table table-bordered" style="height:100%; width: 100%; white-space: nowrap;margin-left:16px;" id="chumper">
                        <thead>
                        <tr>
                        
                        <th>
                           Sr.no
                        </th>
                        <th>
                          Name
                        </th>
                        <th>
                            Email
                        </th>
                        <th>Phone</th>
                        <th>
                            Status
                        </th>
                        <th>
                           Last Login
                        </th>
                        <th>
                          Role
                        </th> 
                        <th>
                           Action
                        </th>
                        </tr>
                        </thead>
                        <tbody>
                            <?php $i=1;?>
                            @foreach($user as $row)
                            <tr >
                                <td><?php echo $i++; ?></td>
                                <td>{{$row->user_name}}</td>
                                 <td>{{$row->email}}</td>
                                 <td>{{$row->mobile}}</td>
                                 <td>@if($row->active == 1)
                                 <button class="btn btn-success btn-xs">Active</button>
                                 @else
                                 <button class="btn btn-success btn-xs">Inactive</button>
                                 @endif
                                </td>
                                <td>{{$row->updated_at}}</td>
                                <td>{{$row->role}}</td> 
                                <td>@if(isset($row->active) && $row->active == 1) 
                             <a class="btn btn-primary btn-xs" href="{{url('../ticket/reassign/'.$row->id. '/' . $id )}}">Reassign</a>
                                    @endif
                                </td> 

                            </tr>
                            @endforeach
                        </tbody>
                    </table><!-- /.table -->
                   
                </div><!-- /.mail-box-messages -->
              </div>

    </div>
</div>

<!-- /content -->
 
   
<script>
      $(document).ready( function () { 
        $('#chumper').DataTable(); 
     } );  
         
    $(function() {
        //Enable check and uncheck all functionality
        $(".checkbox-toggle").click(function() {
            var clicks = $(this).data('clicks');
            if (clicks) {
                //Uncheck all checkboxes
                $(".mailbox-messages input[type='checkbox']").iCheck("uncheck");
                $(".far", this).removeClass("fa-check-square").addClass('fa-square');
            } else {
                //Check all checkboxes
                $(".mailbox-messages input[type='checkbox']").iCheck("check");
                $(".far", this).removeClass("fa-square").addClass('fa-check-square');
            }
            $(this).data("clicks", !clicks);
        });
    });

    $(function() {
        // Enable check and uncheck all functionality
        $(".checkbox-toggle").click(function() {
            var clicks = $(this).data('clicks');
            if (clicks) {
                //Uncheck all checkboxes
                $("input[type='checkbox']", ".mailbox-messages").iCheck("uncheck");
            } else {
                //Check all checkboxes
                $("input[type='checkbox']", ".mailbox-messages").iCheck("check");
            }
            $(this).data("clicks", !clicks);
        });
    });

    $(document).ready(function() { /// Wait till page is loaded
        $('#click1').click(function() {
            $('#refresh1').load('mytickets #refresh1');
            $('#refresh21').load('mytickets #refresh21');
            $("#show1").show();
        });
    });

    $(document).ready(function() { /// Wait till page is loaded
        $('#click2').click(function() {
            $('#refresh2').load('mytickets #refresh2');
            $('#refresh22').load('mytickets #refresh22');
            $("#show2").show();
        });
    });

</script> 
@stop