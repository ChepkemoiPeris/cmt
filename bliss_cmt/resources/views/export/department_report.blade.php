@php
   $filename="Department.xls";
   header("Content-type: application/octet-stream");
   header("Content-type: application/vnd-ms-excel");
    header("Content-Disposition: attachment; filename=".$filename);
    header("Pragma: no-cache");
    header("Expires: 0");
   @endphp
    <?php
        if(isset($loc1) && isset($loc2) && isset($loc3) ){
                    $loc = $loc1.", ".$loc2." ,".$loc3;
        } else{
                $loc= isset($loc1)?$loc1:'';
                    
            }
        $company = DB::table('settings_company')->select('company_name')->first();
    ?> 

     <table style="background-color: #18479D;color:#FFFFFF">
        <tr><td colspan="7">{{$company->company_name}}:<?php echo $loc;?></td></tr>
        <tr> <td>Pending Escalations by Departments</td><td></td><td></td><td>Run Date:{{$date}}</td><td></td><td>Time:{{$time}}</td><td></td></tr>
        <tr> <td></td><td></td><td></td><td>Start Date:{{$date1}}</td><td></td><td>End Date:{{$date2}}</td>   <td></td></tr>
       <tr><td colspan="7"><center>Logged Issues</center></td></tr>
       <tr><td>Department</td><td>Status</td><td> 0-7 Days</td><td>7-15 Days</td><td>16-30 Days</td><td>>30 Days</td><td>Total Issues</td></tr>
    </table>
    
    <table border="1">
      
  
    @foreach($department as $row)
     
       @php
        $open = ($row->Open)+($row->OPen_7_15)+($row->OPen_16_30)+($row->OPen_30);
        $resolved = ($row->Resolved)+($row->Resolved_7_15)+($row->Resolved_16_30)+($row->Resolved_30);
        $closed = ($row->Closed)+($row->Closed_7_15)+($row->Closed_16_30)+($row->Closed_30);
        $progressed =($row->Progress)+($row->Progress_7_15)+($row->Progress_16_30)+($row->Progress_30);
        $rowtotal = $open+$resolved+$closed+$progressed;
       @endphp

    <tr>
    <td rowspan="5" valign="middle">{{$row->service_name}}</td>
    <td>Open </td><td>{{$row->Open}}</td><td>{{$row->OPen_7_15}}</td><td>{{$row->OPen_16_30}}</td><td>{{$row->OPen_30}}</td>
     <td>{{$open}}</td>
    </tr>

    <tr>
    <td>Inprogress </td> <td>{{$row->Progress}}</td><td>{{$row->Progress_7_15}}</td><td>{{$row->Progress_16_30}} </td><td>{{$row->Progress_30}} </td><td>{{$progressed}} </td>
   </tr>



    <tr>
    <td>Resolved </td> <td>{{$row->Resolved}}</td><td>{{$row->Resolved_7_15}}</td><td>{{$row->Resolved_16_30}} </td><td>{{$row->Resolved_30}} </td><td>{{$resolved}} </td>
   </tr>

    <tr>
    <td>Closed </td><td>{{$row->Closed}}</td><td>{{$row->Closed_7_15}}</td><td>{{$row->Closed_16_30}}</td><td>{{$row->Closed_30}}</td>
    <td>{{$closed}}</td>
   </tr>

   <tr>
     <td>Total</td> <td>{{$row->Open+$row->Resolved+$row->Closed+$row->Progress}}</td>  <td>{{$row->OPen_7_15+$row->Resolved_7_15+$row->Closed_7_15+$row->Progress_7_15}} </td> 
     <td>{{$row->OPen_16_30+$row->Resolved_16_30+$row->Closed_16_30+$row->Progress_16_30}}</td>  <td>{{$row->OPen_30+$row->Resolved_30+$row->Closed_30+$row->Progress_30}}</td>
     <td>{{$rowtotal}}</td>
   </tr>
  @endforeach

</table>

 
    <table border="1">
        <tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>
    </table>
    <!--Total and Grand Total -->
    <?php
        $count7daysTotal=0;$count7_15daysTotal=0;$count16_30daysTotal=0;$countgreater_30daysTotal=0;
        $totalopen=0;$totalresolved=0;$totalclosed=0; $totalprogress=0; $grandtotal=0;

        $openseven_days=0;$progress_seven_days=0;$resolvedseven_days=0;$closedseven_days=0;
        $openseven15_days=0;$progress_seven15_days=0;$resolvedseven15_days=0;$closedseven15_days=0;
        $open16_30_days=0;$progress_16_30_days=0;$resolved16_30_days=0;$closed16_30_days=0;
        $openmore_30_days=0;$progressmore_30_days=0;$resolvedmore_30_days=0;$closedmore_30_days=0;

        foreach($department as $val) {
       
         $openseven_days = $openseven_days+$val->Open;
         $resolvedseven_days = $resolvedseven_days+$val->Resolved;
         $closedseven_days = $closedseven_days+$val->Closed;
         $progress_seven_days = $progress_seven_days+$val->Progress;

         $openseven15_days = $openseven15_days+$val->OPen_7_15;
         $resolvedseven15_days = $resolvedseven15_days+$val->Resolved_7_15;
         $closedseven15_days = $closedseven15_days+$val->Closed_7_15;
         $progress_seven15_days = $progress_seven15_days+$val->Progress_7_15;

         $open16_30_days = $open16_30_days+$val->OPen_16_30;
         $resolved16_30_days = $resolved16_30_days+$val->Resolved_16_30;
         $closed16_30_days = $closed16_30_days+$val->Closed_16_30;
         $progress_16_30_days = $progress_16_30_days+$val->Progress_16_30;

         $openmore_30_days = $openmore_30_days+$val->OPen_30;
         $resolvedmore_30_days = $resolvedmore_30_days+$val->Resolved_30;
         $closedmore_30_days = $closedmore_30_days+$val->Closed_30;
         $progressmore_30_days = $progressmore_30_days+$val->Progress_30;

          $totalopen = $openseven_days+$openseven15_days+$open16_30_days+$openmore_30_days;
          $totalresolved = $resolvedseven_days+$resolvedseven15_days+$resolved16_30_days+$resolvedmore_30_days;
          $totalclosed = $closedseven_days+$closedseven15_days+$closed16_30_days+$closedmore_30_days;
          $totalprogress = $progress_seven_days+$progress_seven15_days+$progress_16_30_days+$progressmore_30_days;

         



         
        }
        $count7daysTotal=$openseven_days+$resolvedseven_days+$closedseven_days+$progress_seven_days;
        $count7_15daysTotal=$openseven15_days+$resolvedseven15_days+$closedseven15_days+$progress_seven15_days;
        $count16_30daysTotal=$open16_30_days+$resolved16_30_days+$closed16_30_days+$progress_16_30_days;
        $countgreater_30daysTotal=$openmore_30_days+$resolvedmore_30_days+$closedmore_30_days+$progressmore_30_days;
       

        $grandtotal = $totalopen+$totalresolved+$totalclosed+$totalprogress;


    ?>

    <table border="0" style="background-color: #D3D3D3;">
    <tr>
    <td rowspan="4" valign="top"><strong>Total</strong></td>
    <td><strong>Open </strong></td>  <td><strong>{{$openseven_days}}</strong></td>  <td><strong>{{$openseven15_days}}</strong></td> <td><strong>{{$open16_30_days}}</strong></td>  <td><strong>{{$openmore_30_days}}</strong></td>
     
    <td><strong>{{$totalopen}}</strong></td>
    </tr>

    <tr>
    <td><strong>Inprogress<strong> </td> <td><strong>{{$progress_seven_days}}</strong></td><td><strong>{{$progress_seven15_days}}</strong></td>
    <td><strong>{{$progress_16_30_days}}</strong></td><td><strong>{{$progressmore_30_days}}</strong></td>
    <td><strong>{{$totalprogress}}</strong> </td>
   </tr>   


    <tr>
    <td><strong>Resolved<strong> </td> <td><strong>{{$resolvedseven_days}}</strong></td><td><strong>{{$resolvedseven15_days}}</strong></td>
    <td><strong>{{$resolved16_30_days}}</strong></td><td><strong>{{$resolvedmore_30_days}}</strong></td>
    <td><strong>{{$totalresolved}}</strong> </td>
   </tr>

    <tr>
    <td><strong>Closed</strong></td><td><strong>{{$closedseven_days}}</strong></td><td><strong>{{$closedseven15_days}}</strong></td>
    <td><strong>{{$closed16_30_days}}</strong></td><td><strong>{{$closedmore_30_days}}</strong></td>
    <td><strong>{{$totalclosed}}</strong></td>
   </tr>
  </table>
    <!-- Grand total show-->
    <table style="background-color: #D3D3D3;border:1px solid black;">    
   <tr>
    <td><strong>Grand Total</strong></td>  <td></td> <td><strong>{{2*($count7daysTotal)}}</strong></td> <td><strong>{{2*($count7_15daysTotal)}}</strong></td><td><strong>{{2*($count16_30daysTotal)}}</strong></td>
    <td><strong>{{2*($countgreater_30daysTotal)}}</strong></td><td><strong>{{2*($grandtotal)}}</strong></td>
   </tr>
    
    </table>
  

