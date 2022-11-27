@extends('layouts.dashboard')

@section('title', 'Roles')

@section('breadcrumb')
@parent
<li class="breadcrumb-item active">Roles</li>
@endsection

@section('content')

<x-alert type="success" />
<x-alert type="info" />
<div class="col-md-12">
    <div class="card">
        <div class="card-header">
            <div class="row">
                <div class="col-sm-3">
                    @can('create', 'App\Models\Role')
                    <a href="{{ route('dashboard.roles.create') }}" class="btn btn-sm btn-outline-primary mr-2">Create</a>
                    @endcan
                </div>
            </div>
            <div class="row">
                <div class="card-tools mt-2">
                    {{ $roles->withQueryString()->links() }}
                </div>
            </div>
        </div>
        <!-- /.card-header -->
        <div class="card-body p-0">
            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Created At</th>
                        <th colspan="2"></th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($roles as $role)
                    <tr>
                        <td>{{ $role->id }}</td>
                        <td><a href="{{ route('dashboard.roles.show', $role->id) }}">{{ $role->name }}</a></td>
                        <td>{{ $role->created_at }}</td>
                        <td>
                            @can('update', $role)
                            <a href="{{ route('dashboard.roles.edit', $role->id) }}" class="btn btn-sm btn-outline-success">Edit</a>
                            @endcan
                        </td>
                        <td>
                            @can('delete', $role)
                            <form action="{{ route('dashboard.roles.destroy', $role->id) }}" method="post">
                                @csrf
                                <!-- Form Method Spoofing -->
                                <input type="hidden" name="_method" value="delete">
                                @method('delete')
                                <button type="submit" class="btn btn-sm btn-outline-danger">Delete</button>
                            </form>
                            @endcan
                        </td>
                    </tr>
                    @empty
                    <tr>
                        <td colspan="4">No roles defined.</td>
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