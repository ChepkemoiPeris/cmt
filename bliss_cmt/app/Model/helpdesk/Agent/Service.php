<?php

namespace App\Model\helpdesk\Agent;

use App\BaseModel;

class Service extends BaseModel
{
    protected $table = 'services';
    protected $fillable = [
        'service_name',
        'status',
    ];
   
}
