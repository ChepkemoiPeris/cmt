<?php

namespace App\Http\Controllers\Common;
use App\Http\Controllers\Controller;
use Excel;
use Exception;
use App\User;


class ExcelController extends  Controller
{

    
    
    public function export($filename, $data)
    {
      

        return Excel::create($filename, function ($excel) use ($data) {

            $excel->sheet('sheet', function ($sheet) use ($data) {
                $sheet->fromArray($data);
            });
        })->download('xlsx');
    }

    //Department,Region,Reported via and Patient Type Report here
    public function getAllReport($filename, $data,$other)
    {

        return Excel::create($filename, function ($excel) use ($data,$other) {

       
            $excel->sheet('Sheet', function ($sheet) use ($data,$other) {

                /* first row  */
               /* if(isset($dates['loc1']) && isset($dates['loc2']) ){
                    $loc = $dates['loc1'].",".$dates['loc2'];
                } else{
                    $loc= isset($dates['loc1'])?$dates['loc1']:'';
                    
                }*/
                 date_default_timezone_set('Africa/Nairobi'); 
                 $date = date('d/m/Y',strtotime(now()));
                 $time= date("h:i:a");
                 $sheet->mergeCells('A1:D1');
                 $sheet->setCellValue('A1', 'Patient Complaint:Bungoma');
                 $sheet->setCellValue('A2', $other);
                 $sheet->setCellValue('C2', 'Date:');

                 $sheet->setCellValue('D2', $date);
                $sheet->setCellValue('E2', 'Time:'.$time);
                $sheet->setCellValue('N2');
/*                $sheet->setCellValue('A4', 'Region');
                $sheet->setCellValue('B4', 'Status');
                $sheet->setCellValue('C4', '<7 Days ');
                $sheet->setCellValue('D4', '7-15 Days');
                $sheet->setCellValue('E4', '16-30 Days');
                $sheet->setCellValue('F4', '>30 Days ');*/
                

                /* first row  end*/

                  /* second row  */
               

                
               
                $sheet->row(1,function($row) {
                    $row->setBackground('#18479D');
                   
                });
                $sheet->row(2,function($row) {
                   $row->setBackground('#18479D');
                   //$row->setColor('#18479D');
                });
                $sheet->row(3,function($row) {
                   $row->setBackground('#18479D');
                   //$row->setColor('#18479D');
                });
                $sheet->row(4,function($row) {
                   $row->setBackground('#18479D');
                   //$row->setColor('#18479D');
                });
                 
                

                $sheet->fromArray($data,null, 'A5', true);


                
            });  
        })->download('xlsx');
    }



    public function exportReport($filename, $data,$dates)
    {
      
        file_put_contents('masterdat.json','excel controller');
        return Excel::create($filename, function ($excel) use ($data,$dates) {

            $excel->sheet('Worksheet', function ($sheet) use ($data,$dates) {

                /* first row  */
                if(isset($dates['loc1']) && isset($dates['loc2']) ){
                    $loc = $dates['loc1'].",".$dates['loc2'];
                } else{
                    $loc= isset($dates['loc1'])?$dates['loc1']:'';
                    
                }
             
                 $sheet->mergeCells('A1:D1');
                 $sheet->setCellValue('A1', 'Patient Relation Management:'.$loc);
                 $sheet->setCellValue('E1', 'Between:'.date('d/m/Y',strtotime($dates['date1'])));
                 $sheet->setCellValue('F1', 'and:'.date('d/m/Y',strtotime($dates['date2'])));
                  $sheet->setCellValue('Q1', '');
                /* first row  end*/

                  /* second row  */
                   date_default_timezone_set('Africa/Nairobi');  
                 $date = date('d/m/Y',strtotime(now()));
                 $time= date("h:i:a");
                $d = "Lifecare Bungoma";
               //  $sheet->setCellValue('A2');
                 $sheet->setCellValue('A2', 'Esclation');
                 $sheet->setCellValue('B2', 'Date:'.$date);
                // $sheet->setWidth('B2', 5);
                 $sheet->setCellValue('D2', 'Time:'.$time);
                /* second row  end*/
                
               
                $sheet->row(1,function($row) {
                   $row->setBackground('#18479D');
                });
                $sheet->row(2,function($row) {
                   $row->setBackground('#18479D');
                   //$row->setColor('#18479D');
                });
            
            
                $sheet->fromArray($data,null, 'A3', true);
            });
        })->download('xlsx');
    }

    public function exportSupportQuery($filename, $data)
    {
      

        return Excel::create($filename, function ($excel) use ($data) {

            $excel->sheet('Support', function ($sheet) use ($data) {
                $sheet->fromArray($data);
               
            });
        })->download('xlsx');
    }

   

}
