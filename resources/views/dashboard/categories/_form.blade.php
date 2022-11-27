<div class="card-body">
    <div class="form-group">

        <!-- Component View -->
        <x-form.input label="Category Name" for="exampleInputText1" name="name" :value="$category->name" type="text" role="input" />
        <!-- /Component View -->
    </div>
    <div class="form-group">

        <!-- Label Component -->
        <x-form.label id="parent">Category Parent</x-form.label>
        <!-- /Label Component -->

        <select class="custom-select form-select" name="parent_id">
            <option value="">Primary Category</option>
            @foreach($parents as $parent)
            <option value="{{ $parent->id }}" @selected(old('parent_id', $category->parent_id)==$parent->id) >{{ $parent->name }}</option>
            @endforeach
        </select>
    </div>

    <!-- Component textarea -->
    <div class="form-group">
        <x-form.textarea label="Description" name="description" placeholder="Enter ..." rows="3" :value="$category->description" />
    </div>
    <!-- /Component textarea -->

    <div class="form-group">
        <!--Component Image -->
        <x-form.file name="image" for="exampleInputFile" type="file" label="Image" accept="image" />
        <!--/Component Image -->
        @if($category->image)
        <img src="{{ asset('storage/uploads/' . $category->image) }}" alt="" height="50px">
        @endif
    </div>

    <!-- radio -->
    <div class="form-group">
        <label for="">Status</label>
        <!-- Componant radio -->
        <x-form.radio id="radioCheck" name="status" :checked="$category->status" :options="['active' => 'Active', 'archived' => 'Archived']" />
        <!-- /Componant radio -->
    </div>
</div>
<!-- /.card-body -->

<div class="card-footer">
    <button type="submit" class="btn btn-primary">{{ $button_form ?? 'Save'}}</button>
</div>