@props([
'type' => 'text',
'name',
'label' => false,
'for',
'accept' => 'image'
])

<label for="{{$for}}">{{$label}}</label>
<div class="input-group">
    <div class="custom-file">
        <input type="{{$type}}" class="custom-file-input" id="{{$for}}" name="{{$name}}" accept="{{$accept}}/*">
        <label class="custom-file-label" for="{{$for}}">Choose file</label>
    </div>
    <div class="input-group-append">
        <span class="input-group-text">Upload</span>
    </div>
</div>
@error($name)
<div class="invalid-feedback">
    {{ $message }}
</div>
@enderror