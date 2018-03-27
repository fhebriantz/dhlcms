<?php

namespace App\Http\Controllers\Model;

use Illuminate\Database\Eloquent\Model;
use DB;

class Transaction extends Model 
{
    protected $table = 'dms_transaction';

    public static function getTableTransaction(){
    	
        $dms_transaction = DB::table('dms_transaction')
            ->join('dms_form', 'dms_form.id_dms_form', '=', 'dms_transaction.id_dms_form')
            ->join('dms_master_project', 'dms_master_project.id', '=', 'dms_form.cust_proj_name')
            ->select('dms_transaction.*', 'dms_form.driver_name', 'dms_form.type_of_vehicle', 'dms_form.plat_no', 'dms_form.transporter_company', 'dms_form.shipment', 'dms_form.cust_proj_name', 'dms_form.id_purpose', 'dms_form.driver_phone', 'dms_master_project.master_project_name')
            ->get();

     return $dms_transaction;
    }
}
