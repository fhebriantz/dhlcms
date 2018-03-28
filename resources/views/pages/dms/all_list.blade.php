@extends('layouts.dms')
@section('content')

<div class="tab-content">
	<div class="tab-pane" id="dashboards" role="tabpanel">
    <div class="col-sm-12">
        <div class="row">
          <div class="col-sm-12" style="background-color: #eee">
            <h5 style="color: #d71635"><strong>Dashboard</strong></h5>
          </div>  
        </div>
        <h2 style="color: #d71635; margin-bottom: 100px;">DASHBOARD</h2>
      </div>
      <div class="text-center" style="">
        <p><strong>WEDNESDAY</strong>, 15 OCTOBER 2018 / 21:15</p>
        <h1 style="margin-top: 30px">SELAMAT DATANG</h1>
        <p><strong>di Dock Management System</strong></p>  
      </div> 
    </div>
    <div>
      <div class="col-sm-12">
        <h2 class="titledashboard" style="color: #d71635">INBOUND / {{session()->get('session_name_project')}}</h2>
      </div>
      <table class="table-striped fontsizetable text-center" id="inbound_id"  width="100%" cellspacing="0">
        <thead class="thead paddingtable text-center" >
          <tr >
            <th class="">No</th>
            <th class="phone " style="width: 12%">PLATE NO</th>
            <th class="" style="width: 13%">DRIVER NAME</th>
            <th class="cus " style="width: 12%">TRANSPORTER COMPANY</th>
            <th class=" " style="width: 5%">DURATION</th>
            <th class=" " style="width: 5%">PROGRES</th>
            <th class="phone "  style="width: 8%">PUT</th>
            <th class="phone " style="width: 1%">GATE</th>
            <th class="" style="width: 10%">VEHICLE</th>
            <th class="cus " style="width: 14%" >PROJECT NAME</th>
          </tr>
        </thead>

        <tbody class="paddingtable text-center">
           @foreach($dms_inbound as $inbound)
          <tr>    
            <td class="">{{ $no_inbound++ }}</td>
            <td class="phone ">{{$inbound->plat_no}}</td>
            <td class="">{{$inbound->driver_name}}</td>
            <td class="cus ">{{$inbound->transporter_company}}</td>
            <td class="">{{$inbound->duration}}</td>
            <td class="">{{$inbound->status}}</td>
            <td class="phone ">
              <?php if ($inbound->waiting_time == ''): ?>
              <?php echo "-" ?>
              <?php else: ?>
              <?php echo "$inbound->waiting_time Min" ?>
              <?php endif ?></td>
            <td class="cus ">{{$inbound->gate_number}}</td>
            <td class="">{{$inbound->type_of_vehicle}}</td>
            <td class="cus ">{{$inbound->master_project_name}}</td>
          </tr>
           @endforeach
        </tbody>
      </table>
    </div>
    <div>
      <div class="col-sm-12">
        <div class="row ujung">
          
        </div>
        <h2 class="titledashboard" style="color: #d71635">OUTBOUND / {{session()->get('session_name_project')}}</h2>
      </div>
      <table class="table-striped fontsizetable text-center"  width="100%" cellspacing="0" id="outbound_id">     
        <thead class="thead paddingtable text-center" >
          <tr >
            <th class="">No</th>
            <th class="phone " style="width: 12%">PLATE NO</th>
            <th class="" style="width: 13%">DRIVER NAME</th>
            <th class="cus " style="width: 12%">TRANSPORTER COMPANY</th>
            <th class=" " style="width: 5%">DURATION</th>
            <th class=" " style="width: 8%">PROGRES</th>
            <th class="phone "  style="width: 8%">PUT</th>
            <th class="phone " style="width: 1%">GATE</th>
            <th class="" style="width: 10%">VEHICLE</th>
            <th class="cus " style="width: 14%" >PROJECT NAME</th>
          </tr>
        </thead>

        <tbody class="paddingtable">
          @foreach($dms_outbound as $outbound)
          <tr>    
            <td class="">{{ $no_outbound++ }}</td>
            <td class="phone ">{{$outbound->plat_no}}</td>
            <td class="">{{$outbound->driver_name}}</td>
            <td class="cus ">{{$outbound->transporter_company}}</td>
            <td class="">{{$outbound->duration}}</td>
            <td class="">{{$outbound->status}}</td>
            <td class="phone ">
              <?php if ($outbound->waiting_time == ''): ?>
              <?php echo "-" ?>
              <?php else: ?>
              <?php echo "$outbound->waiting_time Min" ?>
              <?php endif ?>
            </td>
            <td class="cus ">{{$outbound->gate_number}}</td>
            <td class="">{{$outbound->type_of_vehicle}}</td>
            <td class="cus ">{{$outbound->master_project_name}}</td>
          </tr>
           @endforeach
        </tbody>
      </table>
    </div>
      <div class="tab-pane" id="profile" role="tabpanel"><h1>user profile</h1></div>
      <div class="tab-pane" id="scan" role="tabpanel"><h1>scan</h1></div>
    </div>
@endsection

