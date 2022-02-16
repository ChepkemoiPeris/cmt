@extends('themes.default1.agent.layout.agent')

@section('sidebar')
<li class="nav-header">{!! Lang::get('lang.Report') !!}</li>
<li class="nav-item">
    <a href="" class="nav-link active">
        <i class="fas fa-chart-area"></i> <p>{!! Lang::get('lang.help_topic') !!}</p>
    </a>
</li>
@stop 

@section('Report')
class="nav-link active"
@stop

@section('dashboard-bar')
active
@stop

@section('PageHeader')
@if(Auth::user()->role == 'agent')
<a href="{{url('/')}}">
<i class="fa fa-arrow-left" style='font-size:30px;' aria-hidden="true"></i></a>&nbsp; 
<span>Agent Dashboard</span>
@else
<span>{!! Lang::get('lang.report') !!}</span>
@endif
@stop

@section('dashboard')
class="active"
@stop

@section('content')
<!-- check whether success or not -->
{{-- Success message --}}
@if(Session::has('success'))
<div class="alert alert-success alert-dismissable">
    <i class="fas  fa-check-circle"></i>
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
    {{Session::get('success')}}
</div>
@endif
{{-- failure message --}}
@if(Session::has('fails'))
<div class="alert alert-danger alert-dismissable">
    <i class="fas fa-ban"></i>
    <b>{!! Lang::get('lang.alert') !!}!</b>
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
    {{Session::get('fails')}}
</div>
@endif

<div class="card card-light">
    
     <div class="card-footer">
        <div class="row">
            <div class="col-sm-4">
                <div class="description-block border-right">
                    <h3>
                        <span class="description-percentage text-yellow" >
                            <i class="fas fa-file-alt"> </i> 
                            <small class="text-yellow"><i class="fa fa-random"> </i></small> 
                            <span id="total-inprogress-tickets"> </span> 
                        </span>
                    </h3>
                    <span class="">{!! Lang::get('lang.Currnet_In_Progress') !!}</span>
                    <p>{{isset($in_progress)?$in_progress:''}}</p>
                </div>
               
            </div>
          
            <div class="col-sm-4">
                <div class="description-block border-right">
                    <h3>
                        <span class="description-percentage text-yellow" ><i class="fas fa-file-alt"></i> <small class="text-yellow"><i class="fas fa-sync"> </i>
                        </small> <span id="total-reopen-tickets"> </span> </span>
                    </h3>
                    <span class="">{!! Lang::get('lang.Total_Reopened') !!}</span>
                    <p>{{isset($reopend)?$reopend:''}}</p>
                </div>
               
            </div>
            <!-- /.col -->
            <div class="col-sm-4">
                <div class="description-block">
                    <h3>
                        <span class="description-percentage text-green" ><i class="fas fa-file-alt"> </i> <small class="text-green"><i class="fas fa-times"> </i></small> <span id="total-closed-tickets"> </span> </span>
                    </h3>
                    <span class="">{!! Lang::get('lang.Total_Closed') !!} </span>
                    <p>{{isset($closed)?$closed:''}}</p>
                </div>
               
            </div>
            <!-- /.col -->
        </div>  
    </div>
</div>
<!-- /.box -->

<div >
    <div class="card-header">
        <h3 class="card-title">Reported Filter</h3>
    </div>
    <table>
        <tr>
            <td>
                <form style="display:inline-block" action="{{route('master_dump_report')}}" method="post">
                    @csrf
                    <label> Start Date</label>
                    <input type="date" name="startdatem">
                    <label> End Date</label>
                    <input type="date" name="enddatem"> 
                    <label for="region">Region</label><span class="text-red"> *</span>
                            <select name="regionm" id="regionm">
                                 <optgroup label="Select Region" data-process="1">
                                 <option value="All" selected="selected">All</option>
                                 @foreach($location as $val)
                                <option value="{{$val->address}}">{{$val->address}}</option>
                                 @endforeach
                                </optgroup>

                           </select>
                    
                     
            </td>
        </tr>  


        <tr>
            <td>
                  
                   <input type="submit" class="btn btn-success" name="master_data" value="Master Dump Report">                  
                   <input type="submit" class="btn btn-info" name="department_data" value="Department Report - Comprehensive">
                   <input type="submit" class="btn btn-primary"  name="region_data" id="region_report_sub" value="Regions Report - Comprehensive">
                   <input type="submit" class="btn btn-info" name="reported_vi_data" value="Reported Via Report - Comprehensive"><br></br>
                   <input type="submit" class="btn btn-primary" name="contact_centre" value="Contact Centre Report - Comprehensive">
                   <input type="submit" class="btn btn-success" name="dept_contact_centre" value="Department Report  - Contact centre">
                </form>
            </td>
        </tr>      
    </table>
    
    



    {{ $report->links() }}
    <div class="table-responsive" style="overflow: scroll;">
        <table class="table table-bordered table-striped" >
            <thead>
                <tr>
                    <th>Ticket ID</th>
                    <th>Reference No</th>
                    <th>Patient Name</th>
                    <th>Member No</th> 
                    <th>Subject</th>
                    <th>Date Logged</th>
                    <th>Logged By</th>
                    <th>Escalated to</th> 
                    <th>Service</th> 
                    <th>Service Issue</th>
                    <th>Re-Assigned</th>
                    <th>Status</th>
                    <th>Date Closed</th>
                    <th>Location Name</th>
                    <th>Scheme</th>
                    <th>Reported Via</th>  
                </tr>
            </thead>
            @foreach($report as $row)
            @php

            $subject = \DB::table('ticket_thread')->select('title')->where('ticket_id',$row->id)->first();
            $reportedVia = \DB::table('reported_table')->select('name')->where('id',$row->reported_by)->first();
            $service = App\Model\helpdesk\Agent\Service::find($row->service);
             $firstdata = \App\Model\helpdesk\Agent\EsclationMatrix::where('companyservice',trim($service->service_name))->first();  
            $esclated_email = isset($firstdata->email1)?$firstdata->email1:'';
            $logged_by = \App\User::find($row->user_id);
            @endphp
            <tbody>  
                <tr> 
                 <td>{{$row->id}}</td> 
                 <td>{{$row->ticket_number}}</td> 
                 <td>{{$row->client_name}}</td> 
                 <td>{{$row->member_no}}</td>
                 <td>{{isset($subject->title)?$subject->title:''}}</td>  
                 <td>{{$row->created_at}}</td> 
                 <td> {{isset($logged_by->first_name)?$logged_by->first_name:''}} </td> 
                 <td>{{isset($esclated_email)?$esclated_email:''}}</td> 
                 <td>{{isset($service->service_name)?$service->service_name:''}}</td> 
                 <td>{{$row->service_issue}}</td> 
                 <td>@if($row->assigned_to!='')
                        <span>Re-Assigned</span>
                    @endif
                 </td> 
                 <td>@if($row->status=='2')
                      <span>  Resolved</span>
                    @endif
                    @if($row->status=='3')
                       <span> Closed</span>
                    @endif
                    @if($row->status=='5')
                      <span>  Deleted</span>
                    @endif
                 </td> 
                 <td>{{$row->closed_at}}</td> 
                 <td>{{$row->company_location}}</td> 
                 <td>{{$row->scheme}}</td> 
                 <td>{{isset($reportedVia->name)?$reportedVia->name:''}}</td> 
                </tr>
            </tbody>
            @endforeach
        </table>
    </div>
</div>



<div id="refresh"> 
    <script src="{{asset("lb-faveo/plugins/chartjs/Chart.min.js")}}" type="text/javascript"></script>
</div>




<script type="text/javascript">
     
    



    var result1a;
//    var help_topic_global;
                        $(document).ready(function() {



                            $.getJSON("help-topic-report", function(result) {
                                var labels = [], open = [], closed = [], reopened = [], open_total = 0, closed_total = 0, reopened_total = 0;
                                //,data2=[],data3=[],data4=[];+
                                var tableRef = document.getElementById('tabular');
                                while (tableRef.rows.length > 0)
                                {
                                    tableRef.deleteRow(0);
                                }
                                var header = tableRef.createTHead();
                                var row = header.insertRow(0);
                                var body = tableRef.createTBody();
                                window.result1a = result;
//                                window.help_topic_global = document.getElementById('help_topic');
                                for (var i = 0; i < result.length; i++) {
                                    var row1 = body.insertRow(0);
//                                    if(i % 4 === 0) {
                                    labels.push(result[i].date);
//                                    } else {
//                                        labels.push("");
//                                    }

                                    open.push(result[i].open);
                                    if (i == 1) {
                                        var cell = row.insertCell(0);
                                        cell.innerHTML = "<b>{!! Lang::get('lang.reopened') !!}</b>";
                                        var cell = row.insertCell(0);
                                        cell.innerHTML = "<b>{!! Lang::get('lang.closed') !!}</b>";
                                        var cell = row.insertCell(0);
                                        cell.innerHTML = "<b>{!! Lang::get('lang.created') !!}</b>";
                                        var cell = row.insertCell(0);
                                        cell.innerHTML = "<b>{!! Lang::get('lang.date') !!}</b>";
                                    }
                                    var cell1 = row1.insertCell(0);
                                    cell1.innerHTML = "<b>" + result[i].reopened + "</b>";
                                    var cell1 = row1.insertCell(0);
                                    cell1.innerHTML = "<b>" + result[i].closed + "</b>";
                                    var cell1 = row1.insertCell(0);
                                    cell1.innerHTML = "<b>" + result[i].open + "</b>";
                                    var cell1 = row1.insertCell(0);
                                    cell1.innerHTML = "<b>" + result[i].date + "</b>";

                                    closed.push(result[i].closed);
                                    reopened.push(result[i].reopened);
                                    // data4.push(result[i].open);
                                    open_total += parseInt(result[i].open);
                                    closed_total += parseInt(result[i].closed);
                                    reopened_total += parseInt(result[i].reopened);
                                    
                                    $inprog = result[i].inprogress;
                                }
                                var buyerData = {
                                    labels: labels,
                                    datasets: [
                                        {
                                            label: "Open Tickets",
                                            fillColor: "rgba(93, 189, 255, 0.05)",
                                            strokeColor: "rgba(2, 69, 195, 0.9)",
                                            pointColor: "rgba(2, 69, 195, 0.9)",
                                            pointStrokeColor: "#c1c7d1",
                                            pointHighlightFill: "#fff",
                                            pointHighlightStroke: "rgba(220,220,220,1)",
                                            data: open
                                        }, {
                                            label: "Closed Tickets",
                                            fillColor: "rgba(255, 206, 96, 0.08)",
                                            strokeColor: "rgba(221, 129, 0, 0.94)",
                                            pointColor: "rgba(221, 129, 0, 0.94)",
                                            pointStrokeColor: "rgba(60,141,188,1)",
                                            pointHighlightFill: "#fff",
                                            pointHighlightStroke: "rgba(60,141,188,1)",
                                            data: closed

                                        }, {
                                            label: "Reopened Tickets",
                                            fillColor: "rgba(104, 255, 220, 0.06)",
                                            strokeColor: "rgba(0, 149, 115, 0.94)",
                                            pointColor: "rgba(0, 149, 115, 0.94)",
                                            pointStrokeColor: "rgba(60,141,188,1)",
                                            pointHighlightFill: "#fff",
                                            pointHighlightStroke: "rgba(60,141,188,1)",
                                            data: reopened
                                        }
                                    ]
                                };
                                $("#total-created-tickets").html(open_total);
                                $("#total-reopen-tickets").html(reopened_total);
                                $("#total-closed-tickets").html(closed_total);
                                $("#total-inprogress-tickets").html($inprog);
                                var myLineChart = new Chart(document.getElementById("tickets-graph").getContext("2d")).Line(buyerData, {
                                    showScale: true,
                                    //Boolean - Whether grid lines are shown across the chart
                                    scaleShowGridLines: true,
                                    //String - Colour of the grid lines
                                    scaleGridLineColor: "rgba(0,0,0,.05)",
                                    //Number - Width of the grid lines
                                    scaleGridLineWidth: 1,
                                    //Boolean - Whether to show horizontal lines (except X axis)
                                    scaleShowHorizontalLines: true,
                                    //Boolean - Whether to show vertical lines (except Y axis)
                                    scaleShowVerticalLines: true,
                                    //Boolean - Whether the line is curved between points
                                    bezierCurve: true,
                                    //Number - Tension of the bezier curve between points
                                    bezierCurveTension: 0.3,
                                    //Boolean - Whether to show a dot for each point
                                    pointDot: true,
                                    //Number - Radius of each point dot in pixels
                                    pointDotRadius: 1,
                                    //Number - Pixel width of point dot stroke
                                    pointDotStrokeWidth: 1,
                                    //Number - amount extra to add to the radius to cater for hit detection outside the drawn point
                                    pointHitDetectionRadius: 10,
                                    //Boolean - Whether to show a stroke for datasets
                                    datasetStroke: true,
                                    //Number - Pixel width of dataset stroke
                                    datasetStrokeWidth: 1,
                                    //Boolean - Whether to fill the dataset with a color
                                    datasetFill: true,
                                    //String - A legend template
                                    //Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
                                    maintainAspectRatio: true,
                                    //Boolean - whether to make the chart responsive to window resizing
                                    responsive: true

                                });
//                                document.getElementById("legendDiv").innerHTML = myLineChart.generateLegend();
                            });
                            $('#click_day').click(function() {
                                $('#click_week').removeClass('btn-primary');
                                $('#click_week').addClass('btn-default');
                                $('#click_month').removeClass('btn-primary');
                                $('#click_month').addClass('btn-default');
                                $('#click_day').removeClass('btn-default');
                                $('#click_day').addClass('btn-primary');
                                $("#duration").val("day");
                               // document.getElementById("open").checked = false;
                              //  document.getElementById("closed").checked = false;
                               // document.getElementById("reopened").checked = false;
                                $("#status").empty();
                               // $('#foo').submit();
                            });
                            $('#click_week').click(function() {
                                $('#click_day').removeClass('btn-primary');
                                $('#click_day').addClass('btn-default');
                                $('#click_month').removeClass('btn-primary');
                                $('#click_month').addClass('btn-default');
                                $('#click_week').removeClass('btn-default');
                                $('#click_week').addClass('btn-primary');
                                $("#duration").val("week");
                              //  document.getElementById("open").checked = false;
                                //document.getElementById("closed").checked = false;
                               // document.getElementById("reopened").checked = false;
                               // $('#foo').submit();
                                $("#status").empty();
                              
                            });
                            $('#click_month').click(function() {
                                $('#click_week').removeClass('btn-primary');
                                $('#click_week').addClass('btn-default');
                                $('#click_day').removeClass('btn-primary');
                                $('#click_day').addClass('btn-default');
                                $('#click_month').removeClass('btn-default');
                                $('#click_month').addClass('btn-primary');
                                $("#duration").val("month");
                               // document.getElementById("open").checked = false;
                               // document.getElementById("closed").checked = false;
                                //document.getElementById("reopened").checked = false;
                               // $('#foo').submit();
                                $("#status").empty();
                            });
                            $('#submit').click(function() {
                                $('#click_week').removeClass('btn-primary');
                                $('#click_week').addClass('btn-default');
                                $('#click_day').removeClass('btn-primary');
                                $('#click_day').addClass('btn-default');
                                $('#click_month').removeClass('btn-primary');
                                $('#click_month').addClass('btn-default');
                                $("#duration").val('');
                            });

                            $('#foo').submit(function(event) {
                                // get the form data
                                // there are many ways to get this data using jQuery (you can use the class or id also)
                                var date1 = $('#datepicker4').val();
                                var date2 = $('#datetimepicker3').val();
                                var help_topic = $('#help_topic').val();
                                var duration = $('#duration').val();
                                if (!duration) {
                                    if (!date1) {
                                        $('#start_date').addClass("has-error");
                                    } else {
                                        $('#start_date').removeClass("has-error");
                                    }
                                    if (!date2) {
                                        $('#end_date').addClass("has-error");
                                    } else {
                                        $('#end_date').removeClass("has-error");
                                    }
                                    if (!date1 || !date2) {
                                        return false;
                                    }

                                    var formData = date1.split("/").join('-');
                                    var dateData = date2.split("/").join('-');
                                } else {
                                    var formData = null;
                                    var dateData = null;
                                    $('#datepicker4').val('');
                                    $('#datetimepicker3').val('');
                                }
                                var data = $('#foo').serialize();
                                // process the form
                                $.ajax({
                                    type: 'POST', // define the type of HTTP verb we want to use (POST for our form)
                                    url: 'help-topic-report/' + dateData + '/' + formData + '/' + help_topic, // the url where we want to POST
                                    dataType: 'json', // what type of data do we expect back from the server
                                    data: data, // our data object

                                    success: function(result2) {
                                        window.result1a = result2;
                                        var tableRef = document.getElementById('tabular');
                                        while (tableRef.rows.length > 0)
                                        {
                                            tableRef.deleteRow(0);
                                        }

                                        var labels = [], open = [], closed = [], reopened = [], open_total = 0, closed_total = 0, reopened_total = 0;
                                        var header = tableRef.createTHead();
                                        var row = header.insertRow(0);
                                        var body = tableRef.createTBody();

                                        for (var i = 0; i < result2.length; i++) {
                                            labels.push(result2[i].date);
                                            var date123 = result2[i].date;

                                            var row1 = body.insertRow(0);

                                            if (result2[i].reopened) {
                                                reopened.push(result2[i].reopened);
                                                reopened_total += parseInt(result2[i].reopened);
                                                if (i == 1) {
                                                    var cell = row.insertCell(0);
                                                    cell.innerHTML = "<b>{!! Lang::get('lang.reopened') !!}</b>";
                                                }
                                                var cell1 = row1.insertCell(0);
                                                cell1.innerHTML = "<b>" + result2[i].reopened + "</b>";
                                            } else {
                                                reopened.push("");
                                                reopened_total += 0;
                                            }

                                            if (result2[i].closed) {
                                                closed.push(result2[i].closed);
                                                closed_total += parseInt(result2[i].closed);
                                                if (i == 1) {
                                                    var cell = row.insertCell(0);
                                                    cell.innerHTML = "<b>{!! Lang::get('lang.closed') !!}</b>";
                                                }
                                                var cell1 = row1.insertCell(0);
                                                cell1.innerHTML = "<b>" + result2[i].closed + "</b>";
                                            } else {
                                                closed.push("");
                                                closed_total += 0;
                                            }

                                            if (result2[i].open) {
                                                open.push(result2[i].open);
                                                open_total += parseInt(result2[i].open);
                                                if (i == 1) {
                                                    var cell = row.insertCell(0);
                                                    cell.innerHTML = "<b>{!! Lang::get('lang.created') !!}</b>";
                                                }
                                                var cell1 = row1.insertCell(0);
                                                cell1.innerHTML = "<b>" + result2[i].open + "</b>";
                                            } else {
                                                open.push("");
                                                open_total += 0;
                                            }

                                            if (i == 1) {
                                                var cell = row.insertCell(0);
                                                cell.innerHTML = "<b>{!! Lang::get('lang.date') !!}</b>";
                                            }

                                            var cell1 = row1.insertCell(0);
                                            cell1.innerHTML = "<b>" + result2[i].date + "</b>";
                                            $inprog = result2[i].inprogress;
                                        }
                                        $("#head123").html("</tr>");

                                        var buyerData = {
                                            labels: labels,
                                            datasets: [
                                                {
                                                    label: "Open Tickets",
                                                    fillColor: "rgba(93, 189, 255, 0.05)",
                                                    strokeColor: "rgba(2, 69, 195, 0.9)",
                                                    pointColor: "rgba(2, 69, 195, 0.9)",
                                                    pointStrokeColor: "#c1c7d1",
                                                    pointHighlightFill: "#fff",
                                                    pointHighlightStroke: "rgba(220,220,220,1)",
                                                    data: open
                                                }
                                                , {
                                                    label: "Closed Tickets",
                                                    fillColor: "rgba(255, 206, 96, 0.08)",
                                                    strokeColor: "rgba(221, 129, 0, 0.94)",
                                                    pointColor: "rgba(221, 129, 0, 0.94)",
                                                    pointStrokeColor: "rgba(60,141,188,1)",
                                                    pointHighlightFill: "#fff",
                                                    pointHighlightStroke: "rgba(60,141,188,1)",
                                                    data: closed
                                                }
                                                , {
                                                    label: "Reopened Tickets",
                                                    fillColor: "rgba(104, 255, 220, 0.06)",
                                                    strokeColor: "rgba(0, 149, 115, 0.94)",
                                                    pointColor: "rgba(0, 149, 115, 0.94)",
                                                    pointStrokeColor: "rgba(60,141,188,1)",
                                                    pointHighlightFill: "#fff",
                                                    pointHighlightStroke: "rgba(60,141,188,1)",
                                                    data: reopened
                                                }
                                            ]
                                        };
                                        $("#total-created-tickets").html(open_total);
                                        $("#total-reopen-tickets").html(reopened_total);
                                        $("#total-closed-tickets").html(closed_total);
                                        $("#total-inprogress-tickets").html($inprog);
                                        
                                        var myLineChart = new Chart(document.getElementById("tickets-graph").getContext("2d")).Line(buyerData, {
                                            showScale: true,
                                            //Boolean - Whether grid lines are shown across the chart
                                            scaleShowGridLines: true,
                                            //String - Colour of the grid lines
                                            scaleGridLineColor: "rgba(0,0,0,.05)",
                                            //Number - Width of the grid lines
                                            scaleGridLineWidth: 1,
                                            //Boolean - Whether to show horizontal lines (except X axis)
                                            scaleShowHorizontalLines: false,
                                            //Boolean - Whether to show vertical lines (except Y axis)
                                            scaleShowVerticalLines: false,
                                            //Boolean - Whether the line is curved between points
                                            bezierCurve: true,
                                            //Number - Tension of the bezier curve between points
                                            bezierCurveTension: 0.3,
                                            //Boolean - Whether to show a dot for each point
                                            pointDot: true,
                                            //Number - Radius of each point dot in pixels
                                            pointDotRadius: 1,
                                            //Number - Pixel width of point dot stroke
                                            pointDotStrokeWidth: 1,
                                            //Number - amount extra to add to the radius to cater for hit detection outside the drawn point
                                            pointHitDetectionRadius: 10,
                                            //Boolean - Whether to show a stroke for datasets
                                            datasetStroke: true,
                                            //Number - Pixel width of dataset stroke
                                            datasetStrokeWidth: 1,
                                            //Boolean - Whether to fill the dataset with a color
                                            datasetFill: true,
                                            //String - A legend template
                                            //Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
                                            maintainAspectRatio: true,
                                            //Boolean - whether to make the chart responsive to window resizing
                                            responsive: true

                                        });
                                        myLineChart.options.responsive = false;
                                        $("#tickets-graph").remove();
                                        $(".chart").html("<canvas id='tickets-graph' width='1000' height='250'></canvas>");
                                        var myLineChart1 = new Chart(document.getElementById("tickets-graph").getContext("2d")).Line(buyerData, {
                                            showScale: true,
                                            //Boolean - Whether grid lines are shown across the chart
                                            scaleShowGridLines: true,
                                            //String - Colour of the grid lines
                                            scaleGridLineColor: "rgba(0,0,0,.05)",
                                            //Number - Width of the grid lines
                                            scaleGridLineWidth: 1,
                                            //Boolean - Whether to show horizontal lines (except X axis)
                                            scaleShowHorizontalLines: true,
                                            //Boolean - Whether to show vertical lines (except Y axis)
                                            scaleShowVerticalLines: false,
                                            //Boolean - Whether the line is curved between points
                                            bezierCurve: true,
                                            //Number - Tension of the bezier curve between points
                                            bezierCurveTension: 0.3,
                                            //Boolean - Whether to show a dot for each point
                                            pointDot: true,
                                            //Number - Radius of each point dot in pixels
                                            pointDotRadius: 1,
                                            //Number - Pixel width of point dot stroke
                                            pointDotStrokeWidth: 1,
                                            //Number - amount extra to add to the radius to cater for hit detection outside the drawn point
                                            pointHitDetectionRadius: 10,
                                            //Boolean - Whether to show a stroke for datasets
                                            datasetStroke: true,
                                            //Number - Pixel width of dataset stroke
                                            datasetStrokeWidth: 1,
                                            //Boolean - Whether to fill the dataset with a color
                                            datasetFill: true,
                                            //String - A legend template
                                            //Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
                                            maintainAspectRatio: true,
                                            //Boolean - whether to make the chart responsive to window resizing
                                            responsive: true
                                        });
//                                        document.getElementById("legendDiv").innerHTML = myLineChart1.generateLegend();
                                    }
                                });
                                // using the done promise callback
                                // stop the form from submitting the normal way and refreshing the page
                                event.preventDefault();
                            });
                            $("#pdf").on('click', function(){
                                document.getElementById("pdf_form").value = JSON.stringify(result1a);
                                document.getElementById("pdf_form_help_topic").value = $('#help_topic :selected').val();
                                document.getElementById("form_pdf").submit();
//                                $("#form_pdf").submit(function(){
//                                    alert('saasdas');
//                                });
                            });
                        });
</script>
<script>
  $(function () {
//    $("#tabular").DataTable();
    $('#tabular').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });
  });
</script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        // Close a ticket
        $('#close').on('click', function(e) {
            $.ajax({
                type: "GET",
                url: "agen",
                beforeSend: function() {

                },
                success: function(response) {

                }
            })
            return false;
        });
    });
</script>
@stop