<?php

namespace App\Model\helpdesk\Agent;

use App\BaseModel;

class SentEmail extends BaseModel
{
    protected $table = 'sent_email_level1';
    protected $fillable = [
        'ticket_id',
        'esclated1_email_user_id'
    ];
   
}
