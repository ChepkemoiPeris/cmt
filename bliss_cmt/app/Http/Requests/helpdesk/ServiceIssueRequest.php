<?php

namespace App\Http\Requests\helpdesk;

use App\Http\Requests\Request;


/**
 * CreateTicketRequest.
 *
 * @author  Ladybird <info@ladybirdweb.com>
 */
class ServiceIssueRequest extends Request
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
            'service_id'  => 'required',
            'service_issue_name' => 'required|regex:/(^([a-z A-Z ]+)(\d+)?$)/u',
           //  'service_issue_name' => 'required',
         ];
    }

    public function messages()
    {
        
            return [
                 'service_id.required' => 'This field is required',
                 'service_issue_name.required' => 'This field is required',
                 'service_issue_name.regex' => 'Please Enter valid string',
            ];
    } 
    

    
}


?>