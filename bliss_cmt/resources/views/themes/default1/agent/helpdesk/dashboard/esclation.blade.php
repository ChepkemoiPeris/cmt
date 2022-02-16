@extends('themes.default1.agent.layout.agent')

@section('Esclation')
class="nav-link active"
@stop

@section('dashboard-bar')
class="nav-link active"
@stop

@section('PageHeader')
<h5 >{!! Lang::get('lang.esclation') !!}</h5>
@stop

@section('dashboard')
class="nav-item d-none d-sm-inline-block active"
@stop

@section('content')
<!-- check whether success or not -->
{{-- Success message --}}
@if(Session::has('message'))
<div class="alert alert-success alert-dismissable">
	<i class="fas  fa-check-circle"></i>
	<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
	{{Session::get('message')}}
</div>
@endif
{{-- failure message --}}
@if(Session::has('fails'))
<div class="alert alert-danger alert-dismissable">
	<i class="fas fa-ban"></i>
	<b>{!! Lang::get('lang.alert') !!}!</b>
	<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
	{{Session::get('fails')}}
</div>
@endif

<form method="post" action="{{route('create.service')}}">
	@csrf
	<div class="row">
 		<div class="col-md-2">
 			<div class="form-group">
		    <label for="exampleInputEmail1">{{Lang::get('lang.service_name')}}</label>
		    <input type="text" class="form-control" name="service_name"  aria-describedby="emailHelp" >
    		<span class="danger">{{$errors->first('service_name')}}</span>
           </div>
		</div>

 		<div class="col-md-2">
 			<div class="form-group">
		     <label for="exampleInputEmail1"> </label>
		     <button type="submit" class="form-control btn btn-primary btnsize">{{Lang::get('lang.create_service')}}</button>
  		    </div>
	    </div>
    </div>
</form>



<form method="post" action="{{route('service.issue')}}">
	@csrf
	<div class="row ">
 		<div class="col-md-2">
 			
 			<div class="form-group">
		    <label for="exampleInputEmail1">{{Lang::get('lang.service')}}</label>
		    <select name="service_id" class="service_border">
		    	<option value="">{{Lang::get('lang.select')}}</option>
		    	@foreach($servicelist as $val)
		    	<option value="{{$val->id}}">{{$val->service_name}}</option>
		    	@endforeach
		    </select>
    		<span class="danger">{{$errors->first('service_id')}}</span>
           </div>
		</div>
		<div class="col-md-2">
 			<div class="form-group">
		    <label for="exampleInputEmail1">{{Lang::get('lang.service_issue')}}</label>
		    <input type="text"  name ="service_issue_name" class="form-control"  aria-describedby="emailHelp" >
    		<span class="danger">{{$errors->first('service_issue_name')}}</span>
           </div>
		</div>

 		<div class="col-md-2">
 			<div class="form-group">
		    <label for="exampleInputEmail1"> </label>
		    <button type="submit" class="form-control btn btn-primary btnsize">{{Lang::get('lang.create_service_issue')}}</button>
  		    </div>
	    </div>
    </div>
</form>


<form method="post" action="{{route('create.esclation')}}">
	@csrf
	<div class="row">
        <div class="col-md-2">
 			<div class="form-group">
		    <label for="exampleInputEmail1">{{Lang::get('lang.company')}} <span class="astric">*</span></label>
		   <select name="company_id"  id="company_id" class="service_border">
		       <option value="">{{Lang::get('lang.select')}}</option>
		    	@foreach($company as $val)
		    	<option value="{{$val->name}}">{{$val->name}}</option>
		    	@endforeach
		    </select>
    		<span class="danger">{{$errors->first('company_id')}}</span>
            </div>
		</div>
		<div class="col-md-2">
 			<div class="form-group">
		    <label for="exampleInputEmail1">{{Lang::get('lang.service')}} <span class="astric">*</span></label>
		   <select name="companyservice" id="companyservice" class="service_border">
		       <option value="">{{Lang::get('lang.select')}}</option>
		    	@foreach($servicelist as $val)
		    	<option value="{{$val->id}}">{{$val->service_name}}</option>
		    	@endforeach
		    </select>
    		<span class="danger">{{$errors->first('companyservice')}}</span>
           </div>
		</div>
		<div class="col-md-2">
 			<div class="form-group">
		    <label for="exampleInputEmail1">{{Lang::get('lang.service_issue')}}<span class="astric">*</span></label>
		     <select name="company_service_issue" id="company_service_issue" class="service_border">
		    	
		    </select>
    		<span class="danger">{{$errors->first('company_service_issue')}}</span>
           </div>
		</div>
		<div class="col-md-2">
 			<div class="form-group">
		    <label for="exampleInputEmail1">{{Lang::get('lang.region')}} <span class="astric">*</span></label>
		     <select name="region" id="region" class="service_border">
		    	
		    </select>
    		<span class="danger">{{$errors->first('region')}}</span>
           </div>
		</div>
		<div class="col-md-1">
 			<div class="form-group">
		    <label for="exampleInputEmail1">{{Lang::get('lang.level')}}  <span class="astric">*</span></label>
		     <select name="level" class="level_border">
		     	<option value="">{{Lang::get('lang.select')}} </option>
		    	<option value="1">1</option>
		    	<option value="2">2</option>
		    	<option value="3">3</option>
		    	<option value="4">4</option>
		    </select>
    		<span class="danger">{{$errors->first('level')}}</span>
           </div>
		</div>
		<div class="col-md-1">
 			<div class="form-group">
		    <label for="exampleInputEmail1">{{Lang::get('lang.minutes')}} <span class="astric">*</span></label>
		    <input type="text" class="form-control" name="minutes" id="minutes"  aria-describedby="emailHelp" >
         	<span class="danger">{{$errors->first('minutes')}}</span>
           </div>
		</div>
		<div class="col-md-2">
 			<div class="form-group">
		    <label for="exampleInputEmail1">{{Lang::get('lang.e-mail')}} <span class="astric">*</span></label>
		    <input type="email" name="email" id="email" class="form-control"  aria-describedby="emailHelp" >
    		<span class="danger">{{$errors->first('email')}}</span>
           </div>
		</div>
	</div>
	<div class="row">	
		<div class="col-md-10" >
 			<div class="form-group">
		    <label for="exampleInputEmail1"> </label>
		    
  		    </div>
	    </div>

 		<div class="col-md-2" >
 			<div class="form-group">
		    <label for="exampleInputEmail1"> </label>
		    <button  type="submit" class="form-control btn btn-primary set_esclation">{{Lang::get('lang.set_esclation')}}</button>
  		    </div>
	    </div>
    </div>

</form>
<div   style="overflow-y: hidden;overflow-x: auto;" >
<table class="table table-bordered" style="height:100%; width: 100%; white-space: nowrap;" id="chumper">
    <thead>
        <tr>
            <th width="10%">{{Lang::get('lang.service')}}</th>
            <th>{{Lang::get('lang.service_issue')}}</th>
            <th>{{Lang::get('lang.region')}}</th>
            <th>{{Lang::get('lang.level1')}}</th>
            <th>{{Lang::get('lang.level2')}}</th>
            <th>{{Lang::get('lang.level3')}}</th> 
        </tr>
    </thead>
       <tbody> 
    	 @foreach($matrixdata as $row)
    	 	<?php
    	 	     
    	 	     $servicename=$row->companyservice;
    	 	     //fetch the distinct company service
				  $serviceissue=DB::table('esclation_matrix')->where('companyservice',$row->companyservice)->select('company_service_issue')->distinct()->get();
    	           ?>
    	 	
        
    	 	
		    <tr style="height:100%;">
		    	<td>{{$servicename}}<span style="margin-left:50px;"><a href="{{route('delete_service',['cname'=> Crypt::encryptString($servicename)])}}"><button type="button" class="btn btn-danger">Delete</button></span></td>
		    	
		        <td>
		        	<table class="table" style="height:100%;">
                        <tbody>
                    @foreach($serviceissue as $val)
                        <?php
                            $issuelist=DB::table('esclation_matrix')->where('companyservice',$row->companyservice)->where('company_service_issue',$val->company_service_issue)->get();
    	          
						?> 

                         
	                    <tr><td>
			        	{{$val->company_service_issue}}<span style="margin-left:50px;"><button type="button"  data-id="{{Crypt::encryptString($val->company_service_issue)}}" class="btn btn-danger del_ser_issue">Delete</button></span>
			             </td>
                        </tr>  
			           
		             @endforeach
		         </tbody>
		            </table>
		        </td>

		        <td>
		        	<table class="table" style="height:100%;">
                        <tbody>
                    @foreach($serviceissue as $val)
                        <?php
                         $issuelist=DB::table('esclation_matrix')->where('companyservice',$row->companyservice)->where('company_service_issue',$val->company_service_issue)->select('region')->distinct()->get();
    	                  ?> 

                         @foreach($issuelist as $is)

	                    <tr>
	                      <td>
			        	    {{$is->region}}
			             </td>

                        </tr>  
			           @endforeach
		             @endforeach
		         </tbody>
		            </table>
		        </td>
		        	 <td>
		        	<table class="table" style="height:100%;">
                        <tbody>
                    @foreach($serviceissue as $val)
                        <?php
                          $issuelist=DB::table('esclation_matrix')->where('companyservice',$row->companyservice)->where('company_service_issue',$val->company_service_issue)->select('min1','email1')->distinct()->get();
    	             ?> 

                         @foreach($issuelist as $is)

	                        <tr><td>

		           	       <button class="minutes label label-info" style="background-color: lightgrey !important">
		           	       	@if(isset($is->min1))
		           	       	{{$is->min1}}Mins
		           	       	@endif
		           	       </button><span>&nbsp;{{$is->email1}}</span></td></tr>
			        	

                        
			           @endforeach
		             @endforeach
		         </tbody>
		            </table>
		        </td>

		        	<td>
		        	<table class="table" style="height:100%;">
                        <tbody>
                    @foreach($serviceissue as $val)
                        <?php
                         $issuelist=DB::table('esclation_matrix')->where('companyservice',$row->companyservice)->where('company_service_issue',$val->company_service_issue)->select('min2','email2')->distinct()->get();   
    	                  ?> 

                         @foreach($issuelist as $is)

	                        <tr><td>

		           	       <button class="minutes label label-info" style="background-color: lightgrey !important">
		           	       	@if(isset($is->min2))
		           	       	{{$is->min2}}Mins
		           	       	@endif
		           	       </button><span>&nbsp;{{$is->email2}}</span></td></tr>
			        	

                        
			           @endforeach
		             @endforeach
		         </tbody>
		            </table>
		        </td>


		        <td>
		        	<table class="table" style="height:100%;">
                        <tbody>
                    @foreach($serviceissue as $val)
                        <?php
                          $issuelist=DB::table('esclation_matrix')->where('companyservice',$row->companyservice)->where('company_service_issue',$val->company_service_issue)->select('min3','email3')->distinct()->get();  
         ?> 

                         @foreach($issuelist as $is)

	                        <tr><td>

		           	       <button class="minutes label label-info" style="background-color: lightgrey !important">
		           	       	@if(isset($is->min3))
		           	       	{{$is->min3}}Mins
		           	       	@endif
		           	       </button><span>&nbsp;{{$is->email3}}</span></td></tr>
			        	

                        
			           @endforeach
		             @endforeach
		         </tbody>
		            </table>
		        </td>

		    </tr>
		   

	    	
        @endforeach
	</tbody>
	
</table>

</div>








<script type="text/javascript">
	jQuery(document).ready(function () {
		
		$('#chumper').DataTable();

		$('#companyservice').on('change', function (e) {

			let serviceid= $('#companyservice').val();
			$.ajax({
				type: "get",
				url: "get-service",
				data:{serviceid:serviceid},
				
				success: function (data) {
					$('#company_service_issue').empty();
					 var select ='<option value="">Select Service Issue</option>'
					 $('#company_service_issue').html(select);
					$.each(data,function(index,val){
                     $('#company_service_issue').append('<option value ="'+val.service_issue_name+'">'+val.service_issue_name+'</option>');
                   });

				}
			})

		});

         /* ****  Company region  */
		$('#company_id').on('change', function (e) {
			let companyid= $('#company_id').val();
			
			$.ajax({
				type: "post",
				url: "get-companyregion",
				data:{companyid:companyid},
				
				success: function (data) {
					$('#region').empty();
					 var select ='<option value="">Select Region</option>'
					 $('#region').html(select);
					$.each(data,function(index,val){
                     $('#region').append('<option value ="'+val.address+'">'+val.address+'</option>');
                   });

				}
			})

		});

		/* delete service issues --*/
		$('.del_ser_issue').on('click', function (e) {
		
			let issueid= $(this).attr("data-id");
			   let message = confirm("Are You sure want to delete?");
			   console.log(message);
			   if(message == true) {

					$.ajax({
						type: "post",
						url: "del-serviceissue",
						data:{issueid:issueid},
						success: function (data) {
							if(data == 1){
								alert('Data deleted successfully !');
								location.reload();
							} else {
								alert("Something error");
							}

						}
					})
			} 	

		});




	});
</script>
@stop