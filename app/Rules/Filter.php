<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;

class Filter implements Rule
{
    /*
        لو كنت تريد تستخدمها في أكثر من Models
    */


    protected $forbidden;
    /**
     * Create a new rule instance.
     *
     * @return void
     */
    public function __construct($forbidden)
    {
        // (2) لو كانت كلمة وحدة
        // $this->forbidden = strtolower($forbidden);

        // (3) لو كانت مصفوفة
        $this->forbidden = $forbidden;
    }

    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value)
    {
        // (2) لو كانت كلمة وحدة
        // return !(strtolower($value) == 'laravel');
        // return !(strtolower($value) == $this->forbidden);
        // (3) لو كانت مصفوفة
        return !in_array(strtolower($value), $this->forbidden);
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return 'This value is not allowed.';
    }
}
