@extends('layouts.dashboard')

@section('title', 'Trashed Categories')

@section('breadcrumb')
@parent
<li class="breadcrumb-item"><a href="{{ route('dashboard.categories.index') }}">Categories</a></li>
<li class="breadcrumb-item active">Trash</li>
@endsection

@section('content')

<!-- Component View -->
<x-alert type="success" />
<x-alert type="info" />

<div class="col-md-12">
    <div class="card">
        <div class="card-header">
            <div class="row">
                <div class="col-sm-1">
                    <a href=" {{route('dashboard.categories.index')}}" class="btn btn-sm btn-outline-primary">Back</a>
                </div>
                <div class="col-sm-8">
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
                        <th>Status</th>
                        <th>Deleted At</th>
                        <th colspan="2">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($categories as $category)
                    <tr>
                        <td>{{ $loop->iteration }}</td>
                        <td><img src="{{ asset('storage/uploads/' . $category->image) }}" alt="" height="40px" width="40px" style="border-radius: 100%;"></td>
                        <td>{{ $category->id }}</td>
                        <td>{{ $category->name }}</td>
                        <td>{{ $category->status }}</td>
                        <td>{{ $category->deleted_at }}</td>
                        <td>
                            <form action="{{route('dashboard.categories.restore', $category->id)}}" method="post">
                                @csrf
                                @method('put')
                                <button type="submit" class="btn btn-sm btn-outline-info">Restore</button>
                            </form>
                        </td>
                        <td>
                            <form action="{{route('dashboard.categories.force-delete', $category->id)}}" method="post">
                                @csrf
                                @method('delete')
                                <button type="submit" class="btn btn-sm btn-outline-danger">Delete</button>
                            </form>
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="7" style="text-align: center;">No categories defind.</td>
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