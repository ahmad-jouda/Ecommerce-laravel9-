@extends('layouts.dashboard')

@section('title', 'Edit Product')

@section('breadcrumb')
@parent
<li class="breadcrumb-item active"><a href="{{ route('dashboard.products.index') }}">Products</a></li>
<li class="breadcrumb-item active">Edit Product</li>
@endsection

@section('content')

@if($errors->any())
<div class="col-md-12">
    <div class="card card-danger">
        <div class="card-header">
            <h3 class="card-title">Error Occurred!</h3>

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
            <h3 class="card-title">Edit Product</h3>
        </div>
        <!-- /.card-header -->
        <!-- form start -->
        <form action="{{ route('dashboard.products.update', $product->id) }}" method="post" enctype="multipart/form-data">
            @csrf
            @method('put')

            @include('dashboard.products._form', [
            'button_form' => 'Update'
            ])
        </form>
    </div>
    <!-- /.card -->
</div>
@endsection