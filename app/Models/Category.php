<?php

namespace App\Models;

use App\Rules\Filter;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Validation\Rule;

class Category extends Model
{
    use HasFactory, SoftDeletes;

    //White List
    protected $fillable = [
        'name',
        'image',
        'description',
        'parent_id',
        'status',
        'slug',
    ];

    public function products()
    {
        return $this->hasMany(Product::class, 'category_id', 'id');
    }

    public function parent()
    {
        return $this->belongsTo(Category::class, 'parent_id', 'id')
            ->withDefault([
                'name' => '-'
            ]);
        // ->withDefault لا نقدر أن نستخدمها في hasMany
        // ->withDefault فقط نستخدمها مع علاقات (hasOne , belongsTo)
    }

    public function children()
    {
        return $this->hasMany(Category::class, 'parent_id', 'id');
    }
    /**
     * Black List
     * protected $guarded = [];   //عكس ال fillable
     */

    /*
        public function scopeActive(Builder $builder)
        {
            $builder->where('status', '=', 'active');
        }

        public function scopeStatus(Builder $builder, $status)
        {
            $builder->where('status', '=', $status);
        }
    */

    public function scopeFilter(Builder $builder, $filters)
    {
        // في حال بدنا يعطي لل parent -> name (join)
        $builder->when($filters['name'] ?? false, function ($builder, $value) {
            $builder->where('categories.name', 'LIKE', "%{$value}%");
        });
        $builder->when($filters['status'] ?? false, function ($builder, $value) {
            $builder->where('categories.status', '=', $value);
        });

        /*  
            // في حال لا نريد أن نعطي لل parent -> name
            $builder->when($filters['name'] ?? false, function ($builder, $value) {
                $builder->where('name', 'LIKE', "%{$value}%");
            });
            $builder->when($filters['status'] ?? false, function ($builder, $value) {
                $builder->whereStatus($value);
            });
        */

        /*
            if ($filters['name'] ?? false) {
                $builder->where('name', 'LIKE', "%{$filters['name']}%");
            }
            if ($filters['status'] ?? false) {
                $builder->whereStatus($filters['status']);
            }
        */
    }

    public static function rules($id = 0)
    {
        return [
            'name' => [
                'required',
                'string',
                'min:3',
                'max:255',
                // "unique:categories,name,$id" => Edit
                Rule::unique('categories', 'name')->ignore($id),

                /* (1)
                    // كلمات ممنوع نستخدمها
                    function ($attribute, $value, $fails) {
                        if (strtolower($value) == 'laravel') {
                            $fails('This name is forbidden');
                        }
                    },
                */

                // (2) new Filter('laravel'),

                // (3)  new Filter(['laravel', 'php']),

                // (4) توجد داخل AppServiceProvider 
                'filter:php,laravel,html',
            ],
            'parent_id' => [
                'nullable', 'int', 'exists:categories,id'
            ],
            'image' => [
                'image', 'max:1048576', 'mimes:jpg,bmp,png,webp', 'dimensions:min_width=100,min_height=100'
            ],
            'status' => 'required|in:active,archived'
        ];
    }
}
