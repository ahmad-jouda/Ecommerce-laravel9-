<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //يعمل اضافة ولكن عن طريق ال model 
        User::create([
            'name' => 'Ahmad Joda',
            'email' => 'a@joda.ps',
            'password' => Hash::make('123456'),
            'phone_number' => '0597101386', //ممكن تحطوش لانه نالابول
        ]);

        //يعمل اضافة ولكن عن طريق الجدول لو كان ما عندي model
        DB::table('users')->insert([
            'name' => 'System Admin',
            'email' => 'sys@joda.ps',
            'password' => Hash::make('123456'),
            'phone_number' => '0599487421', //ممكن تحطوش لانه نالابول
        ]);
    }
}
