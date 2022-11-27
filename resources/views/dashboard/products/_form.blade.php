<div class="card-body">
    <div class="form-group">
        <!-- Component View -->
        <x-form.input label="Product Name" for="exampleInputText1" name="name" :value="$product->name" type="text" role="input" />
        <!-- /Component View -->
    </div>
    <div class="form-group">
        <!-- Label Component -->
        <x-form.label id="parent">Category</x-form.label>
        <!-- /Label Component -->
        <select class="custom-select form-select" name="parent_id">
            <option value="">Primary Category</option>
            @foreach(App\Models\Category::all() as $category)
            <option value="{{ $category->id }}" @selected(old('category_id', $product->category_id) == $category->id)>{{ $category->name }}</option>
            @endforeach
        </select>
    </div>
    <!-- Component textarea -->
    <div class="form-group">
        <x-form.textarea label="Description" name="description" placeholder="Enter ..." rows="3" :value="$product->description" />
    </div>
    <!-- /Component textarea -->
    <div class="form-group">
        <!--Component Image -->
        <x-form.file name="image" for="exampleInputFile" type="file" label="Image" accept="image" />
        <!--/Component Image -->
        @if($product->image)
        <img src="{{ asset('storage/uploads/' . $product->image) }}" alt="" height="50px">
        @endif
    </div>
    <div class="form-group">
        <!-- Component View -->
        <x-form.input label="Price" name="price" :value="$product->price" />
        <!-- /Component View -->
    </div>
    <div class="form-group">
        <x-form.input label="Compare Price" name="compare_price" :value="$product->compare_price" />
    </div>
    <div class="form-group">
        <x-form.input label="Tags" name="tags" :value="$tags" />
    </div>
    <!-- radio -->
    <div class="form-group">
        <label for="">Status</label>
        <!-- Component radio -->
        <x-form.radio id="radioCheck" name="status" :checked="$product->status" :options="['active' => 'Active', 'draft' => 'Draft', 'archived' => 'Archived']" />
        <!-- /Component radio -->
    </div>
</div>
<!-- /.card-body -->

<div class="card-footer">
    <button type="submit" class="btn btn-primary">{{ $button_form ?? 'Save'}}</button>
</div>


@push('styles')
<link href="{{ asset('admin/dist/css/tagify.css') }}" rel="stylesheet" type="text/css" />
@endpush

@push('scripts')
<script src="{{ asset('admin/dist/js/tagify.js') }}"></script>
<script src="{{ asset('admin/dist/js/tagify.polyfills.min.js') }}"></script>
<script>
    var inputElm = document.querySelector('[name=tags]'),
        tagify = new Tagify(inputElm);
</script>
@endpush