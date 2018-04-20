@extends('layouts.dms')
@section('content')
@foreach($dms_form as $autofill)
<ul>
	<li>{{$autofill->id_dms_form}}</li>
</ul>
@endforeach
@endsection