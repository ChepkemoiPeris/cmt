<?php

namespace App\Http\Requests\helpdesk;

use App\Http\Requests\Request;


/**
 * CreateTicketRequest.
 *
 * @author  Ladybird <info@ladybirdweb.com>
 */
class ServiceRequest extends Request
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
            'service_name'  => 'required|unique:services|max:30',
         ];
    }

    public function messages()
    {
        
            return [
                 'service_name.required' => 'This field is required',
                 'service_name.unique' => 'Service name is already Exist',
            ];
    } 
    

    
}


?>