<?php

namespace App\Model\helpdesk\Agent;

use App\BaseModel;

class ServiceIssue extends BaseModel
{
    protected $table = 'service_issue';
    protected $fillable = [
        'service_id',
        'service_issue_name',
    ];
    
}
