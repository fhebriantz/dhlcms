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
            ->join('dms_master_status', 'dms_master_status.id', '=', 'dms_transaction.status')
            ->join('dms_purpose', 'dms_purpose.id', '=', 'dms_form.id_purpose')
            ->select('dms_transaction.*', 'dms_form.driver_name', 'dms_form.type_of_vehicle', 'dms_form.plat_no', 'dms_form.transporter_company', 'dms_form.shipment', 'dms_form.cust_proj_name', 'dms_form.id_purpose','dms_form.asal','dms_form.tujuan', 'dms_form.driver_phone', 'dms_form.id_location', 'dms_master_project.master_project_name','dms_master_status.status_name','dms_purpose.purpose')
            ->get();

     return $dms_transaction;
    }

     public static function getTableInbound(){
        
        $dms_transaction = DB::table('dms_transaction')
            ->join('dms_form', 'dms_form.id_dms_form', '=', 'dms_transaction.id_dms_form')
            ->join('dms_master_project', 'dms_master_project.id', '=', 'dms_form.cust_proj_name')
            ->join('dms_master_status', 'dms_master_status.id', '=', 'dms_transaction.status')
            ->select('dms_transaction.*', 'dms_form.driver_name', 'dms_form.type_of_vehicle', 'dms_form.plat_no', 'dms_form.transporter_company', 'dms_form.shipment', 'dms_form.cust_proj_name', 'dms_form.id_purpose','dms_form.asal','dms_form.tujuan', 'dms_form.driver_phone', 'dms_form.id_location', 'dms_master_project.master_project_name','dms_master_status.status_name')
            ->where('id_purpose','=',1)
            ->where('id_location','=',session()->get('session_id_loc'))
            ->paginate(5);

     return $dms_transaction;
    }

    public static function getTableOutbound(){
        
        $dms_transaction = DB::table('dms_transaction')
            ->join('dms_form', 'dms_form.id_dms_form', '=', 'dms_transaction.id_dms_form')
            ->join('dms_master_project', 'dms_master_project.id', '=', 'dms_form.cust_proj_name')
            ->join('dms_master_status', 'dms_master_status.id', '=', 'dms_transaction.status')
            ->select('dms_transaction.*', 'dms_form.driver_name', 'dms_form.type_of_vehicle', 'dms_form.plat_no', 'dms_form.transporter_company', 'dms_form.shipment', 'dms_form.cust_proj_name', 'dms_form.id_purpose','dms_form.asal','dms_form.tujuan', 'dms_form.driver_phone', 'dms_form.id_location', 'dms_master_project.master_project_name','dms_master_status.status_name')
            ->where('id_purpose','=',2)
            ->where('id_location','=',session()->get('session_id_loc'))
            ->paginate(5);

     return $dms_transaction;
    }


     public static function getTableInboundAdmin(){
        
        $dms_transaction = DB::table('dms_transaction')
            ->join('dms_form', 'dms_form.id_dms_form', '=', 'dms_transaction.id_dms_form')
            ->join('dms_master_project', 'dms_master_project.id', '=', 'dms_form.cust_proj_name')
            ->join('dms_master_status', 'dms_master_status.id', '=', 'dms_transaction.status')
            ->select('dms_transaction.*', 'dms_form.driver_name', 'dms_form.type_of_vehicle', 'dms_form.plat_no', 'dms_form.transporter_company', 'dms_form.shipment', 'dms_form.cust_proj_name', 'dms_form.id_purpose','dms_form.asal','dms_form.tujuan', 'dms_form.driver_phone', 'dms_form.id_location', 'dms_master_project.master_project_name','dms_master_status.status_name')
            ->where('id_purpose','=',1)
            ->where('cust_proj_name','=',session()->get('session_project'))
            ->where('id_location','=',session()->get('session_id_loc'))
            ->paginate(5);

     return $dms_transaction;
    }

     public static function getTableOutboundAdmin(){
        
        $dms_transaction = DB::table('dms_transaction')
            ->join('dms_form', 'dms_form.id_dms_form', '=', 'dms_transaction.id_dms_form')
            ->join('dms_master_project', 'dms_master_project.id', '=', 'dms_form.cust_proj_name')
            ->join('dms_master_status', 'dms_master_status.id', '=', 'dms_transaction.status')
            ->select('dms_transaction.*', 'dms_form.driver_name', 'dms_form.type_of_vehicle', 'dms_form.plat_no', 'dms_form.transporter_company', 'dms_form.shipment', 'dms_form.cust_proj_name', 'dms_form.id_purpose','dms_form.asal','dms_form.tujuan', 'dms_form.driver_phone', 'dms_form.id_location', 'dms_master_project.master_project_name','dms_master_status.status_name')
            ->where('id_purpose','=',2)
            ->where('cust_proj_name','=',session()->get('session_project'))
            ->where('id_location','=',session()->get('session_id_loc'))
            ->paginate(5);

     return $dms_transaction;
    }
}
