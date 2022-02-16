<?php

namespace App\Http\Requests\helpdesk;

use App\Http\Requests\Request;


/**
 * CreateTicketRequest.
 *
 * @author  Ladybird <info@ladybirdweb.com>
 */
class EsclationMatrixRequest extends Request
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
       return true;
    }

    public function rules()
    {
        return [
            'company_id'  => 'required',
            'companyservice' => 'required',
            'company_service_issue' => 'required',
            'region' => 'required',
            'level' => 'required',
            'minutes' => 'required|regex:/(^([0-9]+)(\d+)?$)/u',
            'email' => 'required',
         ];
    }

    public function messages()
    {
        
            return [
                 'company_id.required' => 'This field is required',
                 'companyservice.required' => 'This field is required',
                 'company_service_issue.required' => 'This field is required',
                 'region.required' => 'This field is required',
                 'level.required' => 'This field is required',
                 'minutes.required' => 'This field is required',
                 'minutes.regex' => 'Please enter only number',
                 'email.required' => 'This field is required',
            ];
    } 
    

    
}


?>