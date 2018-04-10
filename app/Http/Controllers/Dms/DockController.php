<?php

namespace App\Http\Controllers\Dms;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Controllers\Model\Form;
use App\Http\Controllers\Model\Transaction;
use App\Http\Controllers\Model\Transaction_history;
use App\Http\Controllers\Model\Master_vehicle;
use App\Http\Controllers\Model\Master_plat;
use App\Http\Controllers\Model\Master_phone;
use App\Http\Controllers\Model\Master_project;
use App\Http\Controllers\Model\Master_tc;
use App\Http\Controllers\Model\Purpose;
use Illuminate\Routing\Middleware\LoginCheck;
use Illuminate\Support\Facades\Redirect;
use DateTime;
use Response;
use Date;
use Auth;
use Session;
use Carbon;
use GuzzleHttp;
class DockController extends Controller
{
    public function testapi(){
        $clientA = new GuzzleHttp\Client();
        // check the response by
        $response = $clientA->request('GET', 'http://www.etracker.cc/bulksms/mesapi.aspx?user=AzhaDHL01&pass=y1,i3qFa&type=0&to=<+6285718841359>&from=CMK&text=<Message content>&servid=MES01',['auth' => ['AzhaDHL01', 'y1,i3qFa']]);  
        $status =  $response->getStatusCode(); 
        if($status == 200)
        {
            $buffer =  $response->getBody()->getContents();     
            return $buffer;
        }else {
            return 'error_api';
        }

    }

    public function __construct()
    {
        $this->middleware('logincheck');
    }

    public function barcode($id){
        $tgl_cetak=date("Y-m-d");
        $mytime = Carbon\Carbon::now();
        $waktu = $mytime->toDateTimeString();
        $dms_form=Transaction::getTableTransaction()->where('id_dms_form','=',$id)->first();
        return view('pages/dms/barcode', compact('dms_form','tgl_cetak','waktu'));
    }

    public function show(){
        if (session()->get('session_id_group') == 3){
        $dms_form = Form::all();
        $dms_inbound = Transaction::getTableTransaction()->where('id_purpose','=',1)
                        ->where('id_location','=',session()->get('session_id_loc'));
        $dms_outbound = Transaction::getTableTransaction()->where('id_purpose','=',2)
                        ->where('id_location','=',session()->get('session_id_loc'));
        $no_inbound = 1;
        $no_outbound = 1;
        Session::flash('flash_inbound', "active");
        return view('pages/dms/dashboard', compact('dms_form','dms_inbound','dms_outbound','no_inbound','no_outbound'));
        }
        elseif (session()->get('session_id_group') == 1) {
        $dms_form = Form::all();
        $dms_inbound = Transaction::getTableTransaction()->where('id_purpose','=',1);
        $dms_outbound = Transaction::getTableTransaction()->where('id_purpose','=',2);
        $no_inbound = 1;
        $no_outbound = 1;
        Session::flash('flash_inbound', "active");
        return view('pages/dms/dashboard', compact('dms_form','dms_inbound','dms_outbound','no_inbound','no_outbound'));
        }
        else{
        $dms_form = Form::all();
        $dms_inbound = Transaction::getTableTransaction()
                            ->where('id_purpose','=',1)
                            ->where('cust_proj_name','=',session()->get('session_project'))
                            ->where('id_location','=',session()->get('session_id_loc'));
        $dms_outbound = Transaction::getTableTransaction()->where('id_purpose','=',2)
                            ->where('cust_proj_name','=',session()->get('session_project'))
                            ->where('id_location','=',session()->get('session_id_loc'));
        $no_inbound = 1;
        $no_outbound = 1;
        Session::flash('flash_inbound', "active");
        return view('pages/dms/dashboard', compact('dms_form','dms_inbound','dms_outbound','no_inbound','no_outbound'));   
        }
    } 
        
        //return response($dms_form, 200)
         //         ->header('Content-Type', 'text/plain');


    public function all_list(){
        if (session()->get('session_id_group') == 3){
        $dms_form = Form::all();
        $dms_inbound = Transaction::getTableInbound();
        $dms_outbound = Transaction::getTableOutbound();
        $no_inbound = 1;
        $no_outbound = 1;
        return view('pages/dms/all_list', compact('dms_form','dms_inbound','dms_outbound','no_inbound','no_outbound'));
        }
        elseif (session()->get('session_id_group') == 1) {
        $dms_form = Form::all();
        $dms_inbound = Transaction::getTableSuperInbound();
        $dms_outbound = Transaction::getTableSuperOutbound();
        $no_inbound = 1;
        $no_outbound = 1;
        return view('pages/dms/all_list', compact('dms_form','dms_inbound','dms_outbound','no_inbound','no_outbound'));
        }
        else{
        $dms_form = Form::all();
        $dms_inbound = Transaction::getTableInboundAdmin();
        $dms_outbound = Transaction::getTableOutboundAdmin();
        $no_inbound = 1;
        $no_outbound = 1;
        return view('pages/dms/all_list', compact('dms_form','dms_inbound','dms_outbound','no_inbound','no_outbound'));   
        }
    }


    public function input(){
        if (session()->get('session_id_group') == 3){
            $dms_master_vehicle=Master_vehicle::all();
            $dms_master_tc=Master_tc::all();
            $dms_master_project = Master_project::all();
            $dms_form = Form::all();
            return view('pages/dms/form', compact('dms_master_vehicle','dms_master_tc','dms_form','dms_master_project'));
        }
        elseif (session()->get('session_id_group') == 1){
            $dms_master_vehicle=Master_vehicle::all();
            $dms_master_tc=Master_tc::all();
            $dms_master_project = Master_project::all();
            $dms_form = Form::all();
            return view('pages/dms/form', compact('dms_master_vehicle','dms_master_tc','dms_form','dms_master_project'));
        }
        else{
            return redirect('/dms/dashboard');
        }
    } 

    function edit($id)
    {   
        if (session()->get('session_id_group') == 2)
        {
            $dms_form=Transaction::getTableTransaction()->where('id_dms_form','=',$id)->first();
            $dms_purpose=Purpose::all();
            $dms_master_vehicle=Master_vehicle::all();
            $dms_master_project = Master_project::all();
            $dms_master_tc=Master_tc::all();
            return view('pages/dms/edit', compact('dms_form','dms_purpose','dms_master_vehicle','dms_master_tc','dms_master_project'));
        }
        elseif (session()->get('session_id_group') == 1)
        {
            $dms_form=Transaction::getTableTransaction()->where('id_dms_form','=',$id)->first();
            $dms_purpose=Purpose::all();
            $dms_master_vehicle=Master_vehicle::all();
            $dms_master_project = Master_project::all();
            $dms_master_tc=Master_tc::all();
            return view('pages/dms/edit', compact('dms_form','dms_purpose','dms_master_vehicle','dms_master_tc','dms_master_project'));
        }
        else{
            return redirect('/dms/dashboard');
        }
    }

    function insert (Request $request)  
    {

        $validatedData = $request->validate([
                'driver_name' => 'required',
                'driver_phone' => 'required',
                'type_of_vehicle' => 'required',
                'plat_no' => 'required',
                'transporter_company' => 'required',
                'cust_proj_name' => 'required',
                'id_purpose' => 'required',
        ]);

        $id_purpose = $request->input('id_purpose');
        $date_str=strtotime(date('D-m-y H:i:s'));
        $id_dms_form = 'DMS'.$id_purpose.$date_str;
        $now = new DateTime();
        $waktu = $now->format('M d, y H:i:s');
        // Date("April 3, 2018 16:0:0")
            
        $request->session()->forget('inbound');
        $request->session()->forget('outbound');

        $dms_form = new Form;
                    // nama = nama field di database, var_nama = var_nama di dalam form input_blade
                        $dms_form->driver_name = $request->driver_name;
                        $dms_form->driver_phone = $request->driver_phone;
                        $dms_form->type_of_vehicle = $request->type_of_vehicle; 
                        $dms_form->plat_no = $request->plat_no; 
                        $dms_form->transporter_company = $request->transporter_company; 
                        $dms_form->shipment = $request->shipment;
                        $dms_form->id_location = session()->get('session_id_loc');
                        $dms_form->asal = $request->asal;
                        $dms_form->tujuan = $request->tujuan;
                        $dms_form->cust_proj_name = $request->cust_proj_name; 
                        $dms_form->id_purpose = $request->id_purpose; 
                        $dms_form->created_by = session()->get('session_id'); 
                        $dms_form->id_dms_form = $id_dms_form;
        $dms_form->save();

        $dms_transaction = new Transaction;
                        $dms_transaction->id_dms_form = $id_dms_form;
                        $dms_transaction->status = 1;
                        $dms_transaction->duration = $waktu;
                        $dms_transaction->arrival_time = $waktu;
                        $dms_transaction->created_by = session()->get('session_id'); 
        $dms_transaction->save();

        $dms_transaction_history = new Transaction_history;
                        $dms_transaction_history->id_dms_form = $id_dms_form;
                        $dms_transaction_history->status = 1;
                        $dms_transaction_history->duration = $waktu;
                        $dms_transaction_history->arrival_time = $waktu;
                        $dms_transaction_history->created_by = session()->get('session_id'); 
        $dms_transaction_history->save();
        
        $result = Master_plat::where('plat_no','=',$request->plat_no)->first();
        $phone = Master_phone::where('driver_phone','=',$request->driver_phone)->first();
                  
            if (sizeof($result) > 0){}
            else
            {
                    $dms_master_plat = new Master_plat;
                        $dms_master_plat->plat_no = $request->plat_no;
                        $dms_master_plat->created_by = session()->get('session_id'); 
                    $dms_master_plat->save();
            } 

            if (sizeof($phone) > 0){}
            else
            {
                    $dms_master_phone = new Master_phone;
                        $dms_master_phone->driver_phone = $request->driver_phone;
                        $dms_master_phone->created_by = session()->get('session_id'); 
                    $dms_master_phone->save();
            } 

        if ($request->id_purpose = 1) {
            $request->session()->put('inbound', "inbound");
            $request->session()->put('outbound', "");
            return  redirect('/dms/dashboard');
        }elseif($request->id_purpose = 2) {
            $request->session()->put('inbound', "");
            $request->session()->put('outbound', "outbound");
            return  redirect('/dms/dashboard');}
    }

    // menampilkan fungsi edit
    function update (Request $request, $id)  
    {
        $validatedData = $request->validate([
                'driver_name' => 'required',
                'driver_phone' => 'required',
                'plat_no' => 'required',
                'type_of_vehicle' => 'required',
                'transporter_company' => 'required',
                'cust_proj_name' => 'required',
                'id_purpose' => 'required',
            ]);

            $now = new DateTime();

                    $dms_form = Form::where('id_dms_form','=',$id)->first();
                        $dms_form->driver_name = $request->driver_name;
                        $dms_form->type_of_vehicle = $request->type_of_vehicle; 
                        $dms_form->plat_no = $request->plat_no; 
                        $dms_form->driver_phone = $request->driver_phone;
                        $dms_form->shipment = $request->shipment;
                        $dms_form->asal = $request->asal;
                        $dms_form->tujuan = $request->tujuan;
                        $dms_form->id_location = session()->get('session_id_loc');
                        $dms_form->transporter_company = $request->transporter_company; 
                        $dms_form->shipment = $request->shipment; 
                        $dms_form->cust_proj_name = $request->cust_proj_name; 
                        $dms_form->id_purpose = $request->id_purpose; 
                        $dms_form->created_by = session()->get('session_id'); 
                        $dms_form->id_dms_form = $request->id_dms_form;
                    // untuk mengsave
                    $dms_form->save();

                    $dms_transaction = Transaction::where('id_dms_form','=',$id)->first();
                        $dms_transaction->id_dms_form = $request->id_dms_form;
                        $dms_transaction->gate_number = $request->gate_number;
                        if ($dms_transaction->status == 1) {
                            if ($request->gate_number == "") {
                                $dms_transaction->status = $dms_transaction->status;
                            }
                            else{
                                $dms_transaction->status = 2;
                            }
                        }else{
                            $dms_transaction->status = $dms_transaction->status;
                        }
                        $dms_transaction->waiting_time = $request->waiting_time;
                        $dms_transaction->updated_by = session()->get('session_id'); 
                    $dms_transaction->save();

                    $dms_transaction_history = new Transaction_history;
                        $dms_transaction_history->id_dms_form = $request->id_dms_form;
                        $dms_transaction_history->gate_number = $request->gate_number;
                        if ($dms_transaction_history->status == 1) {
                            if ($request->gate_number == "") {
                                $dms_transaction_history->status = $dms_transaction_history->status;
                            }
                            else{
                                $dms_transaction_history->status = 2;
                            }
                        }else{
                            $dms_transaction_history->status = $dms_transaction_history->status;
                        }
                        $dms_transaction_history->waiting_time = $request->waiting_time;
                        $dms_transaction_history->created_by = session()->get('session_id');
                    $dms_transaction_history->save();

                $result = Master_plat::where('plat_no','=',$request->plat_no)->first(); 
                $phone = Master_phone::where('driver_phone','=',$request->driver_phone)->first();    

                if (sizeof($result) > 0){
                }
                else
                {
                    $dms_master_plat = new Master_plat;
                        $dms_master_plat->plat_no = $request->plat_no;
                        $dms_master_plat->created_by = session()->get('session_id'); 
                    $dms_master_plat->save();
                }

                if (sizeof($phone) > 0){
                }
                else
                {
                    $dms_master_phone = new Master_phone;
                        $dms_master_phone->driver_phone = $request->driver_phone;
                        $dms_master_phone->created_by = session()->get('session_id'); 
                    $dms_master_phone->save();
                }
        if ($dms_form->id_purpose == 1) {
            return  redirect('/dms/dashboard#inbound');}
        elseif($dms_form->id_purpose == 2){
            return  redirect('/dms/dashboard#outbound');}
    }

    public function delete($id){
        // find khusus untuk primary key di database
        $dms_form = Form::where('id_dms_form','=',$id)->delete();
        $dms_transaction = Transaction::where('id_dms_form','=',$id)->delete();

        // sama aja kaya href setelak klik delete
        // mau pindah ke link mana setelah tombol submit di klik
        return  redirect('dms/dashboard');
    } 

    //========================================================
    public function plat_no(Request $request){
         $term = $request->term;
         $item = Master_plat::where('plat_no','LIKE','%'.$term.'%')->get();
         foreach ($item as $key => $value) {
             $searchResult[] = $value->plat_no;
         }
         return $searchResult;
     } 

     public function driver_phone(Request $request){
        $term = $request->term;
        $item = Master_phone::where('driver_phone','LIKE','%'.$term.'%')->get();
        foreach ($item as $key => $value) {
            $searchResult[] = $value->driver_phone;
        }
        return $searchResult;
    } 

    public function input_id(Request $request){
        $id = $request->dms_id_hidden; 
        print_r($id);
        $outside = 'Waiting Outside';  
        // return confirm("$request->dms_id Apakah id sudah benar?");
        $check_dms = Transaction::getTableTransaction()->where('id_dms_form','=',$id);
        if (sizeof($check_dms) > 0){

            $dms_transaction = Transaction::where('id_dms_form','=',$id)->first();
            if (session()->get('session_id_group') == 1){
                return $this->validation_superadmin($dms_transaction,$id);
            }
            elseif (session()->get('session_id_group') == 3){
                return $this->validation_scurity($$dms_transaction,$id);
            }
            elseif (session()->get('session_id_group') == 4) {
                return $this->validation_checker($$dms_transaction,$id);
            }
            elseif (session()->get('session_id_group') == 2) {
                return $this->validation_checker($$dms_transaction,$id);
            }
            else{
                Session::flash('id_dms', "Tidak memiliki akses scan");
                return Redirect::back();
            }
        }

        else{
            Session::flash('id_dms', "ID tidak ada");
            return Redirect::back();
        }
    }

    public function validation_superadmin($dms_transaction,$id)
    {
        $now = new DateTime();
        $waktu = $now->format('M d, y H:i:s');
        $last_scan = $now->format('H:i');

        if ($dms_transaction->status == 1) {
            echo "*Print Struk* status masih 'waiting outside'";
            return redirect('/dms/dashboard');
        }
        elseif ($dms_transaction->status == 2) {
            $dms_transaction->status = 3;
            $dms_transaction->last_scan = $last_scan;
            $dms_transaction->save();

            $dms_transaction_history = new Transaction_history;
            $dms_transaction_history->id_dms_form = $id;
            $dms_transaction_history->status = 3;
            $dms_transaction_history->last_scan = $last_scan;
            $dms_transaction_history->created_by = session()->get('session_id');
            $dms_transaction_history->save();
            return redirect('/dms/dashboard');
        }

        elseif ($dms_transaction->status == 3) {
            $dms_transaction->status = 4;
            $dms_transaction->last_scan = $last_scan;
            $dms_transaction->save();

            $dms_transaction_history = new Transaction_history;
            $dms_transaction_history->id_dms_form = $id;
            $dms_transaction_history->status = 4;
            $dms_transaction_history->last_scan = $last_scan;
            $dms_transaction_history->created_by = session()->get('session_id');
            $dms_transaction_history->save();
            return redirect('/dms/dashboard');
        }
        elseif ($dms_transaction->status == 4) {
            $dms_transaction->status = 5;
            $dms_transaction->last_scan = $last_scan;
            $dms_transaction->save();

            $dms_transaction_history = new Transaction_history;
            $dms_transaction_history->id_dms_form = $id;
            $dms_transaction_history->status = 5;
            $dms_transaction_history->last_scan = $last_scan;
            $dms_transaction_history->created_by = session()->get('session_id');
            $dms_transaction_history->save();
            return redirect('/dms/dashboard');
        }
        elseif ($dms_transaction->status == 5) {
            $dms_transaction->status = 6;
            $dms_transaction->exit_time = $waktu;
            $dms_transaction->last_scan = $last_scan;
            $dms_transaction->save();

            $dms_transaction_history = new Transaction_history;
            $dms_transaction_history->id_dms_form = $id;
            $dms_transaction_history->exit_time = $waktu;
            $dms_transaction_history->status = 6;
            $dms_transaction_history->last_scan = $last_scan;
            $dms_transaction_history->created_by = session()->get('session_id');
            $dms_transaction_history->save();
            return redirect('/dms/dashboard');
        }
        else{
            return redirect('/dms/dashboard');
        }
    }

    public function validation_scurity($dms_transaction,$id)
    {
        $now = new DateTime();
        $waktu = $now->format('M d, y H:i:s');
        $last_scan = $now->format('H:i');

        if ($dms_transaction->status == 1) {
            echo "*Print Struk* status masih 'waiting outside'";
            return redirect('/dms/dashboard');
        }
        elseif ($dms_transaction->status == 2) {
            $dms_transaction->status = 3;
            $dms_transaction->last_scan = $last_scan;
            $dms_transaction->save();

            $dms_transaction_history = new Transaction_history;
            $dms_transaction_history->id_dms_form = $id;
            $dms_transaction_history->status = 3;
            $dms_transaction_history->last_scan = $last_scan;
            $dms_transaction_history->created_by = session()->get('session_id');
            $dms_transaction_history->save();
            return redirect('/dms/dashboard');
        }
        elseif ($dms_transaction->status == 5) {
            $dms_transaction->status = 6;
            $dms_transaction->exit_time = $waktu;
            $dms_transaction->last_scan = $last_scan;
            $dms_transaction->save();

            $dms_transaction_history = new Transaction_history;
            $dms_transaction_history->id_dms_form = $id;
            $dms_transaction_history->exit_time = $waktu;
            $dms_transaction_history->status = 6;
            $dms_transaction_history->last_scan = $last_scan;
            $dms_transaction_history->created_by = session()->get('session_id');
            $dms_transaction_history->save();
            return redirect('/dms/dashboard');
        }
        else{
            return redirect('/dms/dashboard');
        }
    }

    public function validation_checker($dms_transaction,$id)
    {
        if ($dms_transaction->status == 3) {
            $dms_transaction->status = 4;
            $dms_transaction->last_scan = $last_scan;
            $dms_transaction->save();

            $dms_transaction_history = new Transaction_history;
            $dms_transaction_history->id_dms_form = $id;
            $dms_transaction_history->status = 4;
            $dms_transaction_history->last_scan = $last_scan;
            $dms_transaction_history->created_by = session()->get('session_id');
            $dms_transaction_history->save();
            return redirect('/dms/dashboard');
        }
        elseif ($dms_transaction->status == 4) {
            $dms_transaction->status = 5;
            $dms_transaction->last_scan = $last_scan;
            $dms_transaction->save();

            $dms_transaction_history = new Transaction_history;
            $dms_transaction_history->id_dms_form = $id;
            $dms_transaction_history->status = 5;
            $dms_transaction_history->last_scan = $last_scan;
            $dms_transaction_history->created_by = session()->get('session_id');
            $dms_transaction_history->save();
            return redirect('/dms/dashboard');
        }
        else{
            return redirect('/dms/dashboard');
        }
    }

    public function all_list_json(){
        if (session()->get('session_id_group') == 3){
        $dms_form = Form::all();
        $dms_inbound = Transaction::getTableInbound();
        $dms_outbound = Transaction::getTableOutbound();
        

        //======================================================================
        foreach($dms_inbound as $inbounds => $inbound){

                    $tampungInbound[] = array(
                        'plat_no' => $inbound->plat_no,
                        'driver_name' => $inbound->driver_name,
                        'transporter_company' => $inbound->transporter_company,
                        'duration' => $inbound->duration,
                        'status_name' => $inbound->status_name,
                        'asal' => $inbound->asal,
                        'gate_number' => $inbound->gate_number,
                        'type_of_vehicle' => $inbound->type_of_vehicle,
                        'master_project_name' => $inbound->master_project_name
                        );

                    }
        foreach($dms_outbound as $outbounds => $outbound){

                    $tampungOutbound[] = array(
                        'plat_no' => $outbound->plat_no,
                        'driver_name' => $outbound->driver_name,
                        'transporter_company' => $outbound->transporter_company,
                        'duration' => $outbound->duration,
                        'status_name' => $outbound->status_name,
                        'asal' => $outbound->asal,
                        'gate_number' => $outbound->gate_number,
                        'type_of_vehicle' => $outbound->type_of_vehicle,
                        'master_project_name' => $outbound->master_project_name,
                        );

                    }
        //===========================================================================
        $tampung[] = array('inbound' => $tampungInbound, 'outbound' => $tampungOutbound);
        return response()->json($tampung);
        }
        /*elseif (session()->get('session_id_group') == 1){
        $dms_form = Form::all();
        $dms_inbound = Transaction::getTableSuperInbound();
        $dms_outbound = Transaction::getTableSuperOutbound();
        $tampung[] = array();
        return response()->json([
            foreach($dms_inbound as $inbounds => $inbound){
            'plat_no' => $inbound->plat_no,
            'driver_name' => $inbound->driver_name,
            'transporter_company' => $inbound->transporter_company,
            'duration' => $inbound->duration,
            'status_name' => $inbound->status_name,
            'asal' => $inbound->asal,
            'gate_number' => $inbound->gate_number,
            'type_of_vehicle' => $inbound->type_of_vehicle,
            'master_project_name' => $inbound->master_project_name,
            }
            foreach($dms_outbound['outbounds'] as $outbounds => $outbound){
            'plat_no' => $outbound->plat_no,
            'driver_name' => $outbound->driver_name,
            'transporter_company' => $outbound->transporter_company,
            'duration' => $outbound->duration,
            'status_name' => $outbound->status_name,
            'asal' => $outbound->asal,
            'gate_number' => $outbound->gate_number,
            'type_of_vehicle' => $outbound->type_of_vehicle,
            'master_project_name' => $outbound->master_project_name,
            }
        ]);
        }
        else{
        $dms_form = Form::all();
        $dms_inbound = Transaction::getTableInboundAdmin();
        $dms_outbound = Transaction::getTableOutboundAdmin();
        $tampung[] = array();
        return response()->json([
            foreach($dms_inbound as $inbounds => $inbound){
            'plat_no' => $inbound->plat_no,
            'driver_name' => $inbound->driver_name,
            'transporter_company' => $inbound->transporter_company,
            'duration' => $inbound->duration,
            'status_name' => $inbound->status_name,
            'asal' => $inbound->asal,
            'gate_number' => $inbound->gate_number,
            'type_of_vehicle' => $inbound->type_of_vehicle,
            'master_project_name' => $inbound->master_project_name,
            }
            foreach($dms_outbound['outbounds'] as $outbounds => $outbound){
            'plat_no' => $outbound->plat_no,
            'driver_name' => $outbound->driver_name,
            'transporter_company' => $outbound->transporter_company,
            'duration' => $outbound->duration,
            'status_name' => $outbound->status_name,
            'asal' => $outbound->asal,
            'gate_number' => $outbound->gate_number,
            'type_of_vehicle' => $outbound->type_of_vehicle,
            'master_project_name' => $outbound->master_project_name,
            }
        ]);
        }*/
    }
}