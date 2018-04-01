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
      
      <li class="nav-item navbar-right" style="float: right; cursor: pointer;">
        <a>{{session()->get('session_name')}} / {{session()->get('session_name_project')}}</a>
      </li>
      
@endsection
@section('content')

    <div class="tab-pane active">
      <div class="col-sm-12">
        <div class="row ujung">
          <div class="col-sm-12 paddinghead" style="background-color: #eee">
            <h5 style="color: #d71635"><strong>DMS Data Form</strong></h5>
          </div>  
        </div>
        <h3 style="color: #d71635;" class="titledashboard">Add DMS Data</h3>
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
          <form method="POST" action="/dhlcms/public/dms/input">
              {{ csrf_field() }}
              <table class="table table-striped fontinput">

                  <tr>
                    <td>Vehicle Plate</td>
                    <td><input class="form-control" type="text" name="plat_no" id="plat_no" placeholder="Vehicle Plate" style="width: 100%"></td>
                  </tr>

                  <tr>
                    <td>Drivers Name</td>
                    <td><input class="form-control" type="text" name="driver_name" id="driver_name " placeholder="Driver Name" style="width: 100%" autocomplete="off"></td>
                  </tr>

                  <tr>
                    <td>Drivers Phone</td>
                    <td><input class="form-control" type="text" name="driver_phone" id="driver_phone" placeholder="Driver Phone" style="width: 100%"></td>
                  </tr>
                  
              
                  <tr>
                    <td>Type of Vehicle</td>
                    <td><select class="form-control" name="type_of_vehicle" style="width: 100%">
                      <option value="">-- Select Category --</option>
                      @foreach ($dms_master_vehicle as $vehicle)
                      <option value="{{ $vehicle->master_vehicle_name }}">{{ $vehicle->master_vehicle_name }}</option>
                      @endforeach
                    </select></td>
                  </tr>

                  
                  <tr>
                    <td>Transporter Company</td>
                    <td><select class="form-control" name="transporter_company" style="width: 100%">
                      <option value="">-- Select Category --</option>
                      @foreach ($dms_master_tc as $tc)
                      <option value="{{ $tc->master_tc_name }}">{{ $tc->master_tc_name }}</option>
                      @endforeach
                    </select></td>
                  </tr>

                  <!-- <tr>
                    <td>Duration</td>
                    <td><input class="form-control" type="time" name="duration" id="duration " placeholder="Duration" style="width: 100%"></td>
                  </tr> -->

                  <tr>
                    <td>Shipment</td>
                    <td><input class="form-control" type="text" name="shipment" id="shipment " placeholder="Shipment/PO/SO/DO" style="width: 100%"></td>
                  </tr>
                  <tr>
                    <td>Asal</td>
                    <td><input class="form-control" type="text" name="asal" id="asal " placeholder="Asal" style="width: 100%"></td>
                  </tr>
                  <tr>
                    <td>Tujuan</td>
                    <td><input class="form-control" type="text" name="tujuan" id="tujuan " placeholder="Tujuan" style="width: 100%"></td>
                  </tr>
                  <tr>
                    <td>Customer/Project Name</td>                  
                    <td> <!-- select class form control untuk membuat combo box -->
                        <select class="form-control" name="cust_proj_name" style="width: 100%">
                          <option value="">-- Select Category --</option>
                          @foreach ($dms_master_project as $project)
                          <option value="{{ $project->id }}">{{ $project->master_project_name }}</option>
                          @endforeach
                        </select>
                    </td>
                  </tr>
                  <tr>
                    <td>Purpose</td>
                    <td> <!-- select class form control untuk membuat combo box -->
                        <select class="form-control" name="id_purpose" style="width: 100%">
                            <option value="">-- Select Category --</option>
                            <option value="1">Inbound</option>
                            <option value="2">Outbound</option>
                        </select>
                    </td>
                  </tr>    
                
                  <tr>
                    <td></td>
                    <td><input class="btn btn-info" name="submit" value="Submit and Print" type="submit"></td>
                  </tr>
              </table>
        </form>
      </div>
      
  </div>
@endsection

@section('script')

  <script>
  $( function() {
    $( "#plat_no" ).autocomplete({
      source: '{{ asset('plat_no') }}'
    });
  } );
  </script>
  
  <script>
  $( function() {
    $( "#driver_phone" ).autocomplete({
      source: '{{ asset('driver_phone') }}'
    });
  } );
  </script>

@endsection

