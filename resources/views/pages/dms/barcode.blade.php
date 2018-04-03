<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="{{ asset('css/bootstrap.min.css')}}"/>
<style>
hr {
    border: none;
    height: 1px;
    /* Set the hr color */
    color: #333; /* old IE */
    background-color: #333; /* Modern Browsers */
}
.logobarcode{
    margin-top: 10px;
}
</style>
</head>
<body>
  <div class="col-sm-2">
    <div class="logobarcode">
        <img src="{{ asset('image/logo.png')}}" alt="" style="width: 100%">
    </div>
    <div class="text-center">
        <h3><i style="width: 100%">Dock Management System</i></h3>
        <hr style="size: 20px;">
        {{$waktu}}
        
        <div style="margin-top: 10px">
        <table width="100%" class="text-center">
            <tr>
                <td width="50%">Plat: <br><strong>{{ $dms_form->plat_no }}</strong></td>
                <td  width="50%">Asal/Tujuan: <br><strong>{{ $dms_form->asal }}{{ $dms_form->tujuan }}</strong></td>
            </tr>
            <tr>
                <td width="50%">Project: <br><strong>{{ $dms_form->master_project_name }}</strong></td>
                <td  width="50%">Jenis: <br><strong>{{ $dms_form->purpose }}</strong></td>
            </tr>
        </table>
        <img style="margin-top: 10px" width="80%" src="data:image/png;base64,{!! DNS1D::getBarcodePNG($dms_form->id_dms_form, 'C39',1,55) !!}"/>
        <div style="letter-spacing: 0.6em"><strong>{{$dms_form->id_dms_form}}</strong></div>
        </div>
        <p style="margin-top: 10px"D>TIKET JANGAN SAMPAI HILANG</p>
      </div>
</body>
<script type="text/javascript" src="{{ asset('js/bootstrap.min.js')}}"></script>
</html>

