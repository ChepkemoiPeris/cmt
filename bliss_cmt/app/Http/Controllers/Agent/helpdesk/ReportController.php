<?php

namespace App\Http\Controllers\Agent\helpdesk;

// controllers
use App\Http\Controllers\Controller;
use App\Model\helpdesk\Manage\Help_topic;
// request
use App\Model\helpdesk\Ticket\Tickets;
use App\Model\helpdesk\Agent_panel\Organization;
use Illuminate\Http\Request;
use App\Model\helpdesk\Ticket\SupportReportExcel;
use App\Model\helpdesk\Ticket\DumpDepartment;

use DateTime;

use Excel;
/**
 * ReportController
 * This controlleris used to fetch reports in the agent panel.
 *
 * @author      Ladybird <info@ladybirdweb.com>
 */
class ReportController extends Controller
{
    /**
     * Create a new controller instance.
     * constructor to check
     * 1. authentication
     * 2. user roles
     * 3. roles must be agent.
     *
     * @return void
     */
    public function __construct()
    {
        // checking for authentication
        $this->middleware('auth');
        // checking if the role is agent
        $this->middleware('role.agent');
    }

    /**
     * Get the Report page.
     *
     * @return type view
     */
    public function index()
    {
        try {

                $closed = Tickets::where(['help_topic_id'=>1,'closed'=>1])->select('closed')->count(); 
                $reopend = Tickets::where(['help_topic_id'=>1,'reopened'=>1])->select('reopened')->count(); 
                $in_progress = Tickets::where(['help_topic_id'=>1,'status'=>1])->select('status')->count();
                $companyname = "Bliss Medical centre";
                $location = Organization::select('address')->where('name',$companyname)->get();
                $report = \DB::table('tickets as t')
                ->select('t.id','t.ticket_number','t.user_id','t.status','t.created_at','t.closed_at','t.assigned_to','c.service','c.service_issue','c.company_location','c.client_name','c.member_no','c.reported_by','c.scheme','c.created_at')
                ->join('client_result as c','c.ticket_id','=','t.id')
                    ->paginate(5);
             return view('themes.default1.agent.helpdesk.report.index',compact('report','location','closed','reopend','in_progress'));
            
            
                  
        } catch (Exception $e) {
          }
    }
    // generate report

    public function masterDumpReport(Request $request)
    {
         
        date_default_timezone_set('Africa/Nairobi');
        $type="xlsx"; 
        $first_date = date('Y-m-d',strtotime($request->startdatem));
        $second_date = date('Y-m-d H:i:s',strtotime($request->enddatem . ' +1 day'));
        $date1 = $request->startdatem;
        $date2 = $request->enddatem;

        $region = trim($request->regionm);
        if($region=='All'){
            $loc1 = null;
        } else {
            $loc1 = trim($request->regionm);   
        }
        $data=[

            'date1'=>date('d/m/Y',strtotime($first_date)),
            'date2'=>date('d/m/Y',strtotime($request->enddatem)),
            'loc1' => $loc1, 
            'date'=> date('d/m/Y',strtotime(now())),
            'time'=> date("h:i:a")
        ];

        if($request->has('master_data')){   
            $data['report'] = $this->getReports($first_date, $second_date,$loc1);  
            $data['filename']="Dump_Master.xls";
            return view('export.master_dump_report',$data);
            
         }  

         //Department Report
        if($request->has('department_data')){    
        $data['report']= $this->getDepartment($first_date, $second_date,$loc1);
        $data['filename']='Department.xls';
        $data['title']='Pending Esclation by Department';
        $data['column_name'] ='Department';
         
         // return view('export.department_report',$dates);
          return view('export.report',$data);
          
         } 

         //Region Report
       
        if($request->has('region_data')){    
          $data['other'] ='Esclation by Regions';
          $data['report'] = $this->getRegion($first_date, $second_date,$loc1);
          $data['filename']='Region.xls';
          $data['title']='Esclation by Regions';
          $data['column_name'] ='Region';
         // return view('export.region_report',$dates);
          return view('export.report',$data);
           
         }
        //Reported via Report Comprehensive
       
        if($request->has('reported_vi_data')){    

            $data['report'] = $this->getReportedVia($first_date, $second_date,$loc1);
            $data['title'] ='Pending Esclation by Department';
            $data['filename']='ReportedVia.xls';
            $data['column_name'] ='ReportedVia';
           // return view('export.reported_via',$data);
             return view('export.report',$data);
            
         }
         if($request->has('contact_centre')){    

            $data['report'] = $this->getContactcentre($first_date, $second_date,$loc1);
            $data['title'] ='Pending Esclation by Contact centre';
            $data['filename']='contactcentre.xls';
            $data['column_name'] ='Service'; 
             return view('export.report',$data);
            
         }
         if($request->has('dept_contact_centre')){    

            $data['report'] = $this->getDeptContact($first_date, $second_date,$loc1);
            $data['title'] ='Contact centre escalation by Department';
            $data['filename']='dept_contactcentre.xls';
            $data['column_name'] ='Department'; 
             return view('export.report',$data);
            
         }
        
    }

    public function getDepartment($first,$last,$loc1)
    {
       
            DumpDepartment::truncate();
            $created1=0;
            $resolved1=0;
            $closed1=0;
            $progressed1=0;

            $created15=0;
            $resolved15=0;
            $closed15=0;
            $progressed15=0;
            
            $created30=0;
            $resolved30=0;
            $closed30=0;
            $progressed30=0;

            $created33=0;
            $resolved33=0;
            $closed33=0;
            $progressed33=0;
            $sort=0;
           
           $totalticket = \DB::table('services')->select('id','service_name')->where('status',1)->get();
    
            foreach($totalticket as $row)
            {
 
                if(is_null($loc1)){
                 $service= \DB::table('client_result as cr')
                ->join('tickets as t','t.id','=','cr.ticket_id')
                ->select('t.created_at','t.status','cr.service','cr.company_location')
                ->whereBetween('t.created_at', [$first, $last])
                ->where('cr.service',$row->id)->get();    
                }else{
                $service= \DB::table('client_result as cr')
                ->join('tickets as t','t.id','=','cr.ticket_id')
                ->join ('centres as c','c.centre','=','cr.company_location')
                ->join ('organization as o','o.id','=','c.region_id')
                ->select('t.created_at','t.status','cr.service','cr.company_location','o.address','c.centre')
                ->where('o.address',$loc1)
                ->whereBetween('t.created_at', [$first, $last])
                ->where('cr.service',$row->id)->get();                    
                }
                foreach($service as $val)
                {
                    $fdate = now();
                    $tdate = $val->created_at;
                    $datetime1 = new DateTime($fdate);
                    $datetime2 = new DateTime($tdate);
                    $interval = $datetime1->diff($datetime2);

                   //echo  $interval->format('%a days');

                    if($interval->format('%a days') < 7)
                    {
                        $created = Tickets::where('status',1)->where('created_at',$val->created_at)->count();
                        $created1+=$created;
                        $resolved = Tickets::where('status',2)->where('created_at',$val->created_at)->count();
                        $resolved1+=$resolved;
                        $closed1 = Tickets::where('status',3)->where('created_at',$val->created_at)->count();
                        $closed1+=$closed1;
                        $progressed = Tickets::where('status',8)->where('created_at',$val->created_at)->count();
                        $progressed1+=$progressed;
                    }
                    if($interval->format('%a days') > 7 AND $interval->format('%a days') <=15)
                    {
                      $created7 = Tickets::where('status',1)->where('created_at',$val->created_at)->count();
                      $created15+=$created7; 
                      $resolved7 = Tickets::where('status',2)->where('created_at',$val->created_at)->count();
                     $resolved15+=$resolved7;
                      $closed7 = Tickets::where('status',3)->where('created_at',$val->created_at)->count();
                      $closed15+=$closed7;
                      $progressed7 = Tickets::where('status',8)->where('created_at',$val->created_at)->count();
                      $progressed15+=$progressed7;
                    }
                    if($interval->format('%a days') >= 16 AND $interval->format('%a days') <=30)
                    {
                      $created16 = Tickets::where('status',1)->where('created_at',$val->created_at)->count();
                      $created30+=$created16;
                      $resolved16 = Tickets:: where('status',2)->where('created_at',$val->created_at)->count();
                      $resolved30+=$resolved16;
                      $closed16 = Tickets::where('status',3)->where('created_at',$val->created_at)->count();
                      $closed30+=$closed16;
                      $progressed16 = Tickets::where('status',8)->where('created_at',$val->created_at)->count();
                      $progressed30+=$progressed16;
                    }
                    if( $interval->format('%a days') >30)
                    {
                      $created3 = Tickets::where('status',1)->where('created_at',$val->created_at)->count();
                      $created33+=$created3;
                      $resolved3 = Tickets:: where('status',2)->where('created_at',$val->created_at)->count();
                      $resolved33+=$resolved3;
                      $closed3 = Tickets::where('status',3)->where('created_at',$val->created_at)->count();
                      $closed33+=$closed3;
                      $progressed3 = Tickets::where('status',8)->where('created_at',$val->created_at)->count();
                      $progressed33+=$progressed3;
                    }
                     
                if($created1!=0 OR $resolved1!=0 OR $closed1!=0 OR $progressed1!=0 OR $created15!=0 OR $resolved15!=0 OR $closed15!=0 OR 
                    $progressed15!=0 OR $created30!=0 OR $resolved30!=0 OR $closed30!=0 OR $progressed30!=0 OR $created33!=0 OR $resolved33!=0 OR $closed33!=0 OR $progressed33!=0){

                    $sort=1; 
                }

                   
                }
                
       DumpDepartment::insert(['service_name'=>$row->service_name,'Open'=>$created1,'Resolved'=>$resolved1,'Closed'=>$closed1,
           'OPen_7_15'=>$created15,'Resolved_7_15'=>$resolved15,'Closed_7_15'=>$closed15,'OPen_16_30'=>$created30,'Resolved_16_30'=>$resolved30,'Closed_16_30'=>$closed30,'OPen_30'=>$created33,'Resolved_30'=>$resolved33,'Closed_30'=>$closed33,'Progress'=>$progressed1,'Progress_7_15'=>$progressed15,'Progress_16_30'=>$progressed30,'Progress_30'=>$progressed33,
               'sort_service_datawise'=>$sort
             ]);


             $created1=0;$resolved1=0;$closed1=0; $progressed1=0;
             $created15=0;$resolved15=0;$closed15=0;$progressed15=0;$created30=0;$resolved30=0; $closed30=0;$progressed30=0;
             $created33=0;
             $resolved33=0;
             $closed33=0;
             $progressed33=0;
             $sort=0;

                /** nested foreach loop end */
                    
            }  

            /** foreach outer loop end */

        return DumpDepartment::orderby('sort_service_datawise','DESc')->get();

    }

    public function getRegion($first,$last,$loc1)
    {
            DumpDepartment::truncate();
            $created1=0;
            $resolved1=0;
            $closed1=0;
            $progressed1=0;

            $created15=0;
            $resolved15=0;
            $closed15=0;
            $progressed15=0;
            
            $created30=0;
            $resolved30=0;
            $closed30=0;
            $progressed30=0;   

            $created33=0;
            $resolved33=0;
            $closed33=0;
            $progressed33=0;
            if(is_null($loc1)){            
                $totalticket = \DB::table('client_result as cr')
                ->join ('centres as c','c.centre','=','cr.company_location')
                ->join ('organization as o','o.id','=','c.region_id')
                ->select('c.centre','o.address','cr.company_location') 
                ->groupBy('o.address')
                ->get();       
            }else{
                $totalticket = \DB::table('client_result as cr')
                ->join ('centres as c','c.centre','=','cr.company_location')
                ->join ('organization as o','o.id','=','c.region_id')
                ->select('c.centre','o.address','cr.company_location')
                ->where('o.address',$loc1) 
                ->groupBy('o.address')
                ->get(); 
            }
            foreach($totalticket as $row)
            {
                
                    $service= \DB::table('client_result as cr')
                    ->join('tickets as t','t.id','=','cr.ticket_id')
                    ->join ('centres as c','c.centre','=','cr.company_location')
                    ->join ('organization as o','o.id','=','c.region_id')
                    ->select('c.centre','o.address','t.created_at','t.status','cr.company_location') 
                    ->whereBetween('t.created_at', [$first, $last])
                    ->where('o.address',$row->address)
                    ->get();  
                
                foreach($service as $val)
                {
                    $fdate = now();
                    $tdate = $val->created_at;
                    $datetime1 = new DateTime($fdate);
                    $datetime2 = new DateTime($tdate);
                    $interval = $datetime1->diff($datetime2); 
                   //echo  $interval->format('%a days');

                    if($interval->format('%a days') < 7)
                    {
                        $created = Tickets::select('created_at')->where('status',1)->where('created_at',$val->created_at)->count();
                        $created1+=$created;
                        $resolved = Tickets::select('created_at')-> where('status',2)->where('created_at',$val->created_at)->count();
                        $resolved1+=$resolved;
                        $closed1 = Tickets::select('created_at')->where('status',3)->where('created_at',$val->created_at)->count();
                        $closed1+=$closed1;
                        $progressed = Tickets::where('status',8)->where('created_at',$val->created_at)->count();
                        $progressed1+=$progressed;
                    }
                    if($interval->format('%a days') > 7 AND $interval->format('%a days') <=15)
                    {
                      $created7 = Tickets::where('status',1)->where('created_at',$val->created_at)->count();
                      $created15+=$created7; 
                      $resolved7 = Tickets:: where('status',2)->where('created_at',$val->created_at)->count();
                     $resolved15+=$resolved7;
                      $closed7 = Tickets::where('status',3)->where('created_at',$val->created_at)->count();
                      $closed15+=$closed7;
                      $progressed7 = Tickets::where('status',8)->where('created_at',$val->created_at)->count();
                      $progressed15+=$progressed7;
                    }
                    if($interval->format('%a days') >= 16 AND $interval->format('%a days') <=30)
                    {
                      $created16 = Tickets::where('status',1)->where('created_at',$val->created_at)->count();
                      $created30+=$created16;
                      $resolved16 = Tickets:: where('status',2)->where('created_at',$val->created_at)->count();
                      $resolved30+=$resolved16;
                      $closed16 = Tickets::where('status',3)->where('created_at',$val->created_at)->count();
                      $closed30+=$closed16;
                      $progressed16 = Tickets::where('status',8)->where('created_at',$val->created_at)->count();
                      $progressed30+=$progressed16;
                    }
                    if( $interval->format('%a days') >30)
                    {
                      $created3 = Tickets::where('status',1)->where('created_at',$val->created_at)->count();
                      $created33+=$created3;
                      $resolved3 = Tickets:: where('status',2)->where('created_at',$val->created_at)->count();
                      $resolved33+=$resolved3;
                      $closed3 = Tickets::where('status',3)->where('created_at',$val->created_at)->count();
                      $closed33+=$closed3;
                      $progressed3 = Tickets::where('status',8)->where('created_at',$val->created_at)->count();
                      $progressed33+=$progressed3;
                    }
                     
                }
                
 DumpDepartment::insert(['service_name'=>$row->address,'Open'=>$created1,'Resolved'=>$resolved1,'Closed'=>$closed1,
    'OPen_7_15'=>$created15,'Resolved_7_15'=>$resolved15,'Closed_7_15'=>$closed15,'OPen_16_30'=>$created30,'Resolved_16_30'=>$resolved30,'Closed_16_30'=>$closed30,'OPen_30'=>$created33,'Resolved_30'=>$resolved33,'Closed_30'=>$closed33,'Progress'=>$progressed1,'Progress_7_15'=>$progressed15,'Progress_16_30'=>$progressed30,'Progress_30'=>$progressed33,
    ]);


             $created1=0; $resolved1=0;$closed1=0;$progressed1=0;
              $created15=0; $resolved15=0;$closed15=0;$progressed15=0;
              $created30=0;$resolved30=0; $closed30=0;$progressed30=0;
              $created33=0;
              $resolved33=0;
              $closed33=0;
              $progressed33=0;

                /** nested foreach loop end */
                    
            }       
            /** foreach outer loop end */
         
          return DumpDepartment::all();
    }


    public function getReportedVia($first,$last,$loc1)
    {
            DumpDepartment::truncate();
            $created1=0;
            $resolved1=0;
            $closed1=0;
            $progressed1=0;

            $created15=0;
            $resolved15=0;
            $closed15=0;
            $progressed15=0;
            
            $created30=0;
            $resolved30=0;
            $closed30=0;
            $progressed30=0;   

            $created33=0;
            $resolved33=0;
            $closed33=0;
            $progressed33=0;
      
                if(is_null($loc1)){
                    $totalticket = \DB::table('client_result as cr')
                    ->join ('reported_table as r','r.id','=','cr.reported_by')
                    ->select('cr.reported_by','r.name')
                    ->groupBy('cr.reported_by')
                    ->get();       
                }else{
                   
                    $totalticket = \DB::table('client_result as cr')
                    ->join ('reported_table as r','r.id','=','cr.reported_by')
                    ->join ('centres as c','c.centre','=','cr.company_location')
                    ->join ('organization as o','o.id','=','c.region_id')
                    ->select('cr.reported_by','r.name','o.address','c.centre')
                    ->groupBy('cr.reported_by')
                    ->where('o.address',$loc1)
                    ->get();  
                }
             
            foreach($totalticket as $row)
            { 
                    $service= \DB::table('client_result as cr')
                    ->join('tickets as t','t.id','=','cr.ticket_id')
                    ->select('t.created_at','t.status','cr.reported_by')->where('cr.reported_by',$row->reported_by)
                    ->whereBetween('t.created_at', [$first, $last]) 
                    ->get();
                
                foreach($service as $val)
                {
                    $fdate = now();
                    $tdate = $val->created_at;
                    $datetime1 = new DateTime($fdate);
                    $datetime2 = new DateTime($tdate);
                    $interval = $datetime1->diff($datetime2);

                   //echo  $interval->format('%a days');

                    if($interval->format('%a days') < 7)
                    {
                        $created = Tickets::select('created_at')->where('status',1)->where('created_at',$val->created_at)->count();
                        $created1+=$created;
                        $resolved = Tickets::select('created_at')-> where('status',2)->where('created_at',$val->created_at)->count();
                        $resolved1+=$resolved;
                        $closed1 = Tickets::select('created_at')->where('status',3)->where('created_at',$val->created_at)->count();
                        $closed1+=$closed1;
                        $progressed = Tickets::where('status',8)->where('created_at',$val->created_at)->count();
                        $progressed1+=$progressed;
                    }
                    if($interval->format('%a days') > 7 AND $interval->format('%a days') <=15)
                    {
                      $created7 = Tickets::where('status',1)->where('created_at',$val->created_at)->count();
                      $created15+=$created7; 
                      $resolved7 = Tickets:: where('status',2)->where('created_at',$val->created_at)->count();
                     $resolved15+=$resolved7;
                      $closed7 = Tickets::where('status',3)->where('created_at',$val->created_at)->count();
                      $closed15+=$closed7;
                       $progressed7 = Tickets::where('status',8)->where('created_at',$val->created_at)->count();
                      $progressed15+=$progressed7;
                    }
                    if($interval->format('%a days') >= 16 AND $interval->format('%a days') <=30)
                    {
                      $created16 = Tickets::where('status',1)->where('created_at',$val->created_at)->count();
                      $created30+=$created16;
                      $resolved16 = Tickets:: where('status',2)->where('created_at',$val->created_at)->count();
                      $resolved30+=$resolved16;
                      $closed16 = Tickets::where('status',3)->where('created_at',$val->created_at)->count();
                      $closed30+=$closed16;
                      $progressed16 = Tickets::where('status',8)->where('created_at',$val->created_at)->count();
                      $progressed30+=$progressed16;
                    }
                    if( $interval->format('%a days') >30)
                    {
                      $created3 = Tickets::where('status',1)->where('created_at',$val->created_at)->count();
                      $created33+=$created3;
                      $resolved3 = Tickets:: where('status',2)->where('created_at',$val->created_at)->count();
                      $resolved33+=$resolved3;
                      $closed3 = Tickets::where('status',3)->where('created_at',$val->created_at)->count();
                      $closed33+=$closed3;
                      $progressed3 = Tickets::where('status',8)->where('created_at',$val->created_at)->count();
                      $progressed33+=$progressed3;
                    }
                     
                }
                
 DumpDepartment::insert(['service_name'=>$row->name,'Open'=>$created1,'Resolved'=>$resolved1,'Closed'=>$closed1,
    'OPen_7_15'=>$created15,'Resolved_7_15'=>$resolved15,'Closed_7_15'=>$closed15,'OPen_16_30'=>$created30,'Resolved_16_30'=>$resolved30,'Closed_16_30'=>$closed30,'OPen_30'=>$created33,'Resolved_30'=>$resolved33,'Closed_30'=>$closed33,'Progress'=>$progressed1,'Progress_7_15'=>$progressed15,'Progress_16_30'=>$progressed30,'Progress_30'=>$progressed33, 
    ]);


             $created1=0; $resolved1=0;$closed1=0; $created15=0;  $resolved15=0;$closed15=0;$created30=0;$resolved30=0; $closed30=0;
             $created33=0;
             $resolved33=0;
             $closed33=0;
             $progressed1=0;
            $progressed15=0;
            $progressed30=0;
            $progressed33=0;
               

                /** nested foreach loop end */
                    
            }       
            /** foreach outer loop end */
             return DumpDepartment::all();
    }
    public function getContactcentre($first,$last,$loc1)
    {
            DumpDepartment::truncate();
            $created1=0;
            $resolved1=0;
            $closed1=0;
            $progressed1=0;

            $created15=0;
            $resolved15=0;
            $closed15=0;
            $progressed15=0;
            
            $created30=0;
            $resolved30=0;
            $closed30=0;
            $progressed30=0;   

            $created33=0;
            $resolved33=0;
            $closed33=0;
            $progressed33=0;
            if(is_null($loc1)){     
                $totalticket= \DB::table('client_result as cr') 
                ->select('cr.id','cr.service','cr.company_location','cr.service_issue')                 
                ->where('cr.service',12)->get();    
            }else{
                $totalticket= \DB::table('client_result as cr') 
                ->join ('centres as c','c.centre','=','cr.company_location')
                ->join ('organization as o','o.id','=','c.region_id')
                ->select('cr.id', 'cr.service','cr.company_location','cr.service_issue','o.address','cr.company_location')                             
                ->where('cr.service',12)
                ->where('o.address',$loc1) 
                ->get(); 
                
            }
            foreach($totalticket as $row)
            {
                
                    $service= \DB::table('client_result as cr')
                    ->join('tickets as t','t.id','=','cr.ticket_id')
                    ->join ('centres as c','c.centre','=','cr.company_location')
                    ->join ('organization as o','o.id','=','c.region_id')
                    ->select('c.centre','o.address','t.created_at','t.status','cr.company_location') 
                    ->whereBetween('t.created_at', [$first, $last])
                    ->where('cr.service_issue',$row->service_issue)
                    ->get();   
                          
                foreach($service as $val)
                {
                    $fdate = now();
                    $tdate = $val->created_at;
                    $datetime1 = new DateTime($fdate);
                    $datetime2 = new DateTime($tdate);
                    $interval = $datetime1->diff($datetime2);

                   //echo  $interval->format('%a days');

                    if($interval->format('%a days') < 7)
                    {
                        $created = Tickets::select('created_at')->where('status',1)->where('created_at',$val->created_at)->count();
                        $created1+=$created;
                        $resolved = Tickets::select('created_at')-> where('status',2)->where('created_at',$val->created_at)->count();
                        $resolved1+=$resolved;
                        $closed1 = Tickets::select('created_at')->where('status',3)->where('created_at',$val->created_at)->count();
                        $closed1+=$closed1;
                        $progressed = Tickets::where('status',8)->where('created_at',$val->created_at)->count();
                        $progressed1+=$progressed;
                    }
                    if($interval->format('%a days') > 7 AND $interval->format('%a days') <=15)
                    {
                      $created7 = Tickets::where('status',1)->where('created_at',$val->created_at)->count();
                      $created15+=$created7; 
                      $resolved7 = Tickets:: where('status',2)->where('created_at',$val->created_at)->count();
                     $resolved15+=$resolved7;
                      $closed7 = Tickets::where('status',3)->where('created_at',$val->created_at)->count();
                      $closed15+=$closed7;
                       $progressed7 = Tickets::where('status',8)->where('created_at',$val->created_at)->count();
                      $progressed15+=$progressed7;
                    }
                    if($interval->format('%a days') >= 16 AND $interval->format('%a days') <=30)
                    {
                      $created16 = Tickets::where('status',1)->where('created_at',$val->created_at)->count();
                      $created30+=$created16;
                      $resolved16 = Tickets:: where('status',2)->where('created_at',$val->created_at)->count();
                      $resolved30+=$resolved16;
                      $closed16 = Tickets::where('status',3)->where('created_at',$val->created_at)->count();
                      $closed30+=$closed16;
                      $progressed16 = Tickets::where('status',8)->where('created_at',$val->created_at)->count();
                      $progressed30+=$progressed16;
                    }
                    if( $interval->format('%a days') >30)
                    {
                      $created3 = Tickets::where('status',1)->where('created_at',$val->created_at)->count();
                      $created33+=$created3;
                      $resolved3 = Tickets:: where('status',2)->where('created_at',$val->created_at)->count();
                      $resolved33+=$resolved3;
                      $closed3 = Tickets::where('status',3)->where('created_at',$val->created_at)->count();
                      $closed33+=$closed3;
                      $progressed3 = Tickets::where('status',8)->where('created_at',$val->created_at)->count();
                      $progressed33+=$progressed3;
                    }
                     
                }
                
 DumpDepartment::insert(['service_name'=>$row->service_issue,'Open'=>$created1,'Resolved'=>$resolved1,'Closed'=>$closed1,
    'OPen_7_15'=>$created15,'Resolved_7_15'=>$resolved15,'Closed_7_15'=>$closed15,'OPen_16_30'=>$created30,'Resolved_16_30'=>$resolved30,'Closed_16_30'=>$closed30,'OPen_30'=>$created33,'Resolved_30'=>$resolved33,'Closed_30'=>$closed33,'Progress'=>$progressed1,'Progress_7_15'=>$progressed15,'Progress_16_30'=>$progressed30,'Progress_30'=>$progressed33, 
    ]);


             $created1=0; $resolved1=0;$closed1=0; $created15=0;  $resolved15=0;$closed15=0;$created30=0;$resolved30=0; $closed30=0;
             $created33=0;
             $resolved33=0;
             $closed33=0;
             $progressed1=0;
            $progressed15=0;
            $progressed30=0;
            $progressed33=0;
               

                /** nested foreach loop end */
                    
            }       
            /** foreach outer loop end */
             return DumpDepartment::all();
    }
 
    public function getDeptContact($first,$last,$loc1)
    {
       
            DumpDepartment::truncate();
            $created1=0;
            $resolved1=0;
            $closed1=0;
            $progressed1=0;

            $created15=0;
            $resolved15=0;
            $closed15=0;
            $progressed15=0;
            
            $created30=0;
            $resolved30=0;
            $closed30=0;
            $progressed30=0;

            $created33=0;
            $resolved33=0;
            $closed33=0;
            $progressed33=0;
            $sort=0;
            if(is_null($loc1)){     
                $totalticket= \DB::table('client_result as cr')
                ->join('service_issue as si','si.service_issue_name','=','cr.service_issue')
                ->join('contact_centre_dept as cc','cc.service_issue_id','=','si.id') 
                ->select('cr.id','cr.service','cr.company_location','cr.service_issue','cc.department') 
                ->where('cr.service',12) 
                ->groupBy('cc.department') 
                ->get();    
            }else{
                $totalticket= \DB::table('client_result as cr')                
                ->join('service_issue as si','si.service_issue_name','=','cr.service_issue')
                ->join('contact_centre_dept as cc','cc.service_issue_id','=','si.id') 
                ->join ('centres as c','c.centre','=','cr.company_location')
                ->join ('organization as o','o.id','=','c.region_id')
                ->select('cr.id', 'cr.service','cr.company_location','cr.service_issue','o.address','cr.company_location','cc.department')                             
                ->where('cr.service',12)
                ->where('o.address',$loc1) 
                ->groupBy('cc.department') 
                ->get();                 
            }
            foreach($totalticket as $row)
            {
                  $service= \DB::table('client_result as cr')
                    ->join('tickets as t','t.id','=','cr.ticket_id') 
                    ->join ('centres as c','c.centre','=','cr.company_location')
                    ->join('service_issue as si','si.service_issue_name','=','cr.service_issue')
                    ->join('contact_centre_dept as cc','cc.service_issue_id','=','si.id') 
                    ->join ('organization as o','o.id','=','c.region_id')
                    ->select('c.centre','o.address','t.created_at','t.status','cr.company_location','cc.department')                    
                    ->whereBetween('t.created_at', [$first, $last]) 
                    ->where('cc.department',$row->department)
                    ->get();          
                foreach($service as $val)
                {
                    $fdate = now();
                    $tdate = $val->created_at;
                    $datetime1 = new DateTime($fdate);
                    $datetime2 = new DateTime($tdate);
                    $interval = $datetime1->diff($datetime2);

                   //echo  $interval->format('%a days');

                    if($interval->format('%a days') < 7)
                    {
                        $created = Tickets::where('status',1)->where('created_at',$val->created_at)->count();
                        $created1+=$created;
                        $resolved = Tickets:: where('status',2)->where('created_at',$val->created_at)->count();
                        $resolved1+=$resolved;
                        $closed1 = Tickets::where('status',3)->where('created_at',$val->created_at)->count();
                        $closed1+=$closed1;
                        $progressed = Tickets::where('status',8)->where('created_at',$val->created_at)->count();
                        $progressed1+=$progressed;
                    }
                    if($interval->format('%a days') > 7 AND $interval->format('%a days') <=15)
                    {
                      $created7 = Tickets::where('status',1)->where('created_at',$val->created_at)->count();
                      $created15+=$created7; 
                      $resolved7 = Tickets:: where('status',2)->where('created_at',$val->created_at)->count();
                     $resolved15+=$resolved7;
                      $closed7 = Tickets::where('status',3)->where('created_at',$val->created_at)->count();
                      $closed15+=$closed7;
                      $progressed7 = Tickets::where('status',8)->where('created_at',$val->created_at)->count();
                      $progressed15+=$progressed7;
                    }
                    if($interval->format('%a days') >= 16 AND $interval->format('%a days') <=30)
                    {
                      $created16 = Tickets::where('status',1)->where('created_at',$val->created_at)->count();
                      $created30+=$created16;
                      $resolved16 = Tickets:: where('status',2)->where('created_at',$val->created_at)->count();
                      $resolved30+=$resolved16;
                      $closed16 = Tickets::where('status',3)->where('created_at',$val->created_at)->count();
                      $closed30+=$closed16;
                      $progressed16 = Tickets::where('status',8)->where('created_at',$val->created_at)->count();
                      $progressed30+=$progressed16;
                    }
                    if( $interval->format('%a days') >30)
                    {
                      $created3 = Tickets::where('status',1)->where('created_at',$val->created_at)->count();
                      $created33+=$created3;
                      $resolved3 = Tickets:: where('status',2)->where('created_at',$val->created_at)->count();
                      $resolved33+=$resolved3;
                      $closed3 = Tickets::where('status',3)->where('created_at',$val->created_at)->count();
                      $closed33+=$closed3;
                      $progressed3 = Tickets::where('status',8)->where('created_at',$val->created_at)->count();
                      $progressed33+=$progressed3;
                    }
                     
                if($created1!=0 OR $resolved1!=0 OR $closed1!=0 OR $progressed1!=0 OR $created15!=0 OR $resolved15!=0 OR $closed15!=0 OR 
                    $progressed15!=0 OR $created30!=0 OR $resolved30!=0 OR $closed30!=0 OR $progressed30!=0 OR $created33!=0 OR $resolved33!=0 OR $closed33!=0 OR $progressed33!=0){

                    $sort=1; 
                }

                   
                }
                
       DumpDepartment::insert(['service_name'=>$row->department,'Open'=>$created1,'Resolved'=>$resolved1,'Closed'=>$closed1,
           'OPen_7_15'=>$created15,'Resolved_7_15'=>$resolved15,'Closed_7_15'=>$closed15,'OPen_16_30'=>$created30,'Resolved_16_30'=>$resolved30,'Closed_16_30'=>$closed30,'OPen_30'=>$created33,'Resolved_30'=>$resolved33,'Closed_30'=>$closed33,'Progress'=>$progressed1,'Progress_7_15'=>$progressed15,'Progress_16_30'=>$progressed30,'Progress_30'=>$progressed33,
               'sort_service_datawise'=>$sort
             ]);


             $created1=0;$resolved1=0;$closed1=0; $progressed1=0;
             $created15=0;$resolved15=0;$closed15=0;$progressed15=0;$created30=0;$resolved30=0; $closed30=0;$progressed30=0;
             $created33=0;
             $resolved33=0;
             $closed33=0;
             $progressed33=0;
             $sort=0;

                /** nested foreach loop end */
                    
            }  

            /** foreach outer loop end */

        return DumpDepartment::orderby('sort_service_datawise','DESc')->get();

    }

    public function getReports($first, $last,$loc1)
    {  
        if(is_null($loc1)){
            $report = \DB::table('tickets as t')
            ->select('t.id','t.ticket_number','t.user_id','t.status','t.created_at','t.updated_at','t.closed_at','t.assigned_to','t.status_updated_by',
                'c.service','c.service_issue','c.company_location','c.client_name','c.member_no','c.reported_by','c.scheme','c.created_at','c.member_type')
            ->join('client_result as c','c.ticket_id','=','t.id')
            ->whereBetween('t.created_at', [$first, $last])
            ->where('t.status','!=',5)
            ->get(); 
        }else{
            $report = \DB::table('tickets as t')
            ->select('t.id','t.ticket_number','t.user_id','t.status','t.created_at','t.updated_at','t.closed_at','t.assigned_to','t.status_updated_by',
                'c.service','c.service_issue','c.company_location','c.client_name','c.member_no','c.reported_by','c.scheme','c.created_at','c.member_type' 
                )
            ->join('client_result as c','c.ticket_id','=','t.id')
            ->join('centres as ce','ce.centre','=','c.company_location')
            ->join('organization as o','o.id','=','ce.region_id')
            ->whereBetween('t.created_at', [$first, $last])
            ->where('t.status','!=',5)
            ->where('o.address','=',$loc1)
            ->get();  
          } 
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

 
        }

  
       
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
    public function export() 
    {
            
            return view('textt');
          //return Excel::download(new \App\Http\Controllers\Common\ExcelController, 'invoices.xls');
   }
  
}
