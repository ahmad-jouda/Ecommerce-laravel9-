<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tag extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $fillable = [
        'name', 'slug'
    ];

    public function products()
    {
        //عشان ملتزم باسماء لارافيل فشي داعي اكتبهم
        return $this->belongsToMany(Product::class);
    }
}
