@props([
'name',
'value' => '',
'label' => false,
'rows',
'placeholder'
])

@if($label)
<label>{{$label}}</label>
@endif

<textarea 
rows="{{$rows}}" 
placeholder="{{$placeholder}}" 
name="{{$name}}" 
{{$attributes->class(['form-control', 'is-invalid' => $errors->has($name) ]) }}>
{{ old($name, $value) }}
</textarea>

@error($name)
<div class="invalid-feedback">
    {{ $message }}
</div>
@enderror