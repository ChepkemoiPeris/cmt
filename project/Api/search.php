<?php
//error_reporting(0);
$servername = "20.87.43.237";
$database="med360lifecare_live";
$username = "root";
$password = "lifecare@2021";

// Create connection
$conn = new mysqli($servername, $username, $password,$database);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}


//search start
if(isset($_REQUEST['search'])) { 
     $search = $_REQUEST["search"]; 
} else { $search = ""; }

if(isset($_REQUEST['search_by'])) { $search_by = $_REQUEST["search_by"]; } else { $search_by = ""; }

if($search!='' && $search_by!=''){
	
	  if($search_by=='1')
	  {
		 $sql = "SELECT  master_customer.auto_number,master_customer.customercode,master_customer.customerfullname,master_customer.memberno,master_customer.mobilenumber,
		 master_customer.membertype,
		 master_customer.locationname,master_visitentry.consultationdate,master_visitentry.consultationtime,master_accountname.accountname,master_ipvisitentry.consultationdate,
		 master_ipvisitentry.consultationtime
		FROM master_customer
		LEFT JOIN master_accountname ON master_accountname.auto_number = master_customer.accountname 
		LEFT JOIN master_visitentry  on  master_visitentry.patientcode=master_customer.customercode
		LEFT JOIN master_ipvisitentry on master_ipvisitentry.patientcode=master_customer.customercode
		where master_customer.mobilenumber LIKE '%$search' order by master_visitentry.consultationdate DESC LIMIT 2";
	  } 
	  if($search_by=='2')
	  {
		 $sql = "SELECT  master_customer.auto_number,master_customer.customercode,master_customer.customerfullname,master_customer.memberno,master_customer.mobilenumber,
		 master_customer.membertype,
		 master_customer.locationname,master_visitentry.consultationdate,master_visitentry.consultationtime,master_accountname.accountname,master_ipvisitentry.consultationdate,
		 master_ipvisitentry.consultationtime
		FROM master_customer
		LEFT JOIN master_accountname ON master_accountname.auto_number = master_customer.accountname 
		LEFT JOIN master_visitentry  on  master_visitentry.patientcode=master_customer.customercode
		LEFT JOIN master_ipvisitentry on master_ipvisitentry.patientcode=master_customer.customercode
		where master_customer.memberno LIKE '%$search' order by master_visitentry.consultationdate DESC LIMIT 2";
	  }
	  
	  

$query = mysqli_query($conn,$sql);
 $client_arr=array();
 $client_arr["records"]=array();
 
while($row = mysqli_fetch_array($query))
{
	 $customercode = $row['customercode'];
	 //query1  from master_visitentry
	 $visitentry = "SELECT consultationdate,consultationtime from master_visitentry where patientcode ='$customercode'";
	 $visitentry1 = mysqli_query($conn,$visitentry);
	 $visit=mysqli_fetch_array($visitentry1);
	 //$visit1 = $visit[]; 
	 if(isset($visit)){
		   $datetime= date('d-m-Y',strtotime($visit['consultationdate']))."  ".$visit['consultationtime'];
		   $patient_type = "OutPatient";
		    $client_item =array(
				"id" => $row['auto_number'],
				"client_name" => $row['customerfullname'],
				"member_no" => $row['memberno'],
				"mobile_no" => $row['mobilenumber'],
				"member_type" => $row['membertype'],
				"location" => $row['locationname'],
				"v_date" => $datetime,
				"patient_type" => $patient_type,
				'scheme'=>$row['accountname'],
				);
			array_push($client_arr["records"], $client_item);
		   
	    } else {
			//$query2 from master_ipvisitentry
	        $ipvisitentry = "SELECT consultationdate,consultationtime from master_ipvisitentry where patientcode ='$customercode'";
	        $ipvisitentry1 = mysqli_query($conn,$ipvisitentry);
	        $ipvisit=mysqli_fetch_array($ipvisitentry1);
			if(isset($ipvisit))
			{
				$datetime= date('d-m-Y',strtotime($ipvisit['consultationdate']))."  ".$ipvisit['consultationtime'];
				$patient_type = "InPatient";
				
				$client_item =array(
				"id" => $row['auto_number'],
				"client_name" => $row['customerfullname'],
				"member_no" => $row['memberno'],
				"mobile_no" => $row['mobilenumber'],
				"member_type" => $row['membertype'],
				"location" => $row['locationname'],
				"v_date" => $datetime,
				"patient_type" => $patient_type,
				'scheme'=>$row['accountname'],
				);
				array_push($client_arr["records"], $client_item);
			}
		}
 

 
       
}

 $status_code=http_response_code(200);
 echo json_encode($client_arr);

}



?>