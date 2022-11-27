<?php

use App\Http\Controllers\Dashboard\AdminsController;
use App\Http\Controllers\Dashboard\CategoriesController;
use App\Http\Controllers\Dashboard\DashboardController;
use App\Http\Controllers\Dashboard\ImportProductsController;
use App\Http\Controllers\Dashboard\ProductsController;
use App\Http\Controllers\Dashboard\ProfileController;
use App\Http\Controllers\Dashboard\RolesController;
use App\Http\Controllers\Dashboard\UsersController;
use App\Http\Middleware\CheckUserType;
use Illuminate\Support\Facades\Route;


Route::group([
    // 'middleware' => ['auth', 'verified', 'auth.type:admin,super-admin'],
    //'middleware' => ['auth:admin', 'verified'],
    'middleware' => ['auth:admin,web'],
    'as' => 'dashboard.', //names link
    'prefix' => 'admin/dashboard', //link form
    'namespace' => 'Dashboard',

], function () {

    Route::get('profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('profile', [ProfileController::class, 'update'])->name('profile.update');

    Route::get('/', [DashboardController::class, 'index'])->name('dashboard');
    //->middleware(['auth', 'verified'])

    //الترتيب مهم هنا
    Route::get('/categories/trash', [CategoriesController::class, 'trash'])
        ->name('categories.trash');
    Route::put('/categories/{category}/restore', [CategoriesController::class, 'restore'])
        ->name('categories.restore');
    Route::delete('/categories/{category}/force-delete', [CategoriesController::class, 'forceDelete'])
        ->name('categories.force-delete');


    Route::get('products/import', [ImportProductsController::class, 'create'])
        ->name('products.import');
    Route::post('products/import', [ImportProductsController::class, 'store']);
    /*
        //Route::resource('/categories', CategoriesController::class);
        //  ->except(['index', 'create']);
        //  ->only(['index', 'create']);
        //  ->middleware(['auth', 'verified']);
        //  ->names([
        //     'index' => 'dashboard.categories.index',
        //     'create' => 'dashboard.categories.create',
        // ]);
    */

    //Route::resource('/products', ProductsController::class);

    Route::resources([
        'products' => ProductsController::class,
        'categories' => CategoriesController::class,
        'roles' => RolesController::class,
        'users' => UsersController::class,
        'admins' => AdminsController::class,
    ]);
});

// Route::middleware('auth')->as('dashboard.')->prefix('dashboard')->group(function(){});
