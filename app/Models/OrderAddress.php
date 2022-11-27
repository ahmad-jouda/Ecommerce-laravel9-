<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Symfony\Component\Intl\Countries;


class OrderAddress extends Model
{
    use HasFactory;

    public $timestamps = false;

    protected $fillable = [
        'order_id', 'type', 'first_name', 'last_name', 'email', 'phone_number',
        'street_address', 'city', 'postal_code', 'state', 'country',
    ];

    // دمج الاسم الاول مع الاسم الثاني في اسم واحد
    public function getNameAttribute()
    {
        return $this->first_name . ' ' . $this->last_name;
    }

    // بدل ما يعطيني كود الدولة بعطيني اسمها
    public function getCountryNameAttribute()
    {
        return Countries::getName($this->country, 'en');
    }
}
