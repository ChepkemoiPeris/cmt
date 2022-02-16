<?php

namespace App\Http\Controllers\Agent\helpdesk;
use App\Http\Controllers\Controller;
use App\User;
use Auth;
use Illuminate\Http\Request;
use DB;
use Exception;
use App\Model\helpdesk\Agent\Service;
use App\Model\helpdesk\Agent\ServiceIssue;
use App\Model\helpdesk\Agent\EsclationMatrix;

use App\Model\helpdesk\Agent_panel\Organization;

use View;
use Session;
use App\Http\Requests\helpdesk\ServiceRequest;
use App\Http\Requests\helpdesk\ServiceIssueRequest;
use App\Http\Requests\helpdesk\EsclationMatrixRequest;
use Illuminate\Contracts\Encryption\DecryptException;
use Illuminate\Support\Facades\Crypt;

/**
 * DashboardController
 * This controlleris used to fetch dashboard in the agent panel.
 *
 * @author      Ladybird <info@ladybirdweb.com>
 */
class DashboardController extends Controller
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
     * Get the dashboard page.
     *
     * @return type view
     */
    public function index()
    {
        try {
            return View::make('themes.default1.agent.helpdesk.dashboard.dashboard');
        } catch (Exception $e) {
            return View::make('themes.default1.agent.helpdesk.dashboard.dashboard');
        }
    }

    /**
     * Fetching dashboard graph data to implement graph.
     *
     * @return type Json
     */
    public function ChartData($date111 = '', $date122 = '')
    {
        $date11 = strtotime($date122);
        $date12 = strtotime($date111);
        if ($date11 && $date12) {
            $date2 = $date12;
            $date1 = $date11;
        } else {
            // generating current date
            $date2 = strtotime(date('Y-m-d'));
            $date3 = date('Y-m-d');
            $format = 'Y-m-d';
            // generating a date range of 1 month
            $date1 = strtotime(date($format, strtotime('-1 month'.$date3)));
        }
        $return = '';
        $last = '';
        for ($i = $date1; $i <= $date2; $i = $i + 86400) {
            $thisDate = date('Y-m-d', $i);

            $created = \DB::table('tickets')->select('created_at')->where('created_at', 'LIKE', '%'.$thisDate.'%')->count();
            $closed = \DB::table('tickets')->select('closed_at')->where('closed_at', 'LIKE', '%'.$thisDate.'%')->count();
            $reopened = \DB::table('tickets')->select('reopened_at')->where('reopened_at', 'LIKE', '%'.$thisDate.'%')->count();

            $value = ['date' => $thisDate, 'open' => $created, 'closed' => $closed, 'reopened' => $reopened];
            $array = array_map('htmlentities', $value);
            $json = html_entity_decode(json_encode($array));
            $return .= $json.',';
        }
        $last = rtrim($return, ',');

        return '['.$last.']';

        // $ticketlist = DB::table('tickets')
        //     ->select(DB::raw('MONTH(updated_at) as month'),DB::raw('SUM(CASE WHEN status = 3 THEN 1 ELSE 0 END) as closed'),DB::raw('SUM(CASE WHEN status = 2 THEN 1 ELSE 0 END) as reopened'),DB::raw('SUM(CASE WHEN status = 1 THEN 1 ELSE 0 END) as open'),DB::raw('SUM(CASE WHEN status = 5 THEN 1 ELSE 0 END) as deleted'),
        //         DB::raw('count(*) as totaltickets'))
        //     ->groupBy('month')
        //     ->orderBy('month', 'asc')
        //     ->get();
        // return $ticketlist;
    }

    public function userChartData($id, $date111 = '', $date122 = '')
    {
         
        $date11 = strtotime($date122);
        $date12 = strtotime($date111);
        if ($date11 && $date12) {
            $date2 = $date12;
            $date1 = $date11;
        } else {
            // generating current date
            $date2 = strtotime(date('Y-m-d'));
            $date3 = date('Y-m-d');
            $format = 'Y-m-d';
            // generating a date range of 1 month
            $date1 = strtotime(date($format, strtotime('-1 month'.$date3)));
        }
        $return = '';
        $last = '';
        for ($i = $date1; $i <= $date2; $i = $i + 86400) {
            $thisDate = date('Y-m-d', $i);
            $user = User::whereId($id)->first();
            if ($user->role == 'user') {
                $created = \DB::table('tickets')->select('created_at')->where('user_id', '=', $id)->where('created_at', 'LIKE', '%'.$thisDate.'%')->count();
                $closed = \DB::table('tickets')->select('closed_at')->where('user_id', '=', $id)->where('closed_at', 'LIKE', '%'.$thisDate.'%')->count();
                $reopened = \DB::table('tickets')->select('reopened_at')->where('user_id', '=', $id)->where('reopened_at', 'LIKE', '%'.$thisDate.'%')->count();
            } else {
                $created = \DB::table('tickets')->select('created_at')->where('assigned_to', '=', $id)->where('created_at', 'LIKE', '%'.$thisDate.'%')->count();
                $closed = \DB::table('tickets')->select('closed_at')->where('assigned_to', '=', $id)->where('closed_at', 'LIKE', '%'.$thisDate.'%')->count();
                $reopened = \DB::table('tickets')->select('reopened_at')->where('assigned_to', '=', $id)->where('reopened_at', 'LIKE', '%'.$thisDate.'%')->count();
            }
            $value = ['date' => $thisDate, 'open' => $created, 'closed' => $closed, 'reopened' => $reopened];
            $array = array_map('htmlentities', $value);
            $json = html_entity_decode(json_encode($array));
            $return .= $json.',';
        }
        $last = rtrim($return, ',');
        $users = User::whereId($id)->first();

        return '['.$last.']';

        // $ticketlist = DB::table('tickets')
        //     ->select(DB::raw('MONTH(updated_at) as month'),DB::raw('SUM(CASE WHEN status = 3 THEN 1 ELSE 0 END) as closed'),DB::raw('SUM(CASE WHEN status = 2 THEN 1 ELSE 0 END) as reopened'),DB::raw('SUM(CASE WHEN status = 1 THEN 1 ELSE 0 END) as open'),DB::raw('SUM(CASE WHEN status = 5 THEN 1 ELSE 0 END) as deleted'),
        //         DB::raw('count(*) as totaltickets'))
        //     ->groupBy('month')
        //     ->orderBy('month', 'asc')
        //     ->get();
        // return $ticketlist;
    }




    public function getEsclation()
    {
         try {
            $data['servicelist']= Service::where('status',1)->get();
            $data['company'] = Organization::select('name')->distinct()->get();
            
            $data['matrixdata'] = DB::table('esclation_matrix')->select('companyservice')->distinct()->get();
          
             return View::make('themes.default1.agent.helpdesk.dashboard.esclation',$data);
            
        } catch (Exception $e) {
            return redirect()->back()->with('fails', $e->getMessage());
        }

    }
    public function saveService(ServiceRequest $request)
    {
        try {
             Service::create([
                'service_name'=>strtoupper($request->service_name),
                'status'=>'1',
           ]);
             
             Session::flash('message', 'Service Created Successfully');
             return redirect()->route('esclation.matrix');

        } catch(Exception $e) {
            return redirect()->back()->with('fails', $e->getMessage());
        }
    }

    public function saveServiceIssue(ServiceIssueRequest $request)
    {
        try {
              
            ServiceIssue::create([
                'service_id'=> $request->service_id,
                'service_issue_name' => ucwords($request->service_issue_name),
            ]);
             
             Session::flash('message', 'Service Issue Created Successfully');
             return redirect()->route('esclation.matrix');

        } catch(Exception $e) {
             return redirect()->back()->with('fails', $e->getMessage());
        }
    }


   /* public function getServiceByAjax(Request $request)
    {

        if($request->Ajax()){
             $serviceid= $request->serviceid;
             return  ServiceIssue::select('id','service_issue_name')->where('service_id',$serviceid)->get();
        }
    }*/

    public function getCompanyRegionByAjax(Request $request)
    {

        if($request->Ajax()){
             $companyname= $request->companyid;
             return  Organization::select('address')->where('name',$companyname)->get();
        }
    }
    public function saveEsclationMatrix(EsclationMatrixRequest $request)
    {
        try {
           // dd($request->all());
              $serviceid = Service::find($request->companyservice);
             // $company = Organization::where(''$request->company_id);
            //  dd($company->name);

               $res= EsclationMatrix::where(['companyservice'=>$serviceid->service_name,'company_service_issue'=>$request->company_service_issue,'region'=>$request->region])->first();

                

               $data=[];

                 $data['company_name'] = $request->company_id;
                 $data['companyservice'] = $serviceid->service_name;
                 $data['company_service_issue'] = $request->company_service_issue;
                 $data['region'] = $request->region;
                 $data['level'] = $request->level;
                 if($request->level==1){
                 $data['min1'] = $request->minutes;
                 $data['email1'] = $request->email;
                 }
                 if($request->level==2){
                 $data['min2'] = $request->minutes;
                 $data['email2'] = $request->email;
                 }
                 if($request->level==3){
                 $data['min3'] = $request->minutes;
                 $data['email3'] = $request->email;
                 }
                 if($request->level==4){
                 $data['min4'] = $request->minutes;
                 $data['email4'] = $request->email;
                 }
                 
                 if($res){
                    
                   if($res->email1==''|| $res->email2=='' || $res->email3=='' || $res->email4==''){
                    
                   EsclationMatrix::where(['companyservice'=>$serviceid->service_name,'company_service_issue'=>$request->company_service_issue,'region'=>$request->region])->update($data);
                     Session::flash('message', 'Data Inserted Successfully');
                 } else {

                            EsclationMatrix::insert($data);
                            Session::flash('message', 'Data Inserted Successfully');
                       }
                    
                } else {
                    
                   EsclationMatrix::insert($data);
                   Session::flash('message', 'Data Inserted Successfully');
                }
            
                // EsclationMatrix::updateOrCreate($data);
               //  
                    
         
             
             
             return redirect()->route('esclation.matrix');

        } catch(Exception $e) {
             return redirect()->back()->with('fails', $e->getMessage());
        }
    }
    public function deleteServiceIssue(Request $request){

        if($request->Ajax()){
            $serviceissue = Crypt::decryptString($request->issueid);
            //$response=  EsclationMatrix::where('company_service_issue',$request->issueid,'deleted_at','null')->delete();
           $response= EsclationMatrix::where(['company_service_issue'=>$serviceissue])->delete();
            if($response){
            echo  1;
            } else {
                echo 0 ;
            }
          
        }
    }
    //delete service
    public function deleteService(Request $request)
    {
            try {
                    $servicename=Crypt::decryptString($request->cname);
                    
                    $res=EsclationMatrix::where('companyservice',trim($servicename))->get();
                    if($res) {
                        EsclationMatrix::where('companyservice',$servicename)->delete();
                        Session::flash('message', 'Service deleted Successfully');
                        return redirect()->route('esclation.matrix');
                         }
                } catch(Exception $e) {
                 return redirect()->back()->with('fails', $e->getMessage());
               }

    }
        

    


}
