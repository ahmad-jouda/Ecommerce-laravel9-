@props([
'name',
'options',
'checked' => false,
'id' => '',
'label' => false,
])
@foreach($options as $value => $text)
<div class="form-check">
    <input type="radio" name="{{$name}}" value="{{$value}}" id="{{$id}}" @checked(old($name, $checked)==$value) {{ $attributes->class(['form-check-input', 'is-invalid' => $errors->has($name)]) }}>
    <label class="form-check-label" for="{{$id}}">{{$text}}</label>
</div>
@endforeach