<?php

namespace App\Http\Controllers\Agent\helpdesk;

// controllers
use App\Http\Controllers\Controller;
use App\Model\helpdesk\Manage\Help_topic;
// request
use App\Model\helpdesk\Ticket\Tickets;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;



//use Excel;
/**
 * ReportController
 * This controlleris used to fetch reports in the agent panel.
 *
 * @author      Ladybird <info@ladybirdweb.com>
 */
class ExportController 
{
    //use Exportable;
    /**
     * Create a new controller instance.
     * constructor to check
     * 1. authentication
     * 2. user roles
     * 3. roles must be agent.
     *
     * @return void
     */
   
    /**
     * Get the Report page.
     *
     * @return type view
     */
    public function view():view
    {
        try {
/*
                $closed = Tickets::where(['help_topic_id'=>1,'closed'=>1])->select('closed')->count(); 
                $reopend = Tickets::where(['help_topic_id'=>1,'reopened'=>1])->select('reopened')->count(); 
                $in_progress = Tickets::where(['help_topic_id'=>1,'status'=>1])->select('status')->count();

                $companyname = "LifeCare";
                $location = Organization::select('address')->where('name',$companyname)->get();
                $report = \DB::table('tickets as t')
                ->select('t.id','t.ticket_number','t.user_id','t.status','t.created_at','t.closed_at','t.assigned_to','c.service','c.service_issue','c.company_location','c.client_name','c.member_no','c.reported_by','c.scheme','c.created_at')
                ->join('client_result as c','c.ticket_id','=','t.id')
                    ->paginate(5);*/
             return view('textt',['users'=>User::all()]);
            
            
                  
        } catch (Exception $e) {
          }
    }
    // generate report

    public function masterDumpReport(Request $request)
    {
       
        $type="xlsx";
        $first_date = date('Y-m-d',strtotime($request->startdatem));
        $second_date = date('Y-m-d',strtotime($request->enddatem));
        $date1 = $request->startdatem;
        $date2 = $request->enddatem;
        $region = trim($request->regionm);

        
        if($region=='All'){
            $loc1 = null; 
        } else {
            $loc1 = trim($request->regionm);   
        }
        $dates=[
            'date1'=>$first_date,
            'date2'=>$second_date,
            'loc1' => $loc1, 
        ];
           /* echo "<pre>";
            dd($dates);*/
            //Mater Report
        if($request->has('master_data')){   
            file_put_contents('masterdata.json','export controller');
           $data = $this->getReports($first_date, $second_date,$loc1); 
            $excel_controller = new \App\Http\Controllers\Common\ExcelController();
            $filename = 'Dump_Master';
           return   $excel_controller->exportReport($filename, $data,$dates);//export is the function name call in ExcellController
         }  
         //Department Report
        if($request->has('department_data')){     
         $data = $this->getReports($first_date, $second_date);          
            $excel_controller = new \App\Http\Controllers\Common\ExcelController();
            $filename = 'Department_report';
             return   $excel_controller->exportReport($filename, $data,$dates);//export is the function name call in ExcellController
         } 

         //Region Report
       
        if($request->has('region_data')){    

         $data = $this->excelGenerate($date1, $date2,$loc1);
          
            $excel_controller = new \App\Http\Controllers\Common\ExcelController();
            $filename = 'Regions_report';
             return   $excel_controller->getRegionReports($filename, $data,$dates);//export is the function name call in ExcellController
         }
        //Reported via Report Comprehensive
       
        if($request->has('reported_vi_data')){    

         $data = $this->getReports($first_date, $second_date,$loc1);
          
            $excel_controller = new \App\Http\Controllers\Common\ExcelController();
            $filename = 'Reported_via_report';
             return   $excel_controller->exportReport($filename, $data,$dates);//export is the function name call in ExcellController
         }
        
    }
/*    public function excelGenerate($date1, $date2,$loc1)
    {
       $created1 = 0;
        $closed1 = 0;
        $reopened1 = 0;
        $date11 = strtotime($date1);
        $date12 = strtotime($date2);
        $j=0;
        for ($i = $date1; $i <= $date2; $i = $i + 86400) 
        {
            
            $j++;
            $thisDate = date('Y-m-d', $i);
            $thisDate1 = date('jS F Y', $i);
            $open_array = [];
            $closed_array = [];
            $reopened_array = [];

            $created = \DB::table('tickets as t')
                ->join ('client_result as cr','cr.ticket_id','=','t.id')
                ->select('t.status')->where('t.created_at', 'LIKE', '%'.$thisDate.'%','cr.company_location',$loc1)->count();
                    $created1 += $created;
                    $closed = \DB::table('tickets')->select('closed_at')->where('help_topic_id', '=', $help_topic)->where('closed_at', 'LIKE', '%'.$thisDate.'%')->count();
                    $closed1 += $closed;
                    $reopened = \DB::table('tickets')->select('reopened_at')->where('help_topic_id', '=', $help_topic)->where('reopened_at', 'LIKE', '%'.$thisDate.'%')->count();
                    $reopened1 += $reopened;
                    if ($j % 7 == 0) {
                        //$open_array = ['open' => $created1];
                        $insertOpen = $created1;
                        $insertClose = $closed1;
                        $created1 = 0;
                        $closed1 = 0;
                        
                        $value = ['date' => $thisDate1];
                        SupportReportExcel::insert(['Date'=>$thisDate1,'Open'=>$insertOpen,'Close'=>$insertClose,'Reopened'=>$insertReopen]);

                    }

        }
    }*/

    public function getReports($first, $last)
    {
        $report = new Tickets();
        $report = $report->leftJoin('client_result as c', 'tickets.id', '=', 'c.ticket_id')
                ->leftJoin('ticket_thread', 'ticket_thread.ticket_id', '=', 'tickets.id')
                ->leftJoin('users', 'users.id', '=', 'tickets.user_id')
                 ->leftJoin('master_status', 'master_status.id', '=', 'tickets.status')
                ->leftJoin('services', 'services.id', '=', 'c.service')
                ->leftJoin('reported_table as rv', 'rv.id', '=', 'c.reported_by')
                ->whereBetween('tickets.created_at', [$first, $last])
                ->WhereIn('c.company_location',$loc1)
               // ->where('active', 1)
               ->select('tickets.id as Ticket', 'tickets.ticket_number as Reference','c.client_name as Patient Name','c.member_no as Member No','ticket_thread.title as Subject','c.date_time_logged as Date Logged','users.user_name as Logged By','c.esclated_to as Esclated To' ,'services.service_name as Service','c.service_issue as Service Issue','master_status.name as Status','tickets.closed_at as Date Closed','c.company_location as Location Name','c.scheme as Scheme','c.member_type as Member Type','c.patient_type as IP/OP','rv.name as Reported Via'

                )
                ->get()
                ->toArray();

        return $report;

        
    }

    /**
     * function to get help_topic graph.
     *
     * @param type $date111
     * @param type $date122
     * @param type $helptopic
     */
    public function chartdataHelptopic(Request $request, $date111 = '', $date122 = '', $helptopic = '')
    {

       
        $date11 = strtotime($date122);
        $date12 = strtotime($date111);

        $help_topic = $helptopic;
        $duration = $request->input('duration');
        if ($date11 && $date12 && $help_topic) {
            $date2 = $date12;
            $date1 = $date11;
            $duration = null;
            if ($request->input('open') == null || $request->input('closed') == null || $request->input('reopened') == null || $request->input('overdue') == null || $request->input('deleted') == null) {
                $duration = 'day';
            }
        } else {
            // generating current date
            $date2 = strtotime(date('Y-m-d'));
            $date3 = date('Y-m-d');
            $format = 'Y-m-d';
            // generating a date range of 1 month
            if ($request->input('duration') == 'day') {
                $date1 = strtotime(date($format, strtotime('-15 day'.$date3)));
            } elseif ($request->input('duration') == 'week') {
                $date1 = strtotime(date($format, strtotime('-69 days'.$date3)));
            } elseif ($request->input('duration') == 'month') {
                $date1 = strtotime(date($format, strtotime('-179 days'.$date3)));
            } else {
                $date1 = strtotime(date($format, strtotime('-30 days'.$date3)));
            }
//            $help_topic = Help_topic::where('status', '=', '1')->min('id');
        }

        $return = '';
        $last = '';
        $j = 0;
        $created1 = 0;
        $closed1 = 0;
        $reopened1 = 0;
        $in_progress = \DB::table('tickets')->where('help_topic_id', '=', $help_topic)->where('status', '=', 1)->count();

        for ($i = $date1; $i <= $date2; $i = $i + 86400) 
        {
            $j++;
            $thisDate = date('Y-m-d', $i);
            $thisDate1 = date('jS F', $i);
            $open_array = [];
            $closed_array = [];
            $reopened_array = [];

            if ($request->input('open') || $request->input('closed') || $request->input('reopened')) {
                if ($request->input('open') && $request->input('open') == 'on') {
                    $created = \DB::table('tickets')->select('created_at')->where('help_topic_id', '=', $help_topic)->where('created_at', 'LIKE', '%'.$thisDate.'%')->count();
                    $open_array = ['open' => $created];
                   
                }
                if ($request->input('closed') && $request->input('closed') == 'on') {
                    $closed = \DB::table('tickets')->select('closed_at')->where('help_topic_id', '=', $help_topic)->where('closed_at', 'LIKE', '%'.$thisDate.'%')->count();
                    $closed_array = ['closed' => $closed];
                }
                if ($request->input('reopened') && $request->input('reopened') == 'on') {
                    $reopened = \DB::table('tickets')->select('reopened_at')->where('help_topic_id', '=', $help_topic)->where('reopened_at', 'LIKE', '%'.$thisDate.'%')->count();
                    $reopened_array = ['reopened' => $reopened];
                }
//                if ($request->input('overdue') && $request->input('overdue') == 'on') {
//                    $overdue = Tickets::where('status', '=', 1)->where('isanswered', '=', 0)->where('dept_id', '=', $dept->id)->orderBy('id', 'DESC')->get();
//                }
//                        $open_array = ['open'=>$created1];
//                        $closed_array = ['closed'=>$closed1];
//                        $reopened_array = ['reopened'=>$reopened1];
                $value = ['date' => $thisDate1];
//                        if($open_array) {
                $value = array_merge($value, $open_array);
                $value = array_merge($value, $closed_array);
                $value = array_merge($value, $reopened_array);
                $value = array_merge($value, ['inprogress' => $in_progress]);
//                        } else {
//                            $value = "";
//                        }
                $array = array_map('htmlentities', $value);
               


                $json = html_entity_decode(json_encode($array));
              //  $this->generateReport(array_merge($value, $open_array));
                $return .= $json.',';
               

            } else {
                if ($duration == 'week') {
                    $created = \DB::table('tickets')->select('created_at')->where('help_topic_id', '=', $help_topic)->where('created_at', 'LIKE', '%'.$thisDate.'%')->count();
                    $created1 += $created;
                    $closed = \DB::table('tickets')->select('closed_at')->where('help_topic_id', '=', $help_topic)->where('closed_at', 'LIKE', '%'.$thisDate.'%')->count();
                    $closed1 += $closed;
                    $reopened = \DB::table('tickets')->select('reopened_at')->where('help_topic_id', '=', $help_topic)->where('reopened_at', 'LIKE', '%'.$thisDate.'%')->count();
                    $reopened1 += $reopened;
                    if ($j % 7 == 0) {
                        $open_array = ['open' => $created1];
                        $created1 = 0;
                        $closed_array = ['closed' => $closed1];
                        $closed1 = 0;
                        $reopened_array = ['reopened' => $reopened1];
                        $reopened1 = 0;
                        $value = ['date' => $thisDate1];
//                        if($open_array) {
                        $value = array_merge($value, $open_array);
                        $value = array_merge($value, $closed_array);
                        $value = array_merge($value, $reopened_array);
                        $value = array_merge($value, ['inprogress' => $in_progress]);
//                        } else {
//                            $value = "";
//                        }
                        $array = array_map('htmlentities', $value);
                        $json = html_entity_decode(json_encode($array));
                        $return .= $json.',';
                    }
                } elseif ($duration == 'month') {
                    $created_month = \DB::table('tickets')->select('created_at')->where('help_topic_id', '=', $help_topic)->where('created_at', 'LIKE', '%'.$thisDate.'%')->count();
                    $created1 += $created_month;
                    $closed_month = \DB::table('tickets')->select('closed_at')->where('help_topic_id', '=', $help_topic)->where('closed_at', 'LIKE', '%'.$thisDate.'%')->count();
                    $closed1 += $closed_month;
                    $reopened_month = \DB::table('tickets')->select('reopened_at')->where('help_topic_id', '=', $help_topic)->where('reopened_at', 'LIKE', '%'.$thisDate.'%')->count();
                    $reopened1 += $reopened_month;
                    if ($j % 30 == 0) {
                        $open_array = ['open' => $created1];
                        $created1 = 0;
                        $closed_array = ['closed' => $closed1];
                        $closed1 = 0;
                        $reopened_array = ['reopened' => $reopened1];
                        $reopened1 = 0;
                        $value = ['date' => $thisDate1];

                        $value = array_merge($value, $open_array);
                        $value = array_merge($value, $closed_array);
                        $value = array_merge($value, $reopened_array);
                        $value = array_merge($value, ['inprogress' => $in_progress]);

                        $array = array_map('htmlentities', $value);
                        $json = html_entity_decode(json_encode($array));
                        $return .= $json.',';
                    }
                } else {
                    if ($request->input('default') == null) {
                        $help_topic = Help_topic::where('status', '=', '1')->min('id');
                    }
                    $created = \DB::table('tickets')->select('created_at')->where('help_topic_id', '=', $help_topic)->where('created_at', 'LIKE', '%'.$thisDate.'%')->count();
                    $open_array = ['open' => $created];
                    $closed = \DB::table('tickets')->select('closed_at')->where('help_topic_id', '=', $help_topic)->where('closed_at', 'LIKE', '%'.$thisDate.'%')->count();
                    $closed_array = ['closed' => $closed];
                    $reopened = \DB::table('tickets')->select('reopened_at')->where('help_topic_id', '=', $help_topic)->where('reopened_at', 'LIKE', '%'.$thisDate.'%')->count();
                    $reopened_array = ['reopened' => $reopened];
                    if ($j % 1 == 0) {
                        $open_array = ['open' => $created];
                        $created = 0;
                        $closed_array = ['closed' => $closed];
                        $closed = 0;
                        $reopened_array = ['reopened' => $reopened];
                        $reopened = 0;
                        $value = ['date' => $thisDate1];
                        if ($request->input('default') == null) {
                            $value = array_merge($value, $open_array);
                            $value = array_merge($value, $closed_array);
                            $value = array_merge($value, $reopened_array);
                            $value = array_merge($value, ['inprogress' => $in_progress]);
                        } else {
                            if ($duration == null) {
                                if ($request->input('open') == 'on') {
                                    $value = array_merge($value, $open_array);
                                }
                                if ($request->input('closed') == 'on') {
                                    $value = array_merge($value, $closed_array);
                                }
                                if ($request->input('reopened') == 'on') {
                                    $value = array_merge($value, $reopened_array);
                                }
                            } else {
                                $value = array_merge($value, $open_array);
                                $value = array_merge($value, $closed_array);
                                $value = array_merge($value, $reopened_array);
                                $value = array_merge($value, ['inprogress' => $in_progress]);
                            }
                        }

//                        } else {
//                            $value = "";
//                        }
                        $array = array_map('htmlentities', $value);
                        $json = html_entity_decode(json_encode($array));
                        $return .= $json.',';
                    }
                }
            }

//            $value = ['date' => $thisDate];
//            if($open_array) {
//                $value = array_merge($value,$open_array);
//            }
//            if($closed_array) {
//                $value = array_merge($value,$closed_array);
//            }
//            if($reopened_array) {
//                $value = array_merge($value,$reopened_array);
//            }
        }

        
        //print_r($reqData);die;
       // $this->generateReport($reqData);
       
        $last = rtrim($return, ',');
        
        return '['.$last.']';
    }

    
   // generate Excel Report
    public function generateReport(Request $request)
    {
          SupportReportExcel::truncate();
         // dd($request->all());

          $sdates= $request->start_date;
          $sss= $request->end_date;
          //echo $sdates."".$sss;
       
        $date11 = strtotime($sdates);
        $date12 = strtotime($sss);
      
        
          $help_topic = $request->help_topic;
         $duration = $request->input('duration');
        if ($date11 && $date12 && $help_topic) 
        {
            $date2 = $date12;
            $date1 = $date11;
            $duration = null;
           
        } else {
                // generating current date
                $date2 = strtotime(date('Y-m-d'));
                $date3 = date('Y-m-d');
                $format = 'Y-m-d';
                // generating a date range of 1 month
                if ($request->input('duration') == 'day') {
                    $date1 = strtotime(date($format, strtotime('-15 day'.$date3)));
                } elseif ($request->input('duration') == 'week') {
                    $date1 = strtotime(date($format, strtotime('-69 days'.$date3)));
                } elseif ($request->input('duration') == 'month') {
                    $date1 = strtotime(date($format, strtotime('-179 days'.$date3)));
                } else {
                    $date1 = strtotime(date($format, strtotime('-30 days'.$date3)));
                }
          
        }
      
          
        $return = '';
        $last = '';
        $j = 0;
        $created1 = 0;
        $closed1 = 0;
        $reopened1 = 0;
        $in_progress = \DB::table('tickets')->where('help_topic_id', '=', $help_topic)->where('status', '=', 1)->count();
       // echo $date11;die;
        for ($i = $date1; $i <= $date2; $i = $i + 86400) 
        {
            
            $j++;
            $thisDate = date('Y-m-d', $i);
            $thisDate1 = date('jS F Y', $i);
            $open_array = [];
            $closed_array = [];
            $reopened_array = [];

            if($request->status=='open') 
            {
                
                    $created = \DB::table('tickets')->select('created_at')->where('help_topic_id', '=', $help_topic)->where('created_at', 'LIKE', '%'.$thisDate.'%')->count();
                    
                
                 SupportReportExcel::insert(['Date'=>$thisDate1,'Open'=>$created]);
            }  
               
            if($request->status =='closed')
            {
                    $closed = \DB::table('tickets')->select('closed_at')->where('help_topic_id', '=', $help_topic)->where('closed_at', 'LIKE', '%'.$thisDate.'%')->count();
                   SupportReportExcel::insert(['Date'=>$thisDate1,'Close'=>$closed]);
            }
            if ($request->status=='reopened') 
            {
                    $reopened = \DB::table('tickets')->select('reopened_at')->where('help_topic_id', '=', $help_topic)->where('reopened_at', 'LIKE', '%'.$thisDate.'%')->count();
                   SupportReportExcel::insert(['Date'=>$thisDate1,'Reopened'=>$reopened]);
            }
            if ($request->duration == 'day') 
            {

                    $created = \DB::table('tickets')->select('created_at')->where('help_topic_id', '=', $help_topic)->where('created_at', 'LIKE', '%'.$thisDate.'%')->count();
                    $created1 += $created;
                    $closed = \DB::table('tickets')->select('closed_at')->where('help_topic_id', '=', $help_topic)->where('closed_at', 'LIKE', '%'.$thisDate.'%')->count();
                    $closed1 += $closed;
                    $reopened = \DB::table('tickets')->select('reopened_at')->where('help_topic_id', '=', $help_topic)->where('reopened_at', 'LIKE', '%'.$thisDate.'%')->count();
                    $reopened1 += $reopened;
                    if ($j % 1 == 0) {
                        //$open_array = ['open' => $created1];
                        $insertOpen = $created1;
                        $insertClose = $closed1;
                        $insertReopen = $reopened1;
                        $created1 = 0;
                        $closed1 = 0;
                        $reopened1 = 0;
                        $value = ['date' => $thisDate1];
                        SupportReportExcel::insert(['Date'=>$thisDate1,'Open'=>$insertOpen,'Close'=>$insertClose,'Reopened'=>$insertReopen]);

                    }

                    
                }



            if ($request->duration == 'week') 
            {

                    $created = \DB::table('tickets')->select('created_at')->where('help_topic_id', '=', $help_topic)->where('created_at', 'LIKE', '%'.$thisDate.'%')->count();
                    $created1 += $created;
                    $closed = \DB::table('tickets')->select('closed_at')->where('help_topic_id', '=', $help_topic)->where('closed_at', 'LIKE', '%'.$thisDate.'%')->count();
                    $closed1 += $closed;
                    $reopened = \DB::table('tickets')->select('reopened_at')->where('help_topic_id', '=', $help_topic)->where('reopened_at', 'LIKE', '%'.$thisDate.'%')->count();
                    $reopened1 += $reopened;
                    if ($j % 7 == 0) {
                        //$open_array = ['open' => $created1];
                        $insertOpen = $created1;
                        $insertClose = $closed1;
                        $insertReopen = $reopened1;
                        $created1 = 0;
                        $closed1 = 0;
                        $reopened1 = 0;
                        $value = ['date' => $thisDate1];
                        SupportReportExcel::insert(['Date'=>$thisDate1,'Open'=>$insertOpen,'Close'=>$insertClose,'Reopened'=>$insertReopen]);

                    }

                    
                }

            if ($request->duration == 'month') 
            {

                    $created = \DB::table('tickets')->select('created_at')->where('help_topic_id', '=', $help_topic)->where('created_at', 'LIKE', '%'.$thisDate.'%')->count();
                    $created1 += $created;
                    $closed = \DB::table('tickets')->select('closed_at')->where('help_topic_id', '=', $help_topic)->where('closed_at', 'LIKE', '%'.$thisDate.'%')->count();
                    $closed1 += $closed;
                    $reopened = \DB::table('tickets')->select('reopened_at')->where('help_topic_id', '=', $help_topic)->where('reopened_at', 'LIKE', '%'.$thisDate.'%')->count();
                    $reopened1 += $reopened;
                    if ($j % 30 == 0) {
                        //$open_array = ['open' => $created1];
                        $insertOpen = $created1;
                        $insertClose = $closed1;
                        $insertReopen = $reopened1;
                        $created1 = 0;
                        $closed1 = 0;
                        $reopened1 = 0;
                        $value = ['date' => $thisDate1];
                        SupportReportExcel::insert(['Date'=>$thisDate1,'Open'=>$insertOpen,'Close'=>$insertClose,'Reopened'=>$insertReopen]);

                    }
            }
              
    
        }

        /****foreach loop end *****/

            if(isset($request->status) && $request->status =="open") 
            {   
                 $data = SupportReportExcel::select('Date','Open')->get();
                 $excel_controller = new \App\Http\Controllers\Common\ExcelController();
                 $filename = 'Report';
              $excel_controller->exportSupportQuery($filename, $data);
            }

            if(isset($request->status) && $request->status =="closed") 
            {   
                 $data = SupportReportExcel::select('Date','Close')->get();
                 $excel_controller = new \App\Http\Controllers\Common\ExcelController();
                 $filename = 'Report';
                   $excel_controller->exportSupportQuery($filename, $data);
            }
        
            if(isset($request->status) && $request->status =='reopened')
            {
                $data = SupportReportExcel::select('Date','Reopened')->get();
                $excel_controller = new \App\Http\Controllers\Common\ExcelController();
                $filename = 'Report';
                 $excel_controller->exportSupportQuery($filename, $data);
            }
            if(isset($request->duration) && $request->duration == 'day')
            {
                $data = SupportReportExcel::select('Date','Open','Close','Reopened')->get();
                $excel_controller = new \App\Http\Controllers\Common\ExcelController();
                $filename = 'Report';
                 $excel_controller->exportSupportQuery($filename, $data);
            }
            if(isset($request->duration) && $request->duration == 'week')
            {
                $data = SupportReportExcel::select('Date','Open','Close','Reopened')->get();
                $excel_controller = new \App\Http\Controllers\Common\ExcelController();
                $filename = 'Report';
                 $excel_controller->exportSupportQuery($filename, $data);
            }
            if(isset($request->duration) && $request->duration == 'month')
            {
                $data = SupportReportExcel::select('Date','Open','Close','Reopened')->get();
                $excel_controller = new \App\Http\Controllers\Common\ExcelController();
                $filename = 'Report';
                 $excel_controller->exportSupportQuery($filename, $data);
            }

    }
    
   
  
}
