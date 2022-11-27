@extends('layouts.dashboard')

@section('title', 'Categories')

@section('breadcrumb')
@parent
<li class="breadcrumb-item active">Categories</li>
@endsection

@section('content')

<!-- Component View -->
<x-alert type="success" />
<x-alert type="info" />

<div class="col-xs-12">
    <div class="card">
        <div class="card-header">
            <div class="row">
                <div class="col-sm-3">
                    @if(Auth::user()->can('categories.create'))
                    <a href=" {{route('dashboard.categories.create')}}" class="btn btn-sm btn-outline-primary mr-2">Create</a>
                    @endif
                    <a href=" {{route('dashboard.categories.trash')}}" class="btn btn-sm btn-outline-dark">Trash</a>
                </div>
                <div class="col-sm-6">
                    <!-- القيمة القديمة يتم تخزينها فقط في حالة post  -->
                    <!-- في حالة get لا يتم عملية التخزين -->
                    <form action="{{ URL::current() }}" method="get" class="d-flex justify-content-between  float-center">
                        <x-form.input name="name" placeholder="Name" class="mx-2" :value="request('name')" />
                        <select name="status" class="form-control mx-2">
                            <option value="">All</option>
                            <option value="active" @selected(request('status')=='active' )>Active</option>
                            <option value="archived" @selected(request('status')=='archived' )>Archived</option>
                        </select>
                        <button class="btn btn-dark mx-2">Filter</button>
                    </form>
                </div>
                <div class="col-sm-3">
                    <div class="card-tools">
                        <!-- نفس الشيء ولكن الي تحت احدث -->
                        {{-- {{ $categories->appends(request()->all())->links() }} --}}
                        <!-- custom pagination -->
                        {{-- {{ $categories->withQueryString()->links('pagination.custom') }} --}}

                        {{ $categories->withQueryString()->links() }}
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
                        <th>Parent</th>
                        <th>Products #</th>
                        <th>Status</th>
                        <th>Created At</th>
                        <th colspan="2">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($categories as $category)
                    <tr>
                        <td>{{ $loop->iteration }}</td>
                        <td><img src="{{ asset('storage/uploads/' . $category->image) }}" alt="" height="40px" width="40px" style="border-radius: 100%;"></td>
                        <td>{{ $category->id }}</td>
                        <td><a href="{{route('dashboard.categories.show', [$category->id])}}">{{ $category->name }}</a></td>
                        <!-- <td>{{ $category->parent? $category->parent->name : 'Main Category'}}</td> هذه نستخدمها بدون withDefult in model -->
                        <!-- <td>{{ $category->parent_name }}</td> نستخدمها في join -->
                        <td>{{ $category->parent->name }}</td>
                        <!-- <td>{{ $category->products_count }}</td> -->
                        <td>{{ $category->products_number }}</td>
                        <td>{{ $category->status }}</td>
                        <td>{{ $category->created_at }}</td>
                        <td>
                            @can('categories.update')
                            <a href="{{route('dashboard.categories.edit', [$category->id])}}" class="btn btn-sm btn-outline-success">Edit</a>
                            @endcan
                        </td>
                        <td>
                            @can('categories.delete')
                            <form action="{{route('dashboard.categories.destroy', [$category->id])}}" method="post">
                                @csrf
                                <!-- Form Method Spoofing -->
                                <!-- <input type="hidden" name="_method" value="delete"> -->
                                @method('delete')
                                <button type="submit" class="btn btn-sm btn-outline-danger">Delete</button>
                            </form>
                            @endcan
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="9" style="text-align: center;">No categories defind.</td>
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