<?php

namespace App\Http\Requests;

use App\Models\Category;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Gate;
use Illuminate\Validation\Rule;

class CategoryRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        // return false;
        if ($this->route('category')) {
            return Gate::allows('categories.update');
        }
        return Gate::allows('categories.create');
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        $id = $this->route('category');

        return Category::rules($id);

        /*
        return [
            'name' => [
                'required',
                'string',
                'min:3',
                'max:255',
                // "unique:categories,name,$id" => Edit
                Rule::unique('categories', 'name')->ignore($id),
            ],
            'parent_id' => [
                'nullable', 'int', 'exists:categories,id'
            ],
            'image' => [
                'image', 'max:1048576', 'mimes:jpg,bmp,png,webp', 'dimensions:min_width=100,min_height=100'
            ],
            'status' => 'required|in:active,archived'
        ];
        */
    }

    public function messages()
    {
        return [
            'name.required' => 'This field (:attribute) is required',
            'name.unique' => 'This name is already exists'
        ];
    }
}
