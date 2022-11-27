@extends('layouts.dashboard')

@section('title', 'Edit User')

@section('breadcrumb')
@parent
<li class="breadcrumb-item active">Users</li>
<li class="breadcrumb-item active">Edit User</li>
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
            <h3 class="card-title">Edit User</h3>
        </div>
        <!-- /.card-header -->
        <form action="{{ route('dashboard.users.update', $user->id) }}" method="post" enctype="multipart/form-data">
            @csrf
            @method('put')

            @include('dashboard.users._form', [
            'button_label' => 'Update'
            ])
        </form>
    </div>
    <!-- /.card -->
</div>
@endsection