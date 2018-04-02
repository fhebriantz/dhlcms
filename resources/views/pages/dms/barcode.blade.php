<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="{{ asset('css/bootstrap.min.css')}}"/>
</head>
<body>
  <div class="text-center">
        <h1>Scan Barcode</h1>
        <img src="data:image/png;base64,{!! DNS1D::getBarcodePNG($dms_form->id_dms_form, 'C39',1,55) !!}"/>
        <div style="letter-spacing: 0.6em"><strong>{{$dms_form->id_dms_form}}</strong></div>
        <strong>Tanggal</strong> : {{$tgl_cetak}} <br>
        <strong>Plat</strong>: {{ $dms_form->plat_no }} <br>
        <strong>Asal / Tujuan</strong>: {{ $dms_form->asal }}{{ $dms_form->tujuan }} <br>
        <strong>Cus. Project</strong>: {{ $dms_form->master_project_name }} <br>
        <strong>Jenis</strong>: {{ $dms_form->purpose }} <br>

      </div>
</body>
<script type="text/javascript" src="{{ asset('js/bootstrap.min.js')}}"></script>
</html>
