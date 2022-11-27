@props([
'type' => 'text',
'name',
'value' => '',
'label' => false,
'for' => ''
])

@if($label)
<label for="{{$for}}">{{ $label }}</label>
@endif

<input type="{{ $type }}" id="{{$for}}" name="{{ $name }}" value="{{ old($name, $value) }}" {{ $attributes->class(['form-control', 'is-invalid' => $errors->has($name)]) }}>
@error($name)
<div class="invalid-feedback">
    {{ $message }}
</div>
@enderror


<!-- $attributes -> يطبع المتغيرات الغير موجودة في props , والتي ليست معرفة -->