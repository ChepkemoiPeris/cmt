<?php

namespace App\Model\helpdesk\Agent;

use App\BaseModel;

class ClientResult extends BaseModel
{
    protected $table = 'client_result';
    protected $fillable = [
        'ticket_id',
        'client_name',
        'member_no',
        'mobile_no',
        'member_type',
        'client_location',
        'client_visit_date',
        'scheme',
        'company_id',
        'company_location',
        'patient_type',
        'service',
        'service_issue',
        'reported_by',
       
    ];
   
}
