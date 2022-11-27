<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    /*
    public function __construct()
    {
        $this->middleware(['auth'])->except(['index']); ما عدا
        $this->middleware(['auth'])->only(['index']); فقط
    }
    */

    // Actions
    public function index()
    {
        // Return response: view, josn, redirect, file.
        return view('dashboard.index');

        // $user = 'Ahmad Joda';
        /**
         * 1
         * return view('dashboard.index', ['user' => $user,]);
         */
        /**
         * 2
         * return View::make('admin\dashboard', ['user' => $user,]);
         */
        /**
         * 3
         * return view('admin\dashboard')->with(['user' => $user,]);
         */
        /**
         * 4
         * return response()->view('admin\dashboard', ['user' => $user,]);
         */
        /**
         * 5
         * return Response::view('admin\dashboard', ['user' => $user,]);
         */
        /**
         * 6
         * return view('admin\dashboard', compact('user'));
         */
    }
}
