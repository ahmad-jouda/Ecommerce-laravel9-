@extends('layouts.dashboard')

@section('title', 'Create Admin')

@section('breadcrumb')
@parent
<li class="breadcrumb-item active">Admins</li>
@endsection

@section('content')

@if($errors->any())
<div class="col-md-12">
    <div class="card card-danger">
        <div class="card-header">
            <h3 class="card-title">Error Occured!</h3>

            <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i>
                </button>
            </div>
            <!-- /.card-tools -->
        </div>
        <!-- /.card-header -->
        <div class="card-body">
            <ul>
                @foreach($errors->all() as $error)
                <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
        <!-- /.card-body -->
    </div>
    <!-- /.card -->
</div>
<!-- /.col -->
@endif
<div class="col-md-12">
    <!-- general form elements -->
    <div class="card card-primary">
        <div class="card-header">
            <h3 class="card-title">ADD Admin</h3>
        </div>
        <!-- /.card-header -->
        <form action="{{ route('dashboard.admins.store') }}" method="post" enctype="multipart/form-data">
            @csrf

            @include('dashboard.admins._form')
        </form>
    </div>
    <!-- /.card -->
</div>
@endsection