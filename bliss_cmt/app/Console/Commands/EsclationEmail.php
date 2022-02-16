<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Model\helpdesk\Ticket\Tickets;
use App\Model\helpdesk\Agent\EsclationMatrix;
use App\Model\helpdesk\Agent\SentEmail;

use Mail;
use DB;
class EsclationEmail extends Command
{
/**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'esclate:matrix';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Send Mail Level2 and Level3 after given time ticket not close';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
         parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
            date_default_timezone_set('Africa/Nairobi');
             $ticket= \DB::table('tickets as t')
                ->select('t.id','ce.region_id','t.ticket_number','t.user_id','t.closed','t.created_at','c.service','ce.centre','o.address','c.service_issue','c.company_location','t.sent_mail_level1','t.sent_mail_level2','t.sent_mail_level3')->where('t.closed',0)
                ->join('client_result as c','c.ticket_id','=','t.id')
                ->join('centres as ce','ce.centre','=','c.company_location')
                ->join('organization as o', 'o.id', '=', 'ce.region_id')
                ->get(); 
                //Esc level 2 sent mail
                             
                foreach($ticket as $tic) 
                {                     
                    $diff_time=(strtotime(date("Y-m-d H:i:s"))-strtotime($tic->created_at))/60;//change in minutes
                    $service = \App\Model\helpdesk\Agent\Service::find($tic->service);// get service name 
               
                
                     $matrixUser=DB::table('esclation_matrix')
                     ->where('companyservice','=',$service->service_name)
                     ->where('company_service_issue','=',$tic->service_issue)
                     ->where('region','=',$tic->address)->get();
                    
                    foreach($matrixUser as $val)
                    {
                        $min1 = $val->min1;
                        $userEmail = \App\User::where('email',$val->email2)->first();//use letter after first name 
                        $esclatee_name = isset($userEmail->first_name)?$userEmail->first_name:'';
                       
                        if($diff_time > $min1  &&  $tic->sent_mail_level1 =='1' && is_null($tic->sent_mail_level2))
                        {
                            
                                $email =$val->email2;                                
                               $subject="Ticket"." "."#".$tic->ticket_number;
                               $data['ticket_no']= $tic->ticket_number;
                                $data['esclated_name'] = ucfirst($esclatee_name);
                                // Mail::send('email',$data, function ($m) use ($email,$subject) {
                                //     $m->to($email, '')->subject($subject);
                                //     $m->from(env('MAIL_FROM_ADDRESS'), 'Bliss Medical Centre');
                                // });
                                
                        }


                    }
                    
                 Tickets::where('id',$tic->id)->update(['sent_mail_level2'=>1]);  
                 SentEmail::insert(['ticket_id'=>$tic->id,'esclated1_email_user_id'=>$val->email2]); 
                 $esclated1=SentEmail::where('esclated1_email_user_id','=',$val->email2)->first();                   
                 $assigned_user=DB::table('users')->where('email','=',$esclated1->esclated1_email_user_id)->get();
                  $user_assigned='';
                  foreach($assigned_user as $user){
                      $user_assigned = $user->id;
                  }
                   Tickets::where('id',$tic->id)->update(['assigned_to'=>$user_assigned]); 
            }

/*****************  Esc level 3 sent mail   **********************************/
                foreach($ticket as $tic) 
                {

                    $diff_time=(strtotime(date("Y-m-d H:i:s"))-strtotime($tic->created_at))/60;//change in minutes
                    $service = \App\Model\helpdesk\Agent\Service::find($tic->service);// get service name 
                 
                    $matrixUser=DB::table('esclation_matrix')
                    ->where('companyservice','=',$service->service_name)
                    ->where('company_service_issue','=',$tic->service_issue)
                    ->where('region','=',$tic->address)->get();
                    foreach($matrixUser as $val)
                    {
                        $min2 = $val->min2;
                        if($diff_time > $min2  &&  $tic->sent_mail_level1 =='1' && $tic->sent_mail_level2 =='1' && is_null($tic->sent_mail_level3))
                        {
                             
                             $userEmail = \App\User::where('email',$val->email3)->first();//use letter after first name 
                             $esclatee_name = isset($userEmail->first_name)?$userEmail->first_name:'';

                               $email =$val->email3;
                               //$name = $request->Name;
                               $subject="Ticket"." "."#".$tic->ticket_number;
                               $data['ticket_no']= $tic->ticket_number;
                               $data['esclated_name'] = ucfirst($esclatee_name); 

                                Mail::send('email',$data, function ($m) use ($email,$subject) {
                                    $m->to($email, '')->subject($subject);
                                    $m->from(env('MAIL_FROM_ADDRESS'), 'Bliss Medical Centre');
                                });
                                
                        }

                    }
                    Tickets::where('id',$tic->id)->update(['sent_mail_level3'=>1]);  
                    SentEmail::insert(['ticket_id'=>$tic->id,'esclated1_email_user_id'=>$val->email3]);  
                    $esclated1=SentEmail::where('esclated1_email_user_id','=',$val->email3)->first();                   
                    $assigned_user=DB::table('users')->where('email','=',$esclated1->esclated1_email_user_id)->get();
                     $user_assigned='';
                     foreach($assigned_user as $user){
                         $user_assigned = $user->id;
                     }
                     Tickets::where('id',$tic->id)->update(['assigned_to'=>$user_assigned]); 
                    
            }
            echo "Esc level 2 and level 3 completed";
     /*********Esc level 3 end code  ***********/
            

    }
}
