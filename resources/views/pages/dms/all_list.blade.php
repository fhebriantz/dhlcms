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
    <div id="content-inbound">
      <div class="col-sm-12">
        @if (session()->get('session_id_group') == 1)
        <h2 class="titledashboard" style="color: #d71635">INBOUND</h2>
        @elseif (session()->get('session_id_group') == 2)
        <h2 class="titledashboard" style="color: #d71635">INBOUND / {{session()->get('session_name_project')}}</h2>
        @elseif (session()->get('session_id_group') == 3)
        <h2 class="titledashboard" style="color: #d71635">INBOUND</h2>
        @else
        @endif 
      </div>
      <table class="table-striped fontsizetable text-center" id="inbound_id"  width="100%" cellspacing="0">
        <thead class="thead paddingtable text-center" >
          <tr >
            <th class="" style="display:none;">ID DMS</th>
            <th class="" style="width: 1%">NO</th>
            <th class="phone " style="width: 12%">TRUCK NO. POL</th>
            <th class="" style="width: 13%">PENGEMUDI</th>
            <th class="cus " style="width: 12%">VENDOR</th>
            <th class="cus " style="width: 10%" >ASAL</th>
            <th class=" " style="width: 5%">STATUS</th>
            <th class="width_status phone">JAM STATUS</th>
            <th class="phone "  style="width: 8%">PUT</th>
            <th class="phone " style="width: 1%">GATE</th>
            <th class="" style="width: 10%">TIPE TRUK</th>
            <th class=" " style="width: 5%">TOTAL DURASI</th>
            <th class="cus " style="width: 14%" >CUSTOMER</th>
          </tr>
        </thead>

        <tbody class="paddingtable text-center" id="tbody_inbound">
           @foreach($dms_inbound as $inbound)
          <tr >    
            <td class="idCell" style="display:none;" >{{$inbound->id_dms_form}}</td>
            <td class="">{{ $no_inbound++ }}</td>
            <td class="phone plateCell">{{$inbound->plat_no}}</td>
            <td class="driverCell">{{$inbound->driver_name}}</td>
            <td class="cus transporterCell">{{$inbound->transporter_company}}</td>
            <td class="cus asalCell">{{$inbound->asal}}</td>
            <td class="statusCell">{{$inbound->status_name}}</td>
            <td class="scanCell">{{$inbound->last_scan}}</td>
            <td class="phone putCell">
              <?php if ($inbound->waiting_time == ''): ?>
              <?php echo "-" ?>
              <?php else: ?>
              <?php echo "$inbound->waiting_time" ?>
              <?php endif ?></td>
            <td class="cus gateCell">{{$inbound->gate_number}}</td>
            <td class="vehicleCell">{{$inbound->type_of_vehicle}}</td>
            <td class="durationCell"><span id="{{$inbound->id_dms_form}}"></td>
            <td class="cus projectCell">{{$inbound->master_project_name}}</td>
          </tr>

          <!-- DURATION ======================================================== DURATION -->
          <div style="display:none">
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
                    + minutes + "m " + seconds + "s";

                    // If the count down is over, write some text 
                    if (distance < 0) {
                        clearInterval(x);
                        document.getElementById("{{$inbound->id_dms_form}}").innerHTML = "EXPIRED";
                    }

                }, 1000);
              }   
              // }

              </script>
            </div>
            <!-- DURATION ======================================================== DURATION -->
           @endforeach
        </tbody>
      </table><div class="text-center"></div>
    </div>
    <div id="content-outbound">
      <div class="col-sm-12">
        <div class="row ujung">
          
        </div>
        @if (session()->get('session_id_group') == 1)
        <h2 class="titledashboard" style="color: #d71635">OUTBOUND</h2>
        @elseif (session()->get('session_id_group') == 2)
        <h2 class="titledashboard" style="color: #d71635">OUTBOUND / {{session()->get('session_name_project')}}</h2>
        @elseif (session()->get('session_id_group') == 3)
        <h2 class="titledashboard" style="color: #d71635">OUTBOUND</h2>
        @else
        @endif 

      </div>
      <table class="table-striped fontsizetable text-center"  width="100%" cellspacing="0" id="outbound_id">     
        <thead class="thead paddingtable text-center">
          <tr >
            <th class="" style="display:none;">ID DMS</th>
            <th class="" style="width: 1%">NO</th>
            <th class="phone " style="width: 12%">TRUCK NO. POL</th>
            <th class="" style="width: 13%">PENGEMUDI</th>
            <th class="cus " style="width: 12%">VENDOR</th>
            <th class="cus " style="width: 10%" >TUJUAN</th>
            <th class=" " style="width: 5%">STATUS</th>
            <th class="width_status phone">JAM STATUS</th>
            <th class="phone "  style="width: 8%">PLT</th>
            <th class="phone " style="width: 1%">GATE</th>
            <th class="" style="width: 10%">TIPE TRUK</th>
            <th class=" " style="width: 5%">TOTAL DURASI</th>
            <th class="cus " style="width: 14%" >CUSTOMER</th>
          </tr>
        </thead>

        <tbody class="paddingtable" id="tbody_outbound">
          @foreach($dms_outbound as $outbound)
          <tr>    
            <td class="idCellO" style="display:none;" >{{$outbound->id_dms_form}}</td>
            <td class="">{{ $no_outbound++ }}</td>
            <td class="phone plateCellO">{{$outbound->plat_no}}</td>
            <td class="driverCellO">{{$outbound->driver_name}}</td>
            <td class="cus transporterCellO">{{$outbound->transporter_company}}</td>
            <td class="cus tujuanCellO">{{$outbound->tujuan}}</td>
            <td class="statusCellO">{{$outbound->status_name}}</td>
            <td class="scanCellO">{{$outbound->last_scan}}</td>
            <td class="phone pltCellO">
              <?php if ($outbound->waiting_time == ''): ?>
              <?php echo "-" ?>
              <?php else: ?>
              <?php echo "$outbound->waiting_time" ?>
              <?php endif ?>
            </td>
            <td class="cus gateCellO">{{$outbound->gate_number}}</td>
            <td class="vehicleCellO">{{$outbound->type_of_vehicle}}</td>
            <td class="durationCellO"><span id="{{$outbound->id_dms_form}}"></td>
            <td class="cus projectCellO">{{$outbound->master_project_name}}</td>
          </tr>

          <!-- DURATION ======================================================== DURATION -->
            <div style="display: none">
              <script>
              // Set the date we're counting down to
              //var countDownDate = new Date("Apr 3, 2018 16:0:0").getTime();
               //if ({{$outbound->duration}}==0||{{$outbound->duration}}==null) {}
                 //else{
              var countupDate{{$outbound->id_dms_form}} = new Date("{{$outbound->duration}}").getTime();
              var exit{{$outbound->id_dms_form}} = new Date("{{$outbound->exit_time}}").getTime();

              if('{{$outbound->duration}}' == ''){}
              else
              {
              // Update the count down every 1 second
                var x = setInterval(function() 
                {
                  // Get todays date and time
                  var now = new Date().getTime();
                    // Find the distance between now an the count down date
                  if('{{$outbound->status}}' == 6){
                    var distance = exit{{$outbound->id_dms_form}} - countupDate{{$outbound->id_dms_form}};
                  }
                  else
                  {
                    var distance = now - countupDate{{$outbound->id_dms_form}}; 
                  }
                    // Time calculations for days, hours, minutes and seconds
                    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
                    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
                    
                    // Output the result in an element with id="demo"
                    document.getElementById("{{$outbound->id_dms_form}}").innerHTML = hours + "h "
                    + minutes + "m " + seconds + "s";

                    // If the count down is over, write some text 
                    if (distance < 0) {
                        clearInterval(x);
                        document.getElementById("{{$outbound->id_dms_form}}").innerHTML = "EXPIRED";
                    }

                }, 1000);
              }   
              // }

              </script>
          </div>
            <!-- DURATION ======================================================== DURATION -->
           @endforeach
        </tbody>
      </table><div class="text-center"></div>
    </div>
      <div class="tab-pane" id="profile" role="tabpanel"><h1>user profile</h1></div>
      <div class="tab-pane" id="scan" role="tabpanel"><h1>scan</h1></div>
    </div>
@endsection

@section('script')
  <script src="{{ asset('js/paging.js')}}"></script>
  <script>
    $(document).ready(function(){   
        startRefresh(); 


        var limit = 5;
        $('table#inbound_id').paging({limit: limit});
        $('table#outbound_id').paging({limit: limit});


        window.setInterval(function(){ 
            $.ajax({
              type : "GET",
              url : "{{url("test")}}",
              dataType : "json",                  
              success:function(msg){ 
                  var inbound = msg[0].inbound;
                  var outbound = msg[0].outbound;
                  var count_inbound = inbound.length;
                  var count_outbound = outbound.length;

                  var page = Math.ceil(count_inbound/limit);//Math.floor(count_inbound/limit); 
                  //if($('#content-inbound a.selected-page').data('page')==page) $('#content-inbound a[data-page=0]').click(); //Click button page=1
                  if($('#content-inbound a.selected-page').html()==page) $('#content-inbound a[data-page=0]').click();
                  else $('#content-inbound a[data-direction=1]').click(); //Click button 'next page'

                  var pageO = Math.ceil(count_outbound/limit); //Math.floor(count_outbound/limit); 
                  //if($('#content-outbound a.selected-page').data('page')==page) $('#content-outbound a[data-page=0]').click(); //Click button page=1
                  if($('#content-outbound a.selected-page').html()==pageO) $('#content-outbound a[data-page=0]').click(); //Click button page=1
                  else $('#content-outbound a[data-direction=1]').click(); //Click button 'next page'
              },
              error:function(msg){
                  console.log("failed"); 
              }
            });
        }, 10000);
    }); 
      
    
      function startRefresh() { 
        setTimeout(startRefresh,1000);

        $.ajax({
            type : "GET",
            url : "{{url("test")}}",
            dataType : "json",                  
            success:function(msg){ 
                var inbound = msg[0].inbound;
                var outbound = msg[0].outbound;
                var count_inbound = inbound.length;
                var count_outbound = outbound.length;
                //var dlt = document.getElementById("tbody_inbound");
             
              
                for(i=0;i<count_inbound;i++)
                {  
                  //dlt.parentNode.removeChild(dlt);
                  //$("#tbody_inbound").removeChild("#tbody_inbound");
                  //console.log(msg[0].inbound[i]);
                  
                  /*$("#tbody_inbound").append("<tr>");
                  $("#tbody_inbound").append("<td>"+[i]+"</td>");
                  $("#tbody_inbound").append("<td>"+msg[0].inbound[i].plat_no+"</td>");
                  $("#tbody_inbound").append("<td>"+msg[0].inbound[i].driver_name+"</td>");
                  $("#tbody_inbound").append("<td>"+msg[0].inbound[i].transporter_company+"</td>");
                  $("#tbody_inbound").append("<td>"+msg[0].inbound[i].duration+"</td>");
                  $("#tbody_inbound").append("<td>"+msg[0].inbound[i].status_name+"</td>");
                  $("#tbody_inbound").append("<td>"+msg[0].inbound[i].waiting_time+"</td>");
                  $("#tbody_inbound").append("<td>"+msg[0].inbound[i].asal+"</td>");
                  $("#tbody_inbound").append("<td>"+msg[0].inbound[i].gate_number+"</td>");
                  $("#tbody_inbound").append("<td>"+msg[0].inbound[i].type_of_vehicle+"</td>");
                  $("#tbody_inbound").append("<td>"+msg[0].inbound[i].master_project_name+"</td>");
                  $("#tbody_inbound").append("</tr>");*/
            

                  $('#tbody_inbound tr').each(function() { 
                      var iddms = $(this).find(".idCell").html(); 
                      var in_waiting = '-';  

                      if(iddms==msg[0].inbound[i].id_dms_form)  
                      { 
                        if(msg[0].inbound[i].waiting_time!='') in_waiting = msg[0].inbound[i].waiting_time;
                        $(this).find("td.driverCell").html(msg[0].inbound[i].driver_name);
                        $(this).find("td.transporterCell").html(msg[0].inbound[i].transporter_company);
                        //$(this).find("td.durationCell").html(msg[0].inbound[i].duration);
                        //$(this).find("span#"+iddms).html(msg[0].inbound[i].duration);
                        $(this).find("td.statusCell").html(msg[0].inbound[i].status_name);
                        $(this).find("td.scanCell").html(msg[0].inbound[i].last_scan);
                        $(this).find("td.putCell").html(in_waiting);
                        $(this).find("td.asalCell").html(msg[0].inbound[i].asal);
                        $(this).find("td.vehicleCell").html(msg[0].inbound[i].type_of_vehicle);
                        $(this).find("td.projectCell").html(msg[0].inbound[i].master_project_name);
                      }  
                  });

                  //Script: Inbound-duration
                  var i_idDms = msg[0].inbound[i].id_dms_form;
                  var i_duration = msg[0].inbound[i].duration;
                  var i_exitTime = msg[0].inbound[i].exit_time;
                  var i_status = msg[0].inbound[i].status;

                  var i_countupDate = new Date(i_duration).getTime();
                  var i_exit = new Date(i_exitTime).getTime();

                    if(i_duration == ''){}
                    else
                    {
                      // Update the count down every 1 second
                      var x = setInterval(function() 
                      {
                          // Get todays date and time
                          var now = new Date().getTime();
                          // Find the distance between now an the count down date
                          if(i_status == 6){
                            var distance = i_exit - i_countupDate;
                          }
                          else
                          {
                            var distance = now - i_countupDate; 
                          }
                          // Time calculations for days, hours, minutes and seconds
                          var days = Math.floor(distance / (1000 * 60 * 60 * 24));
                          var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                          var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                          var seconds = Math.floor((distance % (1000 * 60)) / 1000);
                          
                          // Output the result in an element with id="demo"
                          $(this).find("#tbody_inbound span#"+i_idDms).html(hours + "h " + minutes + "m " + seconds + "s");
                          //document.getElementById('"'+i_idDms+'"').innerHTML = hours + "h " + minutes + "m " + seconds + "s";

                          // If the count down is over, write some text 
                          if (distance < 0) {
                              clearInterval(x);
                              $(this).find("#tbody_inbound span#"+i_idDms).html("EXPIRED");
                            //document.getElementById("{{$inbound->id_dms_form}}").innerHTML = "EXPIRED";
                          }

                      }, 1000);
                    }
                }

                  


                //table outbound
                for(i=0;i<=count_outbound;i++)
                {
                  //console.log(msg[0].outbound[i].master_project_name);
                  /*$("#tbody_outbound").append("<tr>");
                  $("#tbody_outbound").append("<td>"+[i]+"</td>");
                  $("#tbody_outbound").append("<td>"+msg[0].outbound[i].plat_no+"</td>");
                  $("#tbody_outbound").append("<td>"+msg[0].outbound[i].driver_name+"</td>");
                  $("#tbody_outbound").append("<td>"+msg[0].outbound[i].driver_name+"</td>");
                  $("#tbody_outbound").append("<td>"+msg[0].outbound[i].transporter_company+"</td>");
                  $("#tbody_outbound").append("<td>"+msg[0].outbound[i].status_name+"</td>");
                  $("#tbody_outbound").append("<td>"+msg[0].outbound[i].waiting_time+"</td>");
                  $("#tbody_outbound").append("<td>"+msg[0].outbound[i].asal+"</td>");
                  $("#tbody_outbound").append("<td>"+msg[0].outbound[i].gate_number+"</td>");
                  $("#tbody_outbound").append("<td>"+msg[0].outbound[i].type_of_vehicle+"</td>");
                  $("#tbody_outbound").append("<td>"+msg[0].outbound[i].master_project_name+"</td>");
                  $("#tbody_outbound").append("</tr>");*/

                  $('#tbody_outbound tr').each(function() { 
                      var iddmsO = $(this).find(".idCellO").html(); 
                      var in_waitingO = '-'; 

                      if(iddmsO==msg[0].outbound[i].id_dms_form)  
                      { 
                        if(msg[0].outbound[i].waiting_time!='') in_waiting = msg[0].outbound[i].waiting_time;
                        $(this).find("td.driverCellO").html(msg[0].outbound[i].driver_name);
                        $(this).find("td.transporterCellO").html(msg[0].outbound[i].transporter_company);
                        //$(this).find("td.durationCell").html(msg[0].outbound[i].duration);
                        //$(this).find("span#"+iddms).html(msg[0].outbound[i].duration);
                        $(this).find("td.statusCellO").html(msg[0].outbound[i].status_name);
                        $(this).find("td.scanCellO").html(msg[0].outbound[i].last_scan);
                        $(this).find("td.pltCellO").html(in_waitingO);
                        $(this).find("td.tujuanCellO").html(msg[0].outbound[i].tujuan);
                        $(this).find("td.vehicleCellO").html(msg[0].outbound[i].type_of_vehicle);
                        $(this).find("td.projectCellO").html(msg[0].outbound[i].master_project_name);
                      }  

                  });


                  //Script: Outbound-duration
                  var countupDate{{$outbound->id_dms_form}} = new Date("{{$outbound->duration}}").getTime();
                  var exit{{$outbound->id_dms_form}} = new Date("{{$outbound->exit_time}}").getTime();

                  var o_idDms = msg[0].outbound[i].id_dms_form;
                  var o_duration = msg[0].outbound[i].duration;
                  var o_exitTime = msg[0].outbound[i].exit_time;
                  var o_status = msg[0].outbound[i].status;

                  var o_countupDate = new Date(o_duration).getTime();
                  var o_exit = new Date(o_exitTime).getTime();

                    if(o_duration == ''){}
                  else
                  {
                    // Update the count down every 1 second
                      var x = setInterval(function() 
                      {
                        // Get todays date and time
                        var now = new Date().getTime();
                          // Find the distance between now an the count down date
                        if(o_status == 6){
                          var distance = o_exit - o_countupDate;
                        }
                        else
                        {
                          var distance = now - o_countupDate; 
                        }
                         
                        // Time calculations for days, hours, minutes and seconds
                        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
                        var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                        var seconds = Math.floor((distance % (1000 * 60)) / 1000);
                          
                        // Output the result in an element with id="demo"
                        $(this).find("#tbody_outbound span#"+o_idDms).html(hours + "h " + minutes + "m " + seconds + "s");
                        //document.getElementById("{{$outbound->id_dms_form}}").innerHTML = hours + "h " + minutes + "m " + seconds + "s";

                        // If the count down is over, write some text 
                        if (distance < 0) {
                            clearInterval(x);
                            $(this).find("#tbody_outbound span#"+o_idDms).html("EXPIRED");
                            //document.getElementById("{{$outbound->id_dms_form}}").innerHTML = "EXPIRED";
                        }

                      }, 1000);
                  }   
                }

            },
            error:function(msg){
              console.log("failed"); 
          }
        }); 
      }
  </script> 
@endsection