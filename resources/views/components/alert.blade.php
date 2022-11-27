@if(session()->has($type))
<div class="col-md-12">
    <div class="card bg-{{$type}}">
        <div class="card-header">
            <h3 class="card-title">{{$type}}</h3>

            <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="remove"><i class="fas fa-times"></i>
                </button>
            </div>
            <!-- /.card-tools -->
        </div>
        <!-- /.card-header -->
        <div class="card-body">
            {{ session($type) }}
        </div>
        <!-- /.card-body -->
    </div>
    <!-- /.card -->
</div>
<!-- /.col -->
@endif
<!-- /.col -->
