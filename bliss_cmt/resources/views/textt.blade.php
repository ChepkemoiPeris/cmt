@php
    $filename="EmpData";
   header("Content-type: application/octet-stream");
   header("Content-type: application/vnd-ms-excel");
    header("Content-Disposition: attachment; filename=".$filename."-Report.xls");
    header("Pragma: no-cache");
    header("Expires: 0");
   @endphp

<table border="1">
    <thead>
    <tr>
        <th>Name</th>
        <th>Email</th>
    </tr>
    </thead>
    <tbody>
    
        <tr>
            <td>Santosh kumar   </td>
            <td>ssgsdfsd</td>
        </tr>
    
    </tbody>
    


</table>