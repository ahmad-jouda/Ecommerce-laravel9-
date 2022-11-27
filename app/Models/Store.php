<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class Store extends Model
{
    use HasFactory, Notifiable;
    /* 
    const CREATED_AT = 'created_at'; لو حبيت تغير اسم الحقل
    const UPDATED_AT = 'updated_at'; لو حبيت تغير اسم الحقل

    protected $connection = 'mysql'; لو كنت تستخدم غير mysql
    protected $table = 'stores'; عندما استخدم جدول  مختلف تماما عن المودل
    protected $primaryKey = 'id'; لو كنت تريد تسمي غير id 
    protected $keyType = 'int'; لو كنت تريد الكي نص 

    public $incrementing = true; لو حبيت ما يكون true
    public $timestamps = true; لو كنت بدكاش تاريخ الانشاء وتاريخ التعديل بتحط false
    */

    public function products()
    {
        return $this->belongsTo(Product::class, 'store_id', 'id');
    }
}
