<?php

namespace App\Http\Controllers\Client\helpdesk;

// controllers
use App\Http\Controllers\Agent\helpdesk\TicketWorkflowController;
use App\Http\Controllers\Common\FileuploadController;
use App\Http\Controllers\Controller;
// requests
use App\Http\Requests\helpdesk\ClientRequest;
// models
use App\Model\helpdesk\Form\Fields;
use App\Model\helpdesk\Manage\Help_topic;
use App\Model\helpdesk\Settings\CommonSettings;
use App\Model\helpdesk\Settings\System;
use App\Model\helpdesk\Settings\Ticket;
use App\Model\helpdesk\Ticket\Ticket_attachments;
use App\Model\helpdesk\Ticket\Ticket_Priority;
use App\Model\helpdesk\Ticket\Ticket_source;
use App\Model\helpdesk\Ticket\Ticket_Thread;
use App\Model\helpdesk\Ticket\Tickets;
use App\Model\helpdesk\Utility\CountryCode;
use Illuminate\Support\Facades\Auth;
use App\Model\helpdesk\Agent\Service;
use App\Model\helpdesk\Agent\SentEmail;
use App\Model\helpdesk\Agent\ServiceIssue;
use App\Model\helpdesk\Agent\EsclationMatrix;
use App\Model\helpdesk\Agent_panel\Organization;
use App\Model\helpdesk\Agent\ClientResult;
use Session;

use App\User;
use Exception;
// classes
use Form;
use GeoIP;
use Illuminate\Http\Request;
use Lang;
use Redirect;
use DB;
use Mail;

/**
 * FormController.
 *
 * @author      Ladybird <info@ladybirdweb.com>
 */
class FormController extends Controller
{
    /**
     * @var FileuploadController
     */
    protected $fileUploadController;

    /**
     * Create a new controller instance.
     * Constructor to check.
     *
     * @return void
     */
    public function __construct(TicketWorkflowController $TicketWorkflowController, FileuploadController $fileUploadController)
    {
        $this->middleware('board');
        // creating a TicketController instance
        $this->TicketWorkflowController = $TicketWorkflowController;
        $this->fileUploadController = $fileUploadController;
    }

    /**
     * getform.
     *
     * @param type Help_topic $topic
     *
     * @return type
     */
    public function getForm( Request $request,Help_topic $topic, CountryCode $code)
    {
        $data= [];
         try{


            if(!\Auth::check()){
                return redirect('auth/login');
            }

            $data['servicelist']= Service::where('status',1)->get();
            $companyname = "Bliss Medical centre"; 
            $data['location'] = Organization::select('address')->where('name',$companyname)->get();
            $data['serviceissue'] = ServiceIssue::get();
            $data['centres'] = DB::table('centres')->orderBy('centre', 'ASC')->get();
            $data['reported'] = DB::table('reported_table')->get();
           $newstring = trim($request->search);
           $newstring = substr($newstring, -9);
           //echo $newstring;
          
         // $newstring='0725050351'; 
           if($request->has('search_by') && $request->has('search')){
              $search_by = $request->search_by;
           
              $data['search'] = $this->getSearchResult($newstring,$search_by);//call for api
              $data['search_by'] = $request->search_by;
            }
            return view('themes.default1.client.helpdesk.form',$data);
         } catch (Exception $e) {
            return redirect()->back()->with('fails', $e->getMessage());
           }
    
    }

    /**
     * Posted form.
     *
     * @param type Request $request
     * @param type User    $user
     */
    public function democreateticket()
    {
               
    

       // return view('backup_form');//for testing load file here
    }
    //Search by Mobile No
 
   
    public function postedForm(User $user, ClientRequest $request, Ticket $ticket_settings, Ticket_source $ticket_source, Ticket_attachments $ta, CountryCode $code)
    {
        try {
             date_default_timezone_set('Africa/Nairobi'); 
            $form_extras = $request->except('Name', 'Phone', 'Email', 'Subject', 'Details', 'helptopic', '_wysihtml5_mode', '_token', 'mobile', 'Code', 'priority');
           
            $name = $request->input('Name');            
            $phone = $request->input('Phone')? $request->input('Phone'):null;
            $email = $request->input('Email') ? $request->input('Email') : null;
           
            // if ($request->input('Email')) {
            //     if ($request->input('Email')) {
            //         $email = $request->input('Email');
            //     } else {
            //         $email = null;
            //     }
            // } else {
            //     $email = null;
            // }
            $subject = $request->input('Subject');
            $details = $request->input('Details');
            $phonecode = $request->input('Code');
            if ($request->input('mobile')) {
                $mobile_number = $request->input('mobile');
            } else {
                $mobile_number = null; 
            }
            $status = $ticket_settings->first()->status;             
            
            $helptopic = $request->input('helptopic');
            $helpTopicObj = Help_topic::where('id', '=', $helptopic);
           
            if ($helpTopicObj->exists() && ($helpTopicObj->value('status') == 1)) {
                $department = $helpTopicObj->value('department');
               
            } else {
                $defaultHelpTopicID = Ticket::where('id', '=', '1')->first()->help_topic;
                $department = Help_topic::where('id', '=', $defaultHelpTopicID)->value('department');               
            }
            //$sla = $ticket_settings->first()->sla;
            $sla= 3;// 24 hours;
            // $priority = $ticket_settings->first()->priority;
            $default_priority = Ticket_Priority::where('is_default', '=', 1)->first();
            $user_priority = CommonSettings::where('option_name', '=', 'user_priority')->first();
            
            if (!($request->input('priority'))) {
                $priority = $default_priority->priority_id;
                if ($helpTopicObj->exists() && ($helpTopicObj->value('status') == 1)) {
                    $priority = $helpTopicObj->value('priority');
                }
            } else {
                $priority = $request->input('priority');
            }
            $source = $ticket_source->where('name', '=', 'web')->first()->id;
           
            $attachments = $request->file('attachment');
            $collaborator = null;
            $assignto = null;
            if ($helpTopicObj->exists() && ($helpTopicObj->value('status') == 1)) {
                $assignto = $helpTopicObj->value('auto_assign');
            }
            $auto_response = 0;
            $team_assign = null; 
            if ($phone != null || $mobile_number != null) {
                $location = GeoIP::getLocation(); 
                $geoipcode = $code->where('iso', '=', $location->iso_code)->first();
                if ($phonecode == null) {
                    $data = [
                        'fails'              => Lang::get('lang.country-code-required-error'),
                        'phonecode'          => $geoipcode->phonecode,
                        'country_code_error' => 1,
                    ];

                    return Redirect::back()->with($data)->withInput($request->except('password'));
                } else {
                    $code = CountryCode::select('phonecode')->where('phonecode', '=', $phonecode)->get();
                    if (!count($code)) {
                        $data = [
                            'fails'              => Lang::get('lang.incorrect-country-code-error'),
                            'phonecode'          => $geoipcode->phonecode,
                            'country_code_error' => 1,
                        ];

                        return Redirect::back()->with($data)->withInput($request->except('password'));
                    }
                }
            }
            
                       // echo $email;die;
            //dd($request->all());
         //  \Event::fire(new \App\Events\ClientTicketFormPost($form_extras, $email, $source));  
   $result = $this->TicketWorkflowController->workflow($email, $name, $subject, $details,
    $phone, $phonecode, $mobile_number, $helptopic, $sla, $priority, $source, $collaborator,
    $department, $assignto, $team_assign, $status, $form_extras, $auto_response);   
            if ($result[1] == 1) {
                $ticketId = Tickets::where('ticket_number', '=', $result[0])->first(); 
                $thread = Ticket_Thread::where('ticket_id', '=', $ticketId->id)->first();
              /*  if ($attachments != null) {
                    $storage = new \App\FaveoStorage\Controllers\StorageController();
                    $storage->saveAttachments($thread->id, $attachments);
                   
                }*/
            // insert data in client result table   
    $client =[
        'ticket_id'=>$ticketId->id,
        'client_name'=>$request->patientfullname,
        'member_no'=>$request->memberno,
        'mobile_no'=>$request->mobiles,
        'member_type'=>$request->membertype,
        'client_location'=>$request->locationname,
        'client_visit_date'=>date('Y-m-d h:m:s',strtotime($request->recent_visit_date)),
        'scheme'=>$request->clientschema,
        'company_id'=>$request->company,
        'company_location'=>$request->company_location,
        'service'=>$request->service,
        'service_issue'=>$request->service_issue,
        'reported_by'=>$request->reported_via,
        'created_at' =>now(),
         ]; 
       // dd($client);   
       $data['client'] = $client;
         ClientResult::insert($client);

         // after ticket created send mail to all user esclated to level 1
            $service = Service::find($request->service);// get service name 
            $location=DB::table('centres')->join('organization', 'organization.id', '=', 'centres.region_id')
              ->where('centres.centre','=',$request->company_location)->get();
            $region = '';
            $region_name='';
       foreach ($location as $val) {
        $region = $val->region_id;
        $region_name=$val->address;
        } 
          
               $matrixUser=DB::table('esclation_matrix')
              ->where('companyservice','=',$service->service_name)
              ->where('company_service_issue','=',$request->service_issue)
              ->where('region','=',$region_name)
              ->get();
          //  dd($matrixUser);
              
             
             $date = date('d/m/Y h:i',strtotime(now()));// cenya timezone is above implemented
             $date = now(); 
            foreach($matrixUser as $val) 
            { 
                $esclated_email = $val->email1;
                $userEmail = \App\User::where('email',$val->email1)->first();
                $firstname = isset($userEmail->first_name)?$userEmail->first_name:'';
                $email = $val->email1;
                $subject="Ticket"." "."#".$ticketId->ticket_number;
                $data['ticket_no']= $ticketId->ticket_number;
                $data['esclated_name'] = ucfirst($firstname); 
                /*
                Mail::send('email',$data, function ($m) use ($email,$subject) {
                    $m->to($email, '')->subject($subject);
                    $m->from(env('MAIL_FROM_ADDRESS'), 'Bliss Medical Centre');
                }); 
                 */ 
                SentEmail::insert(['ticket_id'=>$ticketId->id,'esclated1_email_user_id'=> $val->email1]);
            }
            Tickets::where('id',$ticketId['id'])->update(['sent_mail_level1'=>1]);
            ClientResult::where('ticket_id',$ticketId['id'])->update(['esclated_to'=>$esclated_email,'date_time_logged'=>date('Y-m-d h:i:s',strtotime($date))]);
            if(Auth()->user()->role == 'user' || Auth()->user()->role == 'agent')
            {
                return redirect('create-ticket')->with('message', Lang::get('lang.Ticket-has-been-created-successfully-your-ticket-number-is').' '.$result[0].'. '.Lang::get('lang.Please-save-this-for-future-reference'));

             }
            
             return redirect('tickets')->with('success', Lang::get('lang.Ticket-has-been-created-successfully-your-ticket-number-is').' '.$result[0].'. '.Lang::get('lang.Please-save-this-for-future-reference'));


            } else {
                return Redirect::back()->withInput($request->except('password'))->with('fails', Lang::get('lang.failed-to-create-user-tcket-as-mobile-has-been-taken'));
            }
        } catch (\Exception $ex) {
                 return redirect()->back()->with('fails', $ex->getMessage());
               }
//        dd($result);
    }

    public function getServiceIssueByAjax(Request $request)
    {
        //echo $request->serviceid;
       // die;

        if($request->Ajax()){
             $serviceid= $request->serviceid;
             return  ServiceIssue::select('id','service_issue_name')->where('service_id',$serviceid)->get();
        }
    }
    /**
     * This Function to post the form for the ticket.
     *
     * @param type Form_name    $name
     * @param type Form_details $details
     *
     * @return type string
     */
    public function postForm($id, Help_topic $topic)
    {
        if ($id != 0) {
            $helptopic = $topic->where('id', '=', $id)->first();
            $custom_form = $helptopic->custom_form;
            $values = Fields::where('forms_id', '=', $custom_form)->get();
            if (!$values) {
            }
            if ($values) {
                foreach ($values as $form_data) {
                    if ($form_data->type == 'select') {
                        $form_fields = explode(',', $form_data->value);
                        $var = '';
                        foreach ($form_fields as $form_field) {
                            $var .= '<option value="'.$form_field.'">'.$form_field.'</option>';
                        }
                        echo '<br/><label>'.ucfirst($form_data->label).'</label><select class="form-control" name="'.$form_data->name.'">'.$var.'</select>';
                    } elseif ($form_data->type == 'radio') {
                        $type2 = $form_data->value;
                        $vals = explode(',', $type2);
                        echo '<br/><label>'.ucfirst($form_data->label).'</label><br/>';
                        foreach ($vals as $val) {
                            echo '<input type="'.$form_data->type.'" name="'.$form_data->name.'"> '.$form_data->value.'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
                        }
                        echo '<br/>';
                    } elseif ($form_data->type == 'textarea') {
                        $type3 = $form_data->value;
                        echo '<br/><label>'.$form_data->label.'</label></br><textarea id="unique-textarea" name="'.$form_data->name.'" class="form-control" style="height:15%;"></textarea>';
                    } elseif ($form_data->type == 'checkbox') {
                        $type4 = $form_data->value;
                        $checks = explode(',', $type4);
                        echo '<br/><label>'.ucfirst($form_data->label).'</label><br/>';
                        foreach ($checks as $check) {
                            echo '<input type="'.$form_data->type.'" name="'.$form_data->name.'">&nbsp&nbsp'.$check;
                        }
                    } else {
                        echo '<br/><label>'.ucfirst($form_data->label).'</label><input type="'.$form_data->type.'" class="form-control"   name="'.$form_data->name.'" />';
                    }
                }
                echo '<br/><br/>';
            }
        } else {
            return;
        }
    }



    /**
     * reply.
     *
     * @param type $value
     *
     * @return type view
     */
    public function post_ticket_reply($id, Request $request)
    {
        try {
            $comment = $request->input('comment');
            if (!empty($comment)) {
                $tickets = Tickets::where('id', '=', $id)->first();
                $thread = Ticket_Thread::where('ticket_id', '=', $tickets->id)->first();

                $subject = $thread->title.'[#'.$tickets->ticket_number.']';
                $body = $comment;

                $user_cred = User::where('id', '=', $tickets->user_id)->first();

                $fromaddress = $user_cred->email;
                $fromname = $user_cred->user_name;
                $phone = '';
                $phonecode = '';
                $mobile_number = '';

                $helptopic = $tickets->help_topic_id;
                $sla = $tickets->sla;
                $priority = $tickets->priority_id;
                $source = $tickets->source;
                $collaborator = '';
                $dept = $tickets->dept_id;
                $assign = $tickets->assigned_to;
                $form_data = null;
                $team_assign = null;
                $ticket_status = null;
                $auto_response = 0;

                $this->TicketWorkflowController->workflow($fromaddress, $fromname, $subject, $body, $phone, $phonecode, $mobile_number, $helptopic, $sla, $priority, $source, $collaborator, $dept, $assign, $team_assign, $ticket_status, $form_data, $auto_response);

                return \Redirect::back()->with('success1', Lang::get('lang.successfully_replied'));
            } else {
                return \Redirect::back()->with('fails1', Lang::get('lang.please_fill_some_data'));
            }
        } catch (Exception $e) {
            return \Redirect::back()->with('fails1', $e->getMessage());
        }
    }

    public function getCustomForm(Request $request)
    {
        $html = '';
        $helptopic_id = $request->input('helptopic');
        $helptopics = new Help_topic();
        $helptopic = $helptopics->find($helptopic_id);
        if (!$helptopic) {
            throw new Exception('We can not find your request');
        }
        $custom_form = $helptopic->custom_form;
        if ($custom_form) {
            $fields = new Fields();
            $forms = new \App\Model\helpdesk\Form\Forms();
            $form_controller = new \App\Http\Controllers\Admin\helpdesk\FormController($fields, $forms);
            $html = $form_controller->renderForm($custom_form);
        }

        return $html;
    }

    public function getSearchResult($newstring,$search_by)
    {
      
        $url = "http://localhost/project/Api/search.php?search=".$newstring."&search_by=".$search_by;
        $ch = curl_init();
       curl_setopt($ch, CURLOPT_URL, $url);
       curl_setopt($ch, CURLOPT_POST, 0);
       curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

       $response = curl_exec ($ch);
       $err = curl_error($ch);  //if you need
       curl_close ($ch);
        return json_decode($response);

      
    }
        //get service issue list
    public function getServiceByAjax(Request $request)
    { 
        if($request->Ajax()){ 
            $serviceid= $request->serviceid;
            return  ServiceIssue::select('id','service_issue_name')->where('service_id',$serviceid)->get();
       }
    }

    public function getServiceTypeByAjax(Request $request)
    {

        if($request->Ajax()){            
             return \DB::table('services')->orderBy('service_name','ASC')->get();             
       }

        
    }   







}