<?php

namespace App\View\Components;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use Illuminate\View\Component;

class Sidebar extends Component
{
    // protected $items;
    public $items;

    public $active;

    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct($context = 'side')
    {
        $this->items = $this->prepareItems(config('sidebar'));
        // $this->items = config('sidebar');

        $this->active = Route::currentRouteName();
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        /*
            //protected $items
            return view('components.sidebar', [
                'items' => $this->items,
            ]);
        */

        //public $items
        return view('components.sidebar');
    }

    protected function prepareItems($items)
    {
        $user = Auth::user();
        foreach ($items as $key => $item) {
            if (isset($item['ability']) && !$user->can($item['ability'])) {
                unset($items[$key]);
            }
        }
        return $items;
    }
}
