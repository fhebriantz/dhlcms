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
      <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#inbond" role="tab">INBOND </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#outbond" role="tab">OUTBOND</a>
      </li>
      @if (session()->get('session_id_group') == 1)
        <li>
        <a href="/dhlcms/public/dms/input" style=""><button type="button" class="btn btnadd" style="background-color: #999; color: white;">Tambah Data</button></a>
        </li>
      @elseif (session()->get('session_id_group') == 2)
        
      @elseif (session()->get('session_id_group') == 3)
        <li>
        <a href="/dhlcms/public/dms/input" style=""><button type="button" class="btn btnadd" style="background-color: #999; color: white;">Tambah Data</button></a>
        </li>
      @else
      @endif 
      <li class="nav-item navbar-right" style="float: right; cursor: pointer;">
        <a>{{session()->get('session_name')}} / {{session()->get('session_name_project')}}</a>
      </li>
      <li class="nav-item navbar-right" style="float: right; cursor: pointer;">
        <a data-fancybox data-src="#scan" href="javascript:;"><button class="btn btnadd" style="background-color: #999; color: white;">Scan</button></a>
            <div style="display: none;" id="scan">
              <form method="POST" action="/dhlcms/public/dms/input_id">
                {{ csrf_field() }}
                    
                    <table class="table table-striped fontinput">
                        <tr>
                          <td>DMS ID</td>
                          <td><input class="form-control" type="text" name="dms_id" id="dms_id" placeholder="DMS ID" style="width: 100%" autofocus=""></td>
                        </tr>
                      
                        <tr>
                          <td></td>
                          <td><input class="btn btn-info" name="submit" value="Submit" type="submit"></td>
                        </tr>
                    </table>
              </form>
            </div>
      </li>  
      <li class="nav-item navbar-right" style="float: right; cursor: pointer;">
        <a href="/dhlcms/public/dms/all_list"  target="_blank"><button class="btn btnadd" style="background-color: #999; color: white;">Layar Dasbor</button></a>
      </li>
@endsection
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
    <div class="tab-pane active" id="inbond" role="tabpanel">
      <div class="col-sm-12">
        <div class="row ujung">
          <div class="col-sm-12 paddinghead" style="background-color: #eee; font-size: 10px;">
            <h5 style="color: #d71635"><strong>Dashboard > Inbound</strong></h5>
             
          </div>  
        </div>
        <h2 class="titledashboard" style="color: #d71635">INBOUND</h2>
        
        @if (Session::has('id_dms'))
          <div class="alert alert-danger">{{ Session::get('id_dms') }}</div>
        @endif

      </div>

      <form method="POST" action="/dhlcms/public/dms/input_id">
                {{ csrf_field() }}
                    
                    <table class="table table-striped fontinput">
                      
                        <tr>
                          <td>DMS ID</td>
                          <td><input class="form-control" type="text" name="dms_id" id="dms_id" placeholder="DMS ID" style="width: 100%" autofocus=""></td>
                          <td><input class="btn btn-info" name="submit" value="Submit" type="submit" style="width: 100%"></td>
                        </tr>
                        
                    </table>
              </form>
      <table class="table-striped fontsizetable text-center" id="inbound_id"  width="100%" cellspacing="0">
        <thead class="thead paddingtable text-center" >
          <tr >
            <th class="width_no">NO</th>
            <th class="phone width_plat">PLAT NO</th>
            <th class="width_driver">NAMA SOPIR</th>
            <th class="cus width_tc">PERUSAHAAN TRANSPORTASI</th>
            <th class="width_duration phone">DURASI</th>
            <th class="width_status phone">PROGRES</th>
            <th class="width_status phone">SCAN TERAKHIR</th>
            <th class="width_plt phone ">PLT</th>
            <th class="width_gate phone ">GERBANG</th>
            <th class="width_vehicle ">KENDARAAN</th>
            @if (session()->get('session_id_group') == 1)
            <th class="cus width_cus" >NAMA PROYEK</th>
            @elseif (session()->get('session_id_group') == 2)
            @else
            <th class="cus width_cus" >NAMA PROYEK</th>
            @endif
            @if (session()->get('session_id_group') == 1)
            <th class="width_action actiontable phone" >TINDAKAN</th>
            @elseif (session()->get('session_id_group') == 2)
            <th class="width_action actiontable phone">TINDAKAN</th>
            @else
            @endif
            @if (session()->get('session_id_group') == 1)
            <th class="cus width_print">PRINT</th>
            @elseif (session()->get('session_id_group') == 2)
            @elseif (session()->get('session_id_group') == 3)
            <th class="cus width_print">PRINT</th>
            @else
            @endif
          </tr>
        </thead>

        <tbody class="paddingtable text-center">
           @foreach($dms_inbound as $inbound)
          <tr>    
            <td class="">{{ $no_inbound++ }}</td>
            <td class=" ">{{$inbound->plat_no}}</td>
            <td class="phone">{{$inbound->driver_name}}</td>
            <td class="cus ">{{$inbound->transporter_company}}</td>
            <td class="cus"><span id="{{$inbound->id_dms_form}}"></span></td>
            <td class="cus">{{$inbound->status_name}}</td>
            <td class="cus">{{$inbound->last_scan}}</span></td>
            <td class="phone ">
              <?php if ($inbound->waiting_time == ''): ?>
              <?php echo "-" ?>
              <?php else: ?>
              <?php echo "$inbound->waiting_time" ?>
              <?php endif ?></td>
            <td class="cus ">{{$inbound->gate_number}}</td>
            <td class="">{{$inbound->type_of_vehicle}}</td>
            @if (session()->get('session_id_group') == 1)
            <td class="cus ">{{$inbound->master_project_name}}</td>
            @elseif (session()->get('session_id_group') == 2)
            @else
            <td class="cus ">{{$inbound->master_project_name}}</td>
            @endif
            @if (session()->get('session_id_group') == 1)
            <td  class="cus ">
              <a href="/dhlcms/public/dms/{{ $inbound->id_dms_form }}/edit"><button type="button" class="action btn btn-danger"><img src="{{ asset('image/pencil.png')}}" alt="" style="width: 15px; height: auto;"></button></a>
                <form method="POST" action="/dhlcms/public/dms/{{ $inbound->id_dms_form}}/delete" class="text-center" style="float: right; margin-left: 2px;">
                  {{ csrf_field() }}
                  <button class="btn btn-danger action" type="submit" name="delete" value="D" onclick="return confirm('Are you sure want to delete name {{$inbound->driver_name}}?');" style="width: 20px; height: auto;"><img src="{{ asset('image/trash.png')}}" alt="" style="width: 15px; height: auto;"></button>
                  <input type="hidden" name="_method" value="DELETE">
                </form>
            </td>
            @elseif (session()->get('session_id_group') == 2)
            <td  class="cus ">
              <a href="/dhlcms/public/dms/{{ $inbound->id_dms_form }}/edit"><button type="button" class="action btn btn-danger"><img src="{{ asset('image/pencil.png')}}" alt="" style="width: 15px; height: auto;"></button></a>
                <form method="POST" action="/dhlcms/public/dms/{{ $inbound->id_dms_form}}/delete" class="text-center" style="float: right; margin-left: 2px;">
                  {{ csrf_field() }}
                  <button class="btn btn-danger action" type="submit" name="delete" value="D" onclick="return confirm('Are you sure want to delete name {{$inbound->driver_name}}?');" style="width: 20px; height: auto;"><img src="{{ asset('image/trash.png')}}" alt="" style="width: 15px; height: auto;"></button>
                  <input type="hidden" name="_method" value="DELETE">
                </form>
            </td>
            @else
            @endif
            @if (session()->get('session_id_group') == 1)
            <td class="cus "><a target="_blank" href="/dhlcms/public/dms/{{ $inbound->id_dms_form }}/barcode" class="btn btn-primary" style="padding: 0px 5px">Print</a></td>
            @elseif (session()->get('session_id_group') == 2)
            @elseif (session()->get('session_id_group') == 3)
            <td class="cus "><a target="_blank" href="/dhlcms/public/dms/{{ $inbound->id_dms_form }}/barcode"  class="btn btn-primary" style="padding: 0px 5px">Print</a></td>
            @else
            @endif
            
              <td>{{$inbound->id_location}}</td>
          </tr>

           <!-- DURATION ======================================================== DURATION -->
          <script>
            // Set the date we're counting down to
            //var countDownDate = new Date("Apr 3, 2018 16:0:0").getTime();
             //if ({{$inbound->duration}}==0||{{$inbound->duration}}==null) {}
               //else{
            var countupDate{{$inbound->id_dms_form}} = new Date("{{$inbound->duration}}").getTime();
            var exit{{$inbound->id_dms_form}} = new Date("{{$inbound->exit_time}}").getTime();

            if('{{$inbound->duration}}' == ''){}
            else
            {
            // Update the count down every 1 second
              var x = setInterval(function() 
              {
                // Get todays date and time
                var now = new Date().getTime();
                  // Find the distance between now an the count down date
                if('{{$inbound->status}}' == 6){
                  var distance = exit{{$inbound->id_dms_form}} - countupDate{{$inbound->id_dms_form}};
                }
                else
                {
                  var distance = now - countupDate{{$inbound->id_dms_form}}; 
                }
                  // Time calculations for days, hours, minutes and seconds
                  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
                  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                  var seconds = Math.floor((distance % (1000 * 60)) / 1000);
                  
                  // Output the result in an element with id="demo"
                  document.getElementById("{{$inbound->id_dms_form}}").innerHTML = hours + "h "
                  + minutes + "m " + seconds + "s ";

                  // If the count down is over, write some text 
                  if (distance < 0) {
                      clearInterval(x);
                      document.getElementById("{{$inbound->id_dms_form}}").innerHTML = "EXPIRED";
                  }

              }, 1000);
            }   
            // }

            </script>
            <!-- DURATION ======================================================== DURATION -->
           @endforeach
        </tbody>
      </table>
    </div>
    <div class="tab-pane" id="outbond" role="tabpanel">
      <div class="col-sm-12">
        <div class="row ujung">
          <div class="col-sm-12 paddinghead" style="background-color: #eee; font-size: 10px;">
            <h5 style="color: #d71635"><strong>Dashboard > Outbound</strong></h5>
          </div>  
        </div>
        <h2 class="titledashboard" style="color: #d71635">OUTBOUND</h2>
      </div>

      <table class="table-striped fontsizetable text-center"  width="100%" cellspacing="0" id="outbound_id">     
        <thead class="thead paddingtable text-center" >
          <tr >
            <th class="width_no">No</th>
            <th class="phone width_plat">PLAT NO</th>
            <th class="width_driver">NAMA SOPIR</th>
            <th class="cus width_tc">PERUSAHAAN TRANSPORTASI</th>
            <th class="width_duration ">DURASI</th>
            <th class="width_status">PROGRES</th>
            <th class="width_plt phone ">PLT</th>
            <th class="width_gate phone ">GERBANG</th>
            <th class="width_vehicle">KENDARAAN</th>
            @if (session()->get('session_id_group') == 1)
            <th class="cus width_cus" >NAMA PROYEK</th>
            @elseif (session()->get('session_id_group') == 2)
            @else
            <th class="cus width_cus" >NAMA PROYEK</th>
            @endif
            @if (session()->get('session_id_group') == 1)
            <th class="width_action actiontable" >TINDAKAN</th>
            @elseif (session()->get('session_id_group') == 2)
            <th class="width_action actiontable">TINDAKAN</th>
            @else
            @endif
            @if (session()->get('session_id_group') == 1)
            <th class="cus width_print">PRINT</th>
            @elseif (session()->get('session_id_group') == 2)
            @elseif (session()->get('session_id_group') == 3)
            <th class="cus width_print">PRINT</th>
            @else
            @endif
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
            <td class="">{{$outbound->status_name}}</td>
            <td class="phone ">
              <?php if ($outbound->waiting_time == ''): ?>
              <?php echo "-" ?>
              <?php else: ?>
              <?php echo "$outbound->waiting_time" ?>
              <?php endif ?>
            </td>
            <td class="cus ">{{$outbound->gate_number}}</td>
            <td class="">{{$outbound->type_of_vehicle}}</td>
            @if (session()->get('session_id_group') == 1)
            <td class="cus ">{{$outbound->master_project_name}}</td>
            @elseif (session()->get('session_id_group') == 2)
            @else
            <td class="cus ">{{$outbound->master_project_name}}</td>
            @endif
            @if (session()->get('session_id_group') == 1)
            <td >
              <a href="/dhlcms/public/dms/{{ $outbound->id_dms_form }}/edit"><button type="button" class="action btn btn-danger"><img src="{{ asset('image/pencil.png')}}" alt="" style="width: 15px; height: auto;"></button></a>
                <form method="POST" action="/dhlcms/public/dms/{{ $outbound->id_dms_form}}/delete" class="text-center" style="float: right; margin-left: 2px;">
                  {{ csrf_field() }}
                  <button class="btn btn-danger action" type="submit" name="delete" value="D" onclick="return confirm('Are you sure want to delete name {{$outbound->driver_name}}?');" style="width: 20px; height: auto;"><img src="{{ asset('image/trash.png')}}" alt="" style="width: 15px; height: auto;"></button></button> 
                  <input type="hidden" name="_method" value="DELETE">
                </form>
            </td>
            @elseif (session()->get('session_id_group') == 2)
            <td>
              <a href="/dhlcms/public/dms/{{ $outbound->id_dms_form }}/edit"><button type="button" class="action btn btn-danger"><img src="{{ asset('image/pencil.png')}}" alt="" style="width: 15px; height: auto;"></button></a>
                <form method="POST" action="/dhlcms/public/dms/{{ $outbound->id_dms_form}}/delete" class="text-center" style="float: right; margin-left: 2px;">
                  {{ csrf_field() }}
                  <button class="btn btn-danger action" type="submit" name="delete" value="D" onclick="return confirm('Are you sure want to delete name {{$outbound->driver_name}}?');" style="width: 20px; height: auto;"><img src="{{ asset('image/trash.png')}}" alt="" style="width: 15px; height: auto;"></button></button> 
                  <input type="hidden" name="_method" value="DELETE">
                </form>
            </td>
            @else
            @endif
            @if (session()->get('session_id_group') == 1)            
            <td class="cus"><a target="_blank" href="/dhlcms/public/dms/{{ $outbound->id_dms_form }}/barcode" class="btn btn-primary" style="padding: 0px 5px">Print</a></td>
            @elseif (session()->get('session_id_group') == 2)
            @elseif (session()->get('session_id_group') == 3)
            <td class="cus"><a target="_blank" href="/dhlcms/public/dms/{{ $outbound->id_dms_form }}/barcode" class="btn btn-primary" style="padding: 0px 5px">Print</a></td>
            @else
            @endif

              <td>{{$outbound->id_location}}</td>
          </tr>
           @endforeach
        </tbody>
      </table>
    </div>
      <div class="tab-pane" id="profile" role="tabpanel"><h1>user profile</h1></div>
      <div class="tab-pane" id="scan" role="tabpanel"><h1>scan</h1></div>
    </div>

@endsection
@section('script')
<script type="text/javascript">
$(document).ready( function () {
    $('#inbound_id').DataTable();
} );
</script>
<script type="text/javascript">
$(document).ready( function () {
    $('#outbound_id').DataTable();
} );
</script>
@endsection