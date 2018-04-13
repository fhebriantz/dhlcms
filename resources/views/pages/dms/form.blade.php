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
      <li><a href="{{url('/dms/logout')}}" onclick="
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
          <form method="POST" action="{{url('/dms/input')}}">
              {{ csrf_field() }}
              <table class="table table-striped fontinput">

                  <tr>
                    <td>Nomor Mobil</td>
                    <td><input class="form-control" type="text" name="plat_no" id="plat_no" placeholder="Plat Nomor" style="width: 100%; text-transform: uppercase;" maxlength="9"></td>
                  </tr>

                  <tr>
                    <td>Nama Pengemudi</td>
                    <td><input class="form-control" type="text" name="driver_name" id="driver_name" placeholder="Nama Pengemudi" style="width: 100%" maxlength="13"></td>
                  </tr>

                  <tr>
                    <td>No. HP Pengemudi</td>
                    <td><input class="form-control" type="number" name="driver_phone" id="driver_phone" placeholder="08xxxxxxxxx" style="width: 100%" value="0"></td>
                  </tr>
                  
              
                  <tr>
                    <td>Tipe Kendaraan</td>
                    <td><select class="form-control" name="type_of_vehicle" style="width: 100%">
                      <option value="">-- Pilih Kategori --</option>
                      @foreach ($dms_master_vehicle as $vehicle)
                      <option value="{{ $vehicle->master_vehicle_name }}">{{ $vehicle->master_vehicle_name }}</option>
                      @endforeach
                    </select></td>
                  </tr>

                  <tr>
                    <td>Vendor</td>
                    <td><input class="form-control" type="text" name="transporter_company" id="transporter_company" placeholder="Perusahaan Transportasi" style="width: 100%"></td>
                  </tr>


                  <!-- <tr>
                    <td>Duration</td>
                    <td><input class="form-control" type="time" name="duration" id="duration " placeholder="Duration" style="width: 100%"></td>
                  </tr> -->

                  <tr>
                    <td>No PO/SO/DO/DN</td>
                    <td><input class="form-control" type="text" name="shipment" id="shipment" placeholder="No PO/SO/DO/DN" style="width: 100%"></td>
                  </tr>
                  <tr>
                    <td>Inbound/Outbound</td>
                    <td> <!-- select class form control untuk membuat combo box -->
                        <select class="form-control" name="id_purpose" style="width: 100%">
                            <option value="">-- Pilih Kategori --</option>
                            <option value="1">Inbound</option>
                            <option value="2">Outbound</option>
                        </select>
                    </td>
                  </tr>    
                  <tr>
                    <td>Asal (Inbound)</td>
                    <td><input class="form-control" type="text" name="asal" id="asal" placeholder="Asal (Inbound)" style="width: 100%"></td>
                  </tr>
                  <tr>
                    <td>Tujuan (Outbound)</td>
                    <td><input class="form-control" type="text" name="tujuan" id="tujuan" placeholder="Tujuan (Outbound)" style="width: 100%"></td>
                  </tr>
                  <tr>
                    <td>Nama Customer</td>                  
                    <td> <!-- select class form control untuk membuat combo box -->
                        <select class="form-control" name="cust_proj_name" style="width: 100%">
                          <option value="">-- Pilih Kategori --</option>
                          @foreach ($dms_master_project as $project)
                          <option value="{{ $project->id }}">{{ $project->master_project_name }}</option>
                          @endforeach
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
<!-- Autocomplete =============================== -->
  <script>
  $( function() {
    $( "#plat_no" ).autocomplete({
      source: '{{ url('plat_no') }}'
    });
  } );

  $( function() {
    $( "#driver_phone" ).autocomplete({
      source: '{{ url('driver_phone') }}'
    });
  } );

  $( function() {
    $( "#asal" ).autocomplete({
      source: '{{ url('asal') }}'
    });
  } );

  $( function() {
    $( "#tujuan" ).autocomplete({
      source: '{{ url('tujuan') }}'
    });
  } );

  $( function() {
    $( "#driver_name" ).autocomplete({
      source: '{{ url('driver_name') }}'
    });
  } );

  $( function() {
    $( "#transporter_company" ).autocomplete({
      source: '{{ url('transporter_company') }}'
    });
  } );
  </script>

<!-- No SPACE=============================== -->
  <script>
    $("input#plat_no").on({
      keydown: function(e) {
        if (e.which === 32)
          return false;
      },
      change: function() {
        this.value = this.value.replace(/\s/g, "");
      }
    });

    $("input#transporter_company").on({
      keydown: function(e) {
        if (e.which === 32)
          return false;
      },
      change: function() {
        this.value = this.value.replace(/\s/g, "");
      }
    });

    $("input#shipment").on({
      keydown: function(e) {
        if (e.which === 32)
          return false;
      },
      change: function() {
        this.value = this.value.replace(/\s/g, "");
      }
    });
  </script>

@endsection

