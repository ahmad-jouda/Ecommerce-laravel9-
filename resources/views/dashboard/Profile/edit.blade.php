@extends('layouts.dashboard')

@section('title', 'Edit Profile')

@section('breadcrumb')
@parent
<li class="breadcrumb-item active">Edit Profile</li>
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

<x-alert type="success" />

<section class="content">
    <div class="row">
        <div class="col-md-12">
            <div class="card card-primary">
                <div class="card-header">
                    <h3 class="card-title">Edit Profile</h3>
                </div>
                <form action="{{ route('dashboard.profile.update') }}" method="post" enctype="multipart/form-data">
                    @csrf
                    @method('patch')
                    <div class="card-body">
                        <div class="form-row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <x-form.input name="first_name" label="First Name" :value="$user->profile->first_name" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <x-form.input name="last_name" label="Last Name" :value="$user->profile->last_name" />
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <x-form.input name="birthday" type="date" label="Birthday" :value="$user->profile->birthday" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <x-form.radio name="gender" label="Gender" id="gender" :options="['male'=>'Male', 'female'=>'Female']" :checked="$user->profile->gender" />
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <x-form.input name="street_address" label="Street Address" :value="$user->profile->street_address" />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <x-form.input name="city" label="City" :value="$user->profile->city" />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <x-form.input name="state" label="State" :value="$user->profile->state" />
                                </div>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <x-form.input name="postal_code" label="Postal Code" :value="$user->profile->postal_code" />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <x-form.select name="country" :options="$countries" label="Country" :selected="$user->profile->country" />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <x-form.select name="locale" :options="$locales" label="Locale" :selected="$user->profile->locale" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.card-body -->
                    <div class="row">
                        <div class="col-12">
                            <input type="submit" value="Save Changes" class="btn btn-success mb-2 ml-4">
                        </div>
                    </div>
                </form>
            </div>
            <!-- /.card -->
        </div>
    </div>

</section>
<!-- /.content -->
@endsection