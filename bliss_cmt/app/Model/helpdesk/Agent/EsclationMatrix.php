<?php

namespace App\Model\helpdesk\Agent;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\BaseModel;

class EsclationMatrix extends BaseModel
{
     use SoftDeletes;
    protected $table = 'esclation_matrix';
    protected $fillable = [
        'company_name',
        'companyservice',
        'company_service_issue',
        'region',
        'level',
        'min1',
        'min2',
        'min3',
        'min4',
        'email1',
        'email2',
        'email3',
        'email4',
    ];
    
}
