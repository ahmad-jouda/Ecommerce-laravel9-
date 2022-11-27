<?php

namespace App\Providers;

use App\Services\CurrencyConverter;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Http\Resources\Json\ResourceResponse;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->bind('currency.converter', function () {
            return new CurrencyConverter(config('services.currency_converter.api_key'));
        });

        if (App::environment('production')) {
            $this->app->singleton('path.public', function () {
                return base_path('public_html');
            });
        }
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        //App::setLocale('ar');

        //App::setLocale('local', 'en');
        //App::currentLocale(); //اللغة الحالية

        JsonResource::withoutWrapping();

        // على مستوى التطبيق بالكامل (4) 
        Validator::extend('filter', function ($attribute, $value, $params) {
            return !in_array(strtolower($value), $params);
        }, 'The value is prohipted');

        Paginator::useBootstrapFour();

        // معرف على جميع التطبيق
        //Paginator::defaultView('pagination.custom');
    }
}
