@php
    $filename="Dump_Master.xls";
   header("Content-type: application/octet-stream");
   header("Content-type: application/vnd-ms-excel");
    header("Content-Disposition: attachment; filename=".$filename);
    header("Pragma: no-cache");
    header("Expires: 0");
   @endphp
    <?php
      if(isset($loc1)){
                    $loc = $loc1;
        } else{
                $loc= isset($loc1)?$loc1:'All Regions';
                    
            }
            $company = DB::table('settings_company')->select('company_name')->first();
    ?>
   
          
    <table style="background-color: #18479D;color:#FFFFFF">
        <tr><td colspan="6">{{$company->company_name}}:<?php echo $loc;?>

        </td>
           <td colspan="6">Start Date:{{$date1}}  &nbsp;&nbsp;&nbsp;&nbsp;End Date:{{$date2}}</td> <td colspan="12"></td>
        </tr>
       <tr><td colspan="6">Esclation Date:{{$date}}</td><td colspan="6">Time:{{$time}}</td> <td colspan="12"></td></tr>
    </table>


<table border="1">
    <thead>
        <tr>
        <th>Ticket</th>
        <th>Reference</th>
        <th>Patient Name</th>
        <th>Member No</th>
        <th>Subject</th>
        <th>Date Logged</th>
        <th>Logged By</th>
        <th>Esclated To</th>
        <th>Service</th>
        <th>Service Issue</th> 
        <th>Date In-Progress</th>
        <th>In-Progress By</th>
        <th>Date Resolved</th>
        <th>Resolved By</th>
        <th>Date Closed</th>
        <th>Closed By</th>
        <th>Location Name</th>
        <th>Scheme</th>
        <th>Status</th> 
        <th>Member Type</th> 
         <th>Reported Via</th>
    </tr>
    </thead>
    @foreach($report as $row)
            @php
            $ticketStatus = \DB::table('ticket_status')->select('name')->where('id',$row->status)->first();
            $subject = \DB::table('ticket_thread')->select('title','body')->where('ticket_id',$row->id)->first();
            $comment = \DB::table('ticket_thread')->select('body')->where('ticket_id',$row->id)->latest()->first();
            $reportedVia = \DB::table('reported_table')->select('name')->where('id',$row->reported_by)->first();
            $service = App\Model\helpdesk\Agent\Service::find($row->service);
            $firstdata = \App\Model\helpdesk\Agent\EsclationMatrix::where('companyservice',trim($service->service_name))->first();
            $esclated_email = isset($firstdata->email1)?$firstdata->email1:'';
            $logged_by = \App\User::find($row->user_id);
            $status_updatedBy = \App\User::find($row->status_updated_by);
            @endphp
    <tbody>
        <tr>
            <td>{{$row->id}}</td>
            <td>{{$row->ticket_number}}</td>
            <td>{{$row->client_name}}</td>
            <td>{{$row->member_no}}</td>
            <td>{{isset($subject->title)?$subject->title:''}}</td>
            <td>{{$row->created_at}}</td>
            <td>{{isset($logged_by->first_name)?$logged_by->first_name:''}}</td>
            <td>{{isset($esclated_email)?$esclated_email:''}}</td>
            <td>{{isset($service->service_name)?$service->service_name:''}}</td>
            <td>{{$row->service_issue}}</td>
            <!--td>system tat</td-->
            <td>@if(isset($row->status) && $row->status=='8')
                 {{ date('d-m-Y h:i:s',strtotime($row->updated_at))}}
                @endif
            </td>
            <td>@if(isset($status_updatedBy) && $row->status=='8')
                 {{ $status_updatedBy->first_name." ".$status_updatedBy->last_name}}
                @endif
            </td>
            <td>@if(isset($row->status) && $row->status=='2')
                 {{ date('d-m-Y h:i:s',strtotime($row->updated_at))}}
                @endif
            </td> 
            <td>@if(isset($status_updatedBy) && $row->status=='2')
                 {{ $status_updatedBy->first_name." ".$status_updatedBy->last_name}}
                @endif
            </td>
            <td>@if(isset($row->status) && $row->status=='3')
                {{date('d-m-Y h:i:s',strtotime($row->closed_at))}}
                @endif
            </td>
            <td>@if(isset($status_updatedBy) && $row->status=='3')
                 {{ $status_updatedBy->first_name." ".$status_updatedBy->last_name}}
                @endif
            </td>
            <td>{{$row->company_location}}</td>
             <td>{{$row->scheme}}</td>
             <td>{{$ticketStatus->name}}</td>
             <!--td>{{strip_tags($comment->body)}}</td-->
             <td>{{$row->member_type}}</td> 
            <td>{{isset($reportedVia->name)?$reportedVia->name:''}}</td>

       </tr>

    </tbody>
    @endforeach


</table>