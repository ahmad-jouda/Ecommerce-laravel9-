@extends('layouts.dashboard')

@section('title', 'Products')

@section('breadcrumb')
@parent
<li class="breadcrumb-item active">Products</li>
@endsection

@section('content')

<!-- Component View -->
<x-alert type="success" />
<x-alert type="info" />

<div class="col-md-12">
    <div class="card">
        <div class="card-header">
            <div class="row">
                <div class="col-sm-3">
                    <a href=" {{route('dashboard.products.create')}}" class="btn btn-sm btn-outline-primary mr-2">Create</a>
                </div>
                <div class="col-sm-9">
                    <!-- القيمة القديمة يتم تخزينها فقط في حالة post  -->
                    <!-- في حالة get لا يتم عملية التخزين -->
                    <form action="{{ URL::current() }}" method="get" class="d-flex justify-content-between  float-center">
                        <x-form.input name="name" placeholder="Name" class="mx-2" :value="request('name')" />
                        <select name="status" class="form-control mx-2">
                            <option value="">All</option>
                            <option value="active" @selected(request('status')=='active' )>Active</option>
                            <option value="archived" @selected(request('status')=='archived' )>Archived</option>
                            <option value="draft" @selected(request('status')=='draft' )>Draft</option>
                        </select>
                        <button class="btn btn-dark mx-2">Filter</button>
                    </form>
                </div>

            </div>
            <div class="row">
                    <div class="card-tools mt-2">
                        <!-- نفس الشيء ولكن الي تحت احدث -->
                        {{-- {{ $products->appends(request()->all())->links() }} --}}
                        <!-- custom pagination -->
                        {{-- {{ $products->withQueryString()->links('pagination.custom') }} --}}

                        {{ $products->withQueryString()->links() }}
                        <!-- <ul class="pagination pagination-sm float-right">
                            <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                        </ul> -->
                    </div>
            </div>
        </div>
        <!-- /.card-header -->
        <div class="card-body p-0">
            <table class="table">
                <thead>
                    <tr>
                        <th style="width: 10px">#</th>
                        <th>Image</th>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Category</th>
                        <th>Store</th>
                        <th>Status</th>
                        <th>Created At</th>
                        <th colspan="2">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($products as $product)
                    <tr>
                        <td>{{ $loop->iteration }}</td>
                        <td><img src="{{ $product->image_url }}" alt="" height="40px" width="40px" style="border-radius: 100%;"></td>
                        <td>{{ $product->id }}</td>
                        <td>{{ $product->name }}</td>
                        <!-- SELECT * FROM categories WHERE id = $product->category_id -->
                        <td>{{ $product->category->name }}</td>
                        <!-- SELECT * FROM stores WHERE id = $product->store_id -->
                        <td>{{ $product->store->name }}</td>
                        <td>{{ $product->status }}</td>
                        <td>{{ $product->created_at }}</td>
                        <td>
                            <a href="{{route('dashboard.products.edit', [$product->id])}}" class="btn btn-sm btn-outline-success">Edit</a>
                        </td>
                        <td>
                            <form action="{{route('dashboard.products.destroy', [$product->id])}}" method="post">
                                @csrf
                                <!-- Form Method Spoofing -->
                                <!-- <input type="hidden" name="_method" value="delete"> -->
                                @method('delete')
                                <button type="submit" class="btn btn-sm btn-outline-danger">Delete</button>
                            </form>
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="8" style="text-align: center;">No products defind.</td>
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