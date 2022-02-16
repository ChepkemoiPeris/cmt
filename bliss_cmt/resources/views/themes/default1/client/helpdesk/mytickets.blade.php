@extends('themes.default1.client.layout.client')

@section('title')
My Tickets -
@stop

@section('myticket')
class="nav-item active"
@stop

@section('content')
<style type="text/css">
    .table th {
            border-top: none !important;
    }
</style>
<!-- Main content -->
<div id="content" class="site-content col-md-12" style="margin-top: 20px;">
    <?php

          
               $open = \DB::table('tickets')
                        ->join('client_result as cr','cr.ticket_id','=','tickets.id')
                        ->leftJoin('users','users.id','=','tickets.user_id')
                        ->leftJoin('ticket_status as ts','ts.id','=','tickets.status')
                        ->leftJoin('services as s','s.id','=','cr.service') 
      
                         ->leftJoin('ticket_priority as tp','tp.priority_id','=','tickets.priority_id')
                       ->select('tickets.id','tickets.ticket_number','tickets.user_id','tickets.dept_id','tickets.created_at',
                      'tickets.status','tickets.assigned_to','tickets.status','tickets.is_deleted','tickets.closed',
                      'tickets.priority_id','tickets.updated_at','cr.mobile_no','cr.service','cr.service_issue','cr.client_name','s.service_name','ts.name','users.mobile','tp.priority',
                     
                     )
                     ->Where('tickets.status','!=',5)->where('user_id','=',Auth::user()->id)
                     ->orderBy('tickets.id', 'DESC')
                     ->paginate(20); 
    ?>
    <?php 
              $close = \DB::table('tickets')
              ->join('sent_email_level1 as e','e.ticket_id','=','tickets.id')
            ->select('tickets.id','tickets.ticket_number','tickets.user_id','tickets.dept_id',
             'tickets.status','tickets.assigned_to','tickets.status','tickets.is_deleted','tickets.closed',
             'tickets.priority_id','tickets.updated_at',
             'e.esclated1_email_user_id')
           ->where('e.esclated1_email_user_id',Auth::user()->email)
           ->where('status', '=', 3)
            ->orderBy('tickets.id', 'DESC')
            ->paginate(20);
            $resolve = \DB::table('tickets')
                 ->join('sent_email_level1 as e','e.ticket_id','=','tickets.id')
               ->select('tickets.id','tickets.ticket_number','tickets.user_id','tickets.dept_id',
                'tickets.status','tickets.assigned_to','tickets.status','tickets.is_deleted',
                'tickets.priority_id','tickets.updated_at',
                'e.esclated1_email_user_id')
               ->where('e.esclated1_email_user_id',Auth::user()->email)
               ->where('status', '=', 2)
               ->orderBy('tickets.id', 'DESC')
               ->paginate(20);



    ?>
    <div class="nav-tabs-custom">

        <ul class="nav nav-tabs">
           
            <li class="nav-item">
                
            <a style="cursor: pointer;" class="nav-link text-dark active" href="#tab_1" data-toggle="tab">
                
                    <b>{!! Lang::get('lang.opened') !!}</b>
                
                    <span class="badge badge-pill" style="background: #337ab7; color: white;">{!! $open->total() !!}</span>
                
                </a>
            </li>
            @if(Auth::user()->role == 'admin' || Auth::user()->role == 'agent' || Auth::user()->role == 'agent1')
            <li class="nav-item">
                
                <a style="cursor: pointer;" class="nav-link text-dark" href="#tab_2" data-toggle="tab">
                
                    <b>{!! Lang::get('lang.closed') !!}</b>
                
                    <span class="badge badge-pill" style="background: #337ab7; color: white;">{!! $close->total() !!}</span>
                
                </a>
            </li>
            </li>
            <li class="nav-item">
                
                <a style="cursor: pointer;" class="nav-link text-dark" href="#tab_3" data-toggle="tab">
                
                    <b>{!! Lang::get('lang.resolved') !!}</b>
                
                    <span class="badge badge-pill" style="background: #337ab7; color: white;">{!!$resolve->total()!!}</span>
                
                </a>
            </li> 
            @endif
            @if(Auth::user()->role == 'user')
            <li class="nav-item">
                
                <a style="cursor: pointer;" class="nav-link text-dark" href="#tab_4" data-toggle="tab">
                
                    <b>{!! Lang::get('lang.search') !!}</b>
                
                    <span class="badge badge-pill" style="background: #337ab7; color: white;"></span>
                
                </a>
            </li>
           @endif

        </ul>

        <div class="tab-content">
        <div class="tab-pane active" id="tab_1">
                
                {!! Form::open(['route'=>'select_all','method'=>'post']) !!}
                <div class="mailbox-controls mt-3">
                    <!-- Check all button -->
                     @if(Auth::user()->role == 'agent')
                    
<!--                     <div class="float-right" id="refresh21">
                        {!! $open->count().'-'.$open->total(); !!}
                    </div> -->
                    @endif

                </div>
 
                <div class=" table-responsive mailbox-messages"  id="refresh1">
                    <p style="display:none;text-align:center;" id="show1" class="text-red"><b>Loading...</b></p>
                    <!-- table -->
                    <table class="table table-bordered" style="height:100%; width: 100%; white-space: nowrap;margin-left:16px;" >
                        <thead>
                        <tr>
                        
                        <th>
                           Sr.no
                        </th>
                        <th>
                            {!! Lang::get('lang.ticket_id') !!}
                        </th>
                        <th>Patient Name</th>
                        <th>
                            Service
                        </th>
                        <th>
                            Service Issue
                        </th>
                        <th>
                            {!! Lang::get('lang.priority') !!}
                        </th>
                        <th>
                            Mobile
                        </th>
                        <th>
                            Created at
                        </th>
                        
                        <th>
                            {!! Lang::get('lang.status') !!}
                        </th>
                        
                        </tr>
                        </thead>
                        <tbody>
                            <?php $i=1;?>
                            @foreach($open as $row)
                                
                            <tr>
                                <td><?php echo $i++; ?></td>
                                <td>{{'#'.$row->ticket_number}}</td>
                                 <td>{{$row->client_name}}</td>
                                 <td>{{$row->service_name}}</td>
                                 <td>{{$row->service_issue}}</td>
                                <td>{{$row->priority}}</td>
                                <td>{{$row->mobile}}</td>
                                <td>{{date('d/m/Y',strtotime($row->created_at))}}</td>
                                <td>{{$row->name}}</td> 
                                 
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                    <div class="float-right">
                      <?php echo $open->setPath(url('mytickets'))->render(); ?>
                    </div> 
                </div><!-- /.mail-box-messages -->
                {!! Form::close() !!}
            </div><!-- /.box-body -->
            {{-- /.tab_1 --}}
            <div class="tab-pane" id="tab_2">
                {!! Form::open(['route'=>'select_all','method'=>'post']) !!}
                <div class="mailbox-controls mt-3">
                    <!-- Check all button -->
                     @if(Auth::user()->role == 'agent')
                   
                    <!-- <div class="float-right" id="refresh22">
                        {!! $close->count().'-'.$close->total(); !!}
                    </div> -->
                    @endif
                </div>
                <div class=" table-responsive mailbox-messages" id="refresh2">
                    <p style="display:none;text-align:center;" id="show2" class="text-red"><b>Loading...</b></p>
                    <!-- table -->
                    <table class="table table-hover table-striped">
                        <thead>
                        
                        <th>
                            {!! Lang::get('lang.subject') !!}
                        </th>
                        <th>
                            {!! Lang::get('lang.ticket_id') !!}
                        </th>
                        <th>
                            {!! Lang::get('lang.priority') !!}
                        </th>
                        <!-- <th>
                            {!! Lang::get('lang.last_replier') !!}
                        </th> -->
                        <th>
                            {!! Lang::get('lang.closed_date') !!}
                        </th>
                        <th>
                            {!! Lang::get('lang.status') !!}
                        </th>
                        </thead>
                        <tbody id="hello">
                            @foreach ($close  as $ticket )
                            <tr>
                                
                                <?php
                                $title = App\Model\helpdesk\Ticket\Ticket_Thread::where('ticket_id', '=', $ticket->id)->first();
                                $string = strip_tags($title->title);
                                if (strlen($string) > 40) {
                                    $stringCut = substr($string, 0, 40);
                                    $string = substr($stringCut, 0, strrpos($stringCut, ' ')) . ' ...';
                                }
                                $TicketData = App\Model\helpdesk\Ticket\Ticket_Thread::where('ticket_id', '=', $ticket->id)->max('id');
                                $TicketDatarow = App\Model\helpdesk\Ticket\Ticket_Thread::where('id', '=', $TicketData)->first();
                                $LastResponse = App\User::where('id', '=', $TicketDatarow->user_id)->first();

                                if (isset($LastResponse->role) && $LastResponse->role == "user") {
                                    $rep = "#F39C12";
                                    $username = $LastResponse->user_name;
                                } else {
                                    $rep = "#000";
                                    $username = @$LastResponse->first_name . " " . @$LastResponse->last_name;
                                    if (isset($LastResponse->first_name) && $LastResponse->first_name == null || isset($LastResponse->last_name) && $LastResponse->last_name == null) {
                                        $username = $LastResponse->user_name;
                                    }
                                }
                                $titles = App\Model\helpdesk\Ticket\Ticket_Thread::where('ticket_id', '=', $ticket->id)->where("is_internal", "=", 0)->get();
                                $count = count($titles);
                                foreach ($titles as $title) {
                                    $title = $title;
                                }
                                ?>
                                <td class="mailbox-name"><a href="{!! URL('check_ticket',[Crypt::encrypt($ticket->id)]) !!}" title="{!! $title->title !!}">{{$string}}   </a> ({!! $count!!}) <i class="fas fa-comment"></i></td>

                                <td class="mailbox-Id">#{!! $ticket->ticket_number !!}</td>

                                <?php $priority = App\Model\helpdesk\Ticket\Ticket_Priority::where('priority_id', '=', $ticket->priority_id)->first(); ?>
                                <td class="mailbox-priority"><spam>{{$priority->priority}}</spam></td>

                       

                        <td class="mailbox-last-activity">{!! $ticket->updated_at !!}</td>
                        <?php $status = App\Model\helpdesk\Ticket\Ticket_Status::where('id', '=', $ticket->status)->first(); 

                        ?>
                        <td class="mailbox-date">{!! $status->name !!}</td>
                        </tr>
                        @endforeach
                        </tbody>
                    </table><!-- /.table -->
                    <div class="float-right">
                        <?php echo $close->setPath(url('mytickets'))->render(); ?>&nbsp;
                    </div>
                </div><!-- /.mail-box-messages -->
                {!! Form::close() !!}
            </div>
            <!--tab3-->
            <div class="tab-pane" id="tab_3">
                {!! Form::open(['route'=>'select_all','method'=>'post']) !!}
                <div class="mailbox-controls mt-3">
                    <!-- Check all button -->
                     @if(Auth::user()->role == 'agent')
                   
                  <!--   <div class="float-right" id="refresh22">
                        {!! $close->count().'-'.$close->total(); !!}
                    </div> -->
                    @endif
                </div>
                <div class=" table-responsive mailbox-messages" id="refresh2">
                    <p style="display:none;text-align:center;" id="show2" class="text-red"><b>Loading...</b></p>
                    <!-- table -->
                    <table class="table table-hover table-striped">
                        <thead>
                        
                        <th>
                            {!! Lang::get('lang.subject') !!}
                        </th>
                        <th>
                            {!! Lang::get('lang.ticket_id') !!}
                        </th>
                        <th>
                            {!! Lang::get('lang.priority') !!}
                        </th>
                        <!-- <th>
                            {!! Lang::get('lang.last_replier') !!}
                        </th> -->
                        <th>
                            {!! Lang::get('lang.resolved_date') !!}
                        </th>
                        <th>
                            {!! Lang::get('lang.status') !!}
                        </th>
                        </thead>
                        <tbody id="hello">
                            @foreach ($resolve  as $ticket )
                            <tr>
                                
                                <?php
                                $title = App\Model\helpdesk\Ticket\Ticket_Thread::where('ticket_id', '=', $ticket->id)->first();
                                $string = strip_tags($title->title);
                                if (strlen($string) > 40) {
                                    $stringCut = substr($string, 0, 40);
                                    $string = substr($stringCut, 0, strrpos($stringCut, ' ')) . ' ...';
                                }
                                $TicketData = App\Model\helpdesk\Ticket\Ticket_Thread::where('ticket_id', '=', $ticket->id)->max('id');
                                $TicketDatarow = App\Model\helpdesk\Ticket\Ticket_Thread::where('id', '=', $TicketData)->first();
                                $LastResponse = App\User::where('id', '=', $TicketDatarow->user_id)->first();

                                if (isset($LastResponse->role) && $LastResponse->role == "user") {
                                    $rep = "#F39C12";
                                    $username = $LastResponse->user_name;
                                } else {
                                    $rep = "#000";
                                    $username = @$LastResponse->first_name . " " . @$LastResponse->last_name;
                                    if (isset($LastResponse->first_name) && $LastResponse->first_name == null || isset($LastResponse->last_name) && $LastResponse->last_name == null) {
                                        $username = $LastResponse->user_name;
                                    }
                                }
                                $titles = App\Model\helpdesk\Ticket\Ticket_Thread::where('ticket_id', '=', $ticket->id)->where("is_internal", "=", 0)->get();
                                $count = count($titles);
                                foreach ($titles as $title) {
                                    $title = $title;
                                }
                                ?>
                                <td class="mailbox-name"><a href="{!! URL('check_ticket',[Crypt::encrypt($ticket->id)]) !!}" title="{!! $title->title !!}">{{$string}}   </a> ({!! $count!!}) <i class="fas fa-comment"></i></td>

                                <td class="mailbox-Id">#{!! $ticket->ticket_number !!}</td>

                                <?php $priority = App\Model\helpdesk\Ticket\Ticket_Priority::where('priority_id', '=', $ticket->priority_id)->first(); ?>
                                <td class="mailbox-priority"><spam>{{$priority->priority}}</spam></td>

                       

                        <td class="mailbox-last-activity">{!! $ticket->updated_at !!}</td>
                        <?php $status = App\Model\helpdesk\Ticket\Ticket_Status::where('id', '=', $ticket->status)->first(); ?>
                        <td class="mailbox-date">{!! $status->name !!}</td>
                        </tr>
                        @endforeach
                        </tbody>
                    </table><!-- /.table -->
                    <div class="float-right">
                        <?php echo $close->setPath(url('mytickets'))->render(); ?>&nbsp;
                    </div>
                </div><!-- /.mail-box-messages -->
                {!! Form::close() !!}
            </div> 
         
            <div class="tab-pane" id="tab_4">
               

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
                            {!! Lang::get('lang.ticket_id') !!}
                        </th>
                        <th>Patient Name</th>
                        <th>
                            Service
                        </th>
                        <th>
                            Service Issue
                        </th>
                        <th>
                            {!! Lang::get('lang.priority') !!}
                        </th>
                        <th>
                            Mobile
                        </th>
                        <th>
                            Created at
                        </th>
                        
                        <th>
                            {!! Lang::get('lang.status') !!}
                        </th>
                        <th>
                           Action
                        </th>
                        </tr>
                        </thead>
                        <tbody>
                            <?php $i=1;?>
                            @foreach($search as $row)
                            <tr>
                                <td><?php echo $i++; ?></td>
                                <td>{{'#'.$row->ticket_number}}</td>
                                 <td>{{$row->client_name}}</td>
                                 <td>{{$row->service_name}}</td>
                                 <td>{{$row->service_issue}}</td>
                                <td>{{$row->priority}}</td>
                                <td>{{$row->mobile}}</td>
                                <td>{{date('d/m/Y',strtotime($row->created_at))}}</td>
                                <td>{{$row->name}}</td>
                                <td>@if(isset($row->status) && $row->status == 1)
                             <a href="{!! URL('check_ticket',[Crypt::encrypt($row->id)]) !!}"><i class="fas fa-edit" style='font-size:20px;'></i></a>
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
</div>
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