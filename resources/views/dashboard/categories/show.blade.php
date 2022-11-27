@extends('layouts.dashboard')

@section('title', $category->name)

@section('breadcrumb')
@parent
<li class="breadcrumb-item active"><a href="{{ route('dashboard.categories.index') }}">Categories</a></li>
<li class="breadcrumb-item active">{{ $category->name }}</li>
@endsection

@section('content')

<!-- Component View -->
<x-alert type="success" />
<x-alert type="info" />
<!-- لو بدك تضيف شروط عليها  -->
@php
$products = $category->products()->with('store')->latest()->paginate(5);
@endphp
<div class="col-md-12">
    <div class="card">
        <div class="card-header">
            <div class="row">
                <div class="col-sm-9">
                    <h3 class="card-title">{{ $category->name }} Category</h3>
                </div>
                <div class="col-sm-3">
                    {{ $products->links() }}
                </div>
            </div>
        </div>
        <!-- /.card-header -->
        <div class="card-body p-0">
            <table class="table">
                <thead>
                    <tr>
                        <th style="width: 10px">#</th>
                        <th></th>
                        <th>Name</th>
                        <th>Store</th>
                        <th>Status</th>
                        <th>Created At</th>
                    </tr>
                </thead>
                <tbody>

                    @forelse( $products as $product)
                    <!-- هذه بدون اجراء اي تعديل -->
                    {{-- @forelse($category->products as $product) --}}
                    <tr>
                        <td>{{ $loop->iteration }}</td>
                        <td><img src="{{ asset('storage/uploads/' . $category->image) }}" alt="" height="40px" width="40px" style="border-radius: 100%;"></td>
                        <td>{{ $product->name }}</td>
                        <td>{{ $product->store->name }}</td>
                        <td>{{ $product->status }}</td>
                        <td>{{ $product->created_at }}</td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="5" style="text-align: center;">No categories defind.</td>
                    </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
        <!-- /.card-body -->
    </div>
    <!-- /.card -->
</div>
@endsection

@push('styles')
<!-- Ionicons -->
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
@endpush

@push('scripts')


@endpush