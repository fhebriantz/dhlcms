<?php

namespace App\Http\Controllers\Dms;
 //require __DIR__'/vendor/autoload.php';
// use Mike42\Escpos\PrintConnectors\FilePrintConnector;
// use Mike42\Escpos\PrintConnectors\WindowsPrintConnector;
// use Mike42\Escpos\Printer;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Controllers\Model\Form;
use App\Http\Controllers\Model\Transaction;
use App\Http\Controllers\Model\Transaction_history;
use App\Http\Controllers\Model\Master_vehicle;
use App\Http\Controllers\Model\Master_plat;
use App\Http\Controllers\Model\Master_phone;
use App\Http\Controllers\Model\Master_name;
use App\Http\Controllers\Model\Master_asal;
use App\Http\Controllers\Model\Master_tujuan;
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
 /* Call this file 'hello-world.php' */
use vendor\autoload;

use Mike42\Escpos\EscposImage;
use Mike42\Escpos\PrintConnectors\WindowsPrintConnector;
use Mike42\Escpos\PrintConnectors\FilePrintConnector;
use Mike42\Escpos\Printer;

class DockController extends Controller




{
    public function autofill(){
        $dms_form=Transaction_history::getTableHistory()
        ->where('plat_no','=','B 1234 CIB')->first();
        return view('pages/dms/last_data', compact('dms_form'));
    }

    function test_print($id_dms_form,$darike,$tab)
    {
        $tgl_cetak=date("Y-m-d");
        $mytime = Carbon\Carbon::now();
        $waktu = $mytime->toDateTimeString();
        $cek=Transaction::getTableTransaction()->where('id_dms_form','=',$id_dms_form)->first();
        $plat = $cek->plat_no;
        $customer = $cek->master_project_name;
        $purpose = $cek->purpose;
       
        try {
            $connector = new WindowsPrintConnector("receipt");            
            $printer = new Printer($connector);
            // ===============================Connect Printer

            // Header Start
            $printer -> initialize();
            $printer -> selectPrintMode(Printer::MODE_DOUBLE_HEIGHT | Printer::MODE_DOUBLE_WIDTH);
            $printer -> setJustification(Printer::JUSTIFY_CENTER);
            $printer -> setTextSize(3,3);
            $printer -> setEmphasis(true);
            $printer -> text("DHL\n");
            $printer -> setEmphasis(false);
            $printer -> selectPrintMode();
            $printer -> setTextSize(1,1);
            $printer -> setEmphasis(true);
            $printer -> text("Dock Management System\n");
            $printer -> setEmphasis(false);
            $printer -> selectPrintMode();
            $printer -> text($waktu."\n");
            $printer -> feed();
            $printer -> text("------------------------------------------------\n");
            $printer -> feed(); 
            // Header End

            // Body sTART
            $printer -> setJustification(Printer::JUSTIFY_LEFT);
        //  $printer -> text("------------------------.-----------------------\n");
            $printer -> text("          Plat:              Asal/Tujuan:       \n");
            $printer -> setEmphasis(true);
            $printer -> text("        ".$plat."              ".$darike."\n");
            $printer -> setEmphasis(false);
            $printer -> feed();
            $printer -> text("         Project:              Jenis:           \n");
            $printer -> setEmphasis(true);
            $printer -> text("        ".$customer."              ".$purpose."\n");
        //  $printer -> text("------------------------.-----------------------\n");
            $printer -> setEmphasis(false);
            // Body eND

            // ======================================================================Barcode

            $printer -> setJustification(Printer::JUSTIFY_CENTER);
            $printer->setBarcodeHeight(150);
            $printer->setBarcodeWidth(2);
            $standards = array (
                Printer::BARCODE_CODE39 => array (
                        "title" => "Code39",
                        "caption" => "Variable length alphanumeric w/ some special chars.",
                        "example" => array (
                                array (
                                        "caption" => "Text, numbers, spaces",
                                        "content" => $id_dms_form
                                )
                        )
                )
            );
            $printer->setBarcodeTextPosition(Printer::BARCODE_TEXT_BELOW);
            foreach ($standards as $type => $standard) {
                $printer->selectPrintMode(Printer::MODE_DOUBLE_HEIGHT | Printer::MODE_DOUBLE_WIDTH);
                //$printer->text($standard ["title"] . "\n");
                $printer->selectPrintMode();
                //$printer->text($standard ["caption"] . "\n\n");
                foreach ($standard ["example"] as $id => $barcode) {
                    // $printer->setEmphasis(true);
                    //$printer->text($barcode ["caption"] . "\n");
                    // $printer->setEmphasis(false);
                    // $printer->text("Content: " . $barcode ["content"] . "\n");
                    $printer->barcode($barcode ["content"], $type);
                    //$printer->feed();
                }
            }
            // =====================================================================END Barcode


            // Footer
            $printer -> feed(); 
            $printer -> text("           TIKET JANGAN SAMPAI HILANG           \n");
            $printer -> feed(); 
            // Footer

            $printer -> cut();
            $printer -> close();
        } catch (Exception $e) {
            echo "Couldn't print to this printer: " . $e -> getMessage() . "\n";
        }

                
        if ($tab = 1) {
            return  redirect('/dms/dashboard#inbound');
        }elseif($tab = 2) {
            return  redirect('/dms/dashboard#outbound');}
    }

    function test_printer()
    {
       
         try {
            $connector = new WindowsPrintConnector("receipt");            
            $printer = new Printer($connector);
            $printer -> text("Helloword\n");
            $printer -> cut();
            
            $printer -> close();
        } catch (Exception $e) {
            echo "Couldn't print to this printer: " . $e -> getMessage() . "\n";
        }
    }

    public function testapi($no_telp,$plat,$driver){

        $clientA = new GuzzleHttp\Client();
        $str_phone = substr($no_telp, 1);
        $response = $clientA->request('GET', 'http://www.etracker.cc/bulksms/mesapi.aspx?user=AzhaDHL01&pass=y1,i3qFa&type=0&to=62'.$str_phone.'&from=CMK&text=Kendaraan dengan plat no '.$plat.' dengan nama '.$driver.' Antrtian anda sudah dipanggil.&servid=MES01&title=test sms gateway');  
        $status =  $response->getStatusCode(); 
        if($status == 200)
        {
            $buffer =  $response->getBody()->getContents();     
            return $buffer;
        }else {
            return 'error_api';
        }
    }

     public function sms_gateway($id){
        $id_dms = $id;
        $sms_tampung = Transaction::getTableTransaction()->where('id_dms_form','=',$id_dms)->first();
    $this->testapi($sms_tampung->driver_phone,$sms_tampung->plat_no,$sms_tampung->driver_name);
            
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
                        $dms_form->plat_no = strtoupper($request->plat_no); 
                        $dms_form->transporter_company = $request->transporter_company; 
                        $dms_form->shipment = strtoupper($request->shipment);
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
        $name = Master_name::where('driver_name','=',$request->driver_name)->first();
                  
            if (sizeof($result) > 0){}
            else
            {
                    $dms_master_plat = new Master_plat;
                        $dms_master_plat->plat_no = strtoupper($request->plat_no);
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


            if (sizeof($name) > 0){}
            else
            {
                    $dms_master_name = new Master_name;
                        $dms_master_name->driver_name = $request->driver_name;
                        $dms_master_name->created_by = session()->get('session_id'); 
                    $dms_master_name->save();
            }

            if ($request->asal==''||$request->asal== null) {}
            else{

                    $asal = Master_asal::where('asal','=',$request->asal)->first();
                    if (sizeof($asal) > 0){}
                    else
                    {
                            $dms_master_asal = new Master_asal;
                                $dms_master_asal->asal = $request->asal;
                                $dms_master_asal->created_by = session()->get('session_id'); 
                            $dms_master_asal->save();
                    }
            }

            if ($request->tujuan==''||$request->tujuan== null) {}
            else{

                    $tujuan = Master_tujuan::where('tujuan','=',$request->tujuan)->first();
                    if (sizeof($tujuan) > 0){}
                    else
                    {
                            $dms_master_tujuan = new Master_tujuan;
                                $dms_master_tujuan->tujuan = $request->tujuan;
                                $dms_master_tujuan->created_by = session()->get('session_id'); 
                            $dms_master_tujuan->save();
                    }
            }

        if ($request->id_purpose = 1) {
            $darike = $request->asal;
        }elseif($request->id_purpose = 2) {
            $darike = $request->tujuan;
        }
        $tab = $request->id_purpose;
        return $this->test_print($id_dms_form,$darike,$tab);
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
                        $dms_form->plat_no = strtoupper($request->plat_no); 
                        $dms_form->driver_phone = $request->driver_phone;
                        $dms_form->shipment = strtoupper($request->shipment);
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
        $name = Master_name::where('driver_name','=',$request->driver_name)->first();
                  
            if (sizeof($result) > 0){}
            else
            {
                    $dms_master_plat = new Master_plat;
                        $dms_master_plat->plat_no = strtoupper($request->plat_no);
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

            if (sizeof($name) > 0){}
            else
            {
                    $dms_master_name = new Master_name;
                        $dms_master_name->driver_name = $request->driver_name;
                        $dms_master_name->created_by = session()->get('session_id'); 
                    $dms_master_name->save();
            }

             if ($request->asal==''||$request->asal== null) {}
            else{

                    $asal = Master_asal::where('asal','=',$request->asal)->first();
                    if (sizeof($asal) > 0){}
                    else
                    {
                            $dms_master_asal = new Master_asal;
                                $dms_master_asal->asal = $request->asal;
                                $dms_master_asal->created_by = session()->get('session_id'); 
                            $dms_master_asal->save();
                    }
            }

            if ($request->tujuan==''||$request->tujuan== null) {}
            else{

                    $tujuan = Master_tujuan::where('tujuan','=',$request->tujuan)->first();
                    if (sizeof($tujuan) > 0){}
                    else
                    {
                            $dms_master_tujuan = new Master_tujuan;
                                $dms_master_tujuan->tujuan = $request->tujuan;
                                $dms_master_tujuan->created_by = session()->get('session_id'); 
                            $dms_master_tujuan->save();
                    }
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

    //========================================================AUTOCOMPLETE
    public function plat_no(Request $request){
         $term = $request->term;
         $item = Master_plat::where('plat_no','LIKE','%'.$term.'%')->get();
         foreach ($item as $key => $value) {
             $searchResult[] = $value->plat_no;
         }
         return $searchResult;
     } 

     public function asal(Request $request){
         $term = $request->term;
         $item = Master_asal::where('asal','LIKE','%'.$term.'%')->get();
         foreach ($item as $key => $value) {
             $searchResult[] = $value->asal;
         }
         return $searchResult;
     } 

     public function tujuan(Request $request){
         $term = $request->term;
         $item = Master_tujuan::where('tujuan','LIKE','%'.$term.'%')->get();
         foreach ($item as $key => $value) {
             $searchResult[] = $value->tujuan;
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

    public function transporter_company(Request $request){
        $term = $request->term;
        $item = Master_tc::where('master_tc_name','LIKE','%'.$term.'%')->get();
        foreach ($item as $key => $value) {
            $searchResult[] = $value->master_tc_name;
        }
        return $searchResult;
    } 

     public function driver_name(Request $request){
         $term = $request->term;
         $item = Master_name::where('driver_name','LIKE','%'.$term.'%')->get();
         foreach ($item as $key => $value) {
             $searchResult[] = $value->driver_name;
         }
         return $searchResult;
     } 
    //========================================================AUTOCOMPLETE

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
        $last_scan = $now->format('H:i:s d/M/Y');

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
        $last_scan = $now->format('H:i:s d/M/Y');

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
                            'id_dms_form' => $inbound->id_dms_form,
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
                            'id_dms_form' => $outbound->id_dms_form,
                            'plat_no' => $outbound->plat_no,
                            'driver_name' => $outbound->driver_name,
                            'transporter_company' => $outbound->transporter_company,
                            'duration' => $outbound->duration,
                            'status_name' => $outbound->status_name,
                            'tujuan' => $outbound->tujuan,
                            'gate_number' => $outbound->gate_number,
                            'type_of_vehicle' => $outbound->type_of_vehicle,
                            'master_project_name' => $outbound->master_project_name,
                            );
                        }
            //===========================================================================
            $tampung[] = array('inbound' => $tampungInbound, 'outbound' => $tampungOutbound);
            return response()->json($tampung);
        }

        elseif (session()->get('session_id_group') == 1){
            $dms_form = Form::all();
            $dms_inbound = Transaction::getTableSuperInbound();
            $dms_outbound = Transaction::getTableSuperOutbound();
            //======================================================================
            foreach($dms_inbound as $inbounds => $inbound){
                        $tampungInbound[] = array(
                            'id_dms_form' => $inbound->id_dms_form,
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
                            'id_dms_form' => $outbound->id_dms_form,
                            'plat_no' => $outbound->plat_no,
                            'driver_name' => $outbound->driver_name,
                            'transporter_company' => $outbound->transporter_company,
                            'duration' => $outbound->duration,
                            'status_name' => $outbound->status_name,
                            'tujuan' => $outbound->tujuan,
                            'gate_number' => $outbound->gate_number,
                            'type_of_vehicle' => $outbound->type_of_vehicle,
                            'master_project_name' => $outbound->master_project_name,
                            );
                        }
            //===========================================================================
            $tampung[] = array('inbound' => $tampungInbound, 'outbound' => $tampungOutbound);
            return response()->json($tampung);
        }

        elseif (session()->get('session_id_group') == 2){
            $dms_form = Form::all();
            $dms_inbound = Transaction::getTableInboundAdmin();
            $dms_outbound = Transaction::getTableOutboundAdmin();
            //======================================================================
            foreach($dms_inbound as $inbounds => $inbound){
                        $tampungInbound[] = array(
                            'id_dms_form' => $inbound->id_dms_form,
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
                            'id_dms_form' => $outbound->id_dms_form,
                            'plat_no' => $outbound->plat_no,
                            'driver_name' => $outbound->driver_name,
                            'transporter_company' => $outbound->transporter_company,
                            'duration' => $outbound->duration,
                            'status_name' => $outbound->status_name,
                            'tujuan' => $outbound->tujuan,
                            'gate_number' => $outbound->gate_number,
                            'type_of_vehicle' => $outbound->type_of_vehicle,
                            'master_project_name' => $outbound->master_project_name,
                            );
                        }
            //===========================================================================
            $tampung[] = array('inbound' => $tampungInbound, 'outbound' => $tampungOutbound);
            return response()->json($tampung);
        }

        else{
            $dms_form = Form::all();
            $dms_inbound = Transaction::getTableInboundAdmin();
            $dms_outbound = Transaction::getTableOutboundAdmin();
            //======================================================================
            foreach($dms_inbound as $inbounds => $inbound){
                        $tampungInbound[] = array(
                            'id_dms_form' => $inbound->id_dms_form,
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
                            'id_dms_form' => $outbound->id_dms_form,
                            'plat_no' => $outbound->plat_no,
                            'driver_name' => $outbound->driver_name,
                            'transporter_company' => $outbound->transporter_company,
                            'duration' => $outbound->duration,
                            'status_name' => $outbound->status_name,
                            'tujuan' => $outbound->tujuan,
                            'gate_number' => $outbound->gate_number,
                            'type_of_vehicle' => $outbound->type_of_vehicle,
                            'master_project_name' => $outbound->master_project_name,
                            );
                        }
            //===========================================================================
            $tampung[] = array('inbound' => $tampungInbound, 'outbound' => $tampungOutbound);
            return response()->json($tampung);
        }
    }
}