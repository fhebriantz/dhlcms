@extends('layouts.dms')
@section('navatas_dashboard')
      <li class="dropdown "><a class="dropdown-toggle bell" data-toggle="dropdown" href="#"><img class="iconrightnav" src="{{ asset('image/bell.png')}}" alt=""></a>
        <ul class="dropdown-menu dropdown-menu-right">
          <div class="notificationBar" style="width: 400px">
          <li>
            <i class="ion-android-notifications"></i>
            <div>Pengiriman sudah sampai</div>
          </li>
           <li>
            <i class="ion-android-notifications"></i>
            <div>Pengiriman delay 20 min</div>
          </li>
           <li>
            <i class="ion-android-notifications"></i>
            <div>Proses pick up</div>
          </li>
          </div>
        </ul>
      </li>
      <li><a href="/dhlcms/public/dms/logout" onclick="
      // event.preventDefault(); document.getElementById('logout-form').submit();
      "><img class="iconrightnav" src="{{ asset('image/logout.png')}}" alt=""></a></li>
@endsection
@section('nav_dasboard')
      <ul class="nav nav-tabs navbottom" role="tablist" id="myTab">
      <li class="nav-item navbar-right" style="float: right; cursor: pointer;">
        <a>{{session()->get('session_name')}} / {{session()->get('session_name_project')}}</a>
      </li>
      </ul>
@endsection
@section('content')
    <div class="tab-pane active">
      <div class="col-sm-12">
        <div class="row ujung">
          <div class="col-sm-12 paddinghead" style="background-color: #eee">
            <h5 style="color: #d71635"><strong>DMS Data Form</strong></h5>
          </div>  
        </div>
        <h2 style="color: #d71635; float: left;" class="titledashboard">Add DMS Data</h3>
        <h2 style="color: #2d9e20; float: right;" class="titledashboard">{{ $dms_form->status_name }}</h2>
      </div>

      <div class="col-md-12 col-sm-12">
        @if ($errors->any())
            <div class="alert alert-danger">
              <ul>
                @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
                @endforeach
              </ul>
          </div>
        @endif
          <form method="POST" action="/dhlcms/public/dms/{{ $dms_form->id_dms_form }}/edit">
              {{ csrf_field() }}
              <table class="table table-striped fontinput">
                  <tr>
                    <td>ID DMS Form</td>
                    <td><input class="form-control" type="text" name="id_dms_form" placeholder="ID Dms Form" value="{{ $dms_form->id_dms_form }}" style="width: 100%" readonly=""></td>
                  </tr>
                  <tr>
                    <td>Plat Nomor</td>
                    <td><input class="form-control" type="text" name="plat_no" value="{{ $dms_form->plat_no }}" placeholder="Plat Nomor" style="width: 100%"></td>
                  </tr>
                  <tr>
                    <td>Nama Sopir</td>
                    <td><input class="form-control" type="text" name="driver_name" placeholder="Nama Driver" value="{{ $dms_form->driver_name }}" style="width: 100%" autocomplete="off"></td>
                  </tr>
                  
                  <tr>
                    <td>Nomor Handphone</td>
                    <td><input class="form-control" type="text" name="driver_phone" placeholder="Phone Number" value="{{ $dms_form->driver_phone }}" style="width: 100%"  autocomplete="off"></td>
                  </tr>
                  
                  <tr>
                    <td>Tipe Kendaraan</td>
                    <td><select class="form-control" name="type_of_vehicle" style="width: 100%">
                      <option value="">-- Pilih Kategori --</option>
                        @foreach ($dms_master_vehicle as $vehicle)
                      <option value="{{ $vehicle->master_vehicle_name }}"
                        <?php if ($vehicle->master_vehicle_name == $dms_form->type_of_vehicle): ?>
                        <?php echo "selected" ?>
                        <?php endif ?>>{{ $vehicle->master_vehicle_name }}</option>
                      @endforeach
                    </select></td>
                  </tr>

                  

                  <tr>
                    <td>Perusahaan Transportasi</td>
                    <td><select class="form-control" name="transporter_company" style="width: 100%">
                      <option value="">-- Pilih Kategori --</option>
                      @foreach ($dms_master_tc as $tc)
                      <option value="{{ $tc->master_tc_name }}"
                        <?php if ($tc->master_tc_name == $dms_form->transporter_company): ?>
                        <?php echo "selected" ?>
                        <?php endif ?>>{{ $tc->master_tc_name }}</option>
                      @endforeach
                    </select></td>
                  </tr>
<!-- 
                  <tr>
                    <td>Duration</td>
                    <td><input class="form-control" type="time" name="duration" value="{{ $dms_form->duration }}" placeholder="Duration" style="width: 100%"></td>
                  </tr> -->

                  <tr>
                    <td>Shipment</td>
                    <td><input class="form-control" type="text" name="shipment" value="{{ $dms_form->shipment }}" placeholder="Shipment" style="width: 100%"></td>
                  </tr>

                  <tr>
                    <td>Asal</td>
                    <td><input class="form-control" type="text" name="asal" id="asal " placeholder="Asal (Inbound)" value="{{ $dms_form->asal }}" style="width: 100%"></td>
                  </tr>
                  <tr>
                    <td>Tujuan</td>
                    <td><input class="form-control" type="text" name="tujuan" id="tujuan " placeholder="Tujuan (Outbound)" value="{{ $dms_form->tujuan }}" style="width: 100%"></td>
                  </tr>

                  <tr>
                      <td>Nama Proyek</td>
                         <td> <!-- select class form control untuk membuat combo box -->
                           <select class="form-control" name="cust_proj_name" style="width: 100%">
                             <option value="">-- Pilih Kategori --</option>
                             @foreach($dms_master_project as $project)
                             <option value="{{$project->id}}"
                              <?php if ($project->id == $dms_form->cust_proj_name): ?>
                              <?php echo "selected" ?>
                              <?php endif ?>>{{$project->master_project_name}}</option>
                        @endforeach
                      </select>
                    </td>
                  </tr>
                  <tr>
                       <td>Purpose</td>
                         <td> <!-- select class form control untuk membuat combo box -->
                           <select class="form-control" name="id_purpose" style="width: 100%">
                             <option value="">-- Pilih Kategori --</option>
                             @foreach($dms_purpose as $purpose)
                             <option value="{{$purpose->id}}"
                              <?php if ($purpose->id == $dms_form->id_purpose): ?>
                              <?php echo "selected" ?>
                              <?php endif ?>>{{$purpose->purpose}}</option>
                        @endforeach
                      </select>
                    </td>
                  </tr> 

                  <tr>
                    <td>
                        @if ($dms_form->id_purpose == 1)<?php echo "PUT" ?>
                        @else<?php echo "PLT" ?>
                        @endif
                        </td>
                    <td><input class="form-control" type="time" name="waiting_time" placeholder="Waiting Time" value="{{ $dms_form->waiting_time }}" style="width: 100%"></td>
                  </tr>


                  <tr>
                    <td>Nomor Gerbang</td>
                    <td><input class="form-control" type="text" name="gate_number" placeholder="Gate Number" value="{{ $dms_form->gate_number }}" style="width: 100%"></td>
                  </tr>
                
                  <tr>
                    <td></td>
                    <td><input class="btn btn-info" name="submit" value="submit" type="submit"></td>
                  </tr>
              </table>
              <input type="hidden" name="_method" value="PUT">
        </form>
      </div>
      
  </div>
@endsection

