<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\Tag;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class ProductsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $this->authorize('view-any', Product::class);

        // $user = Auth::user();
        // if ($user->store_id) {
        //     $products = Product::where('store_id', '=', $user->store_id)->paginate();
        // } else {
        //     $products = Product::paginate();
        // }
        // $products = Product::withoutGlobalScope('store')->paginate();
        /*
            // ->with(['category', 'store']) تقل من عملية استدعاء جمل الاستدعاء حتى لا يحدث loading على الموقع
            // ->with نستخدمها عندما تكون ريلاشين داخل فوور لووب
            // SELECT * FROM products
            // SELECT * FROM categories WHERE id IN (..)
            // SELECT * FROM stores WHERE id IN (..)
            // اذا كان الموقع ضخم ف استخدام join افضل بكثير من هذه الطريقة -> $products = Product::with(['category', 'store'])->paginate();
        */
        $products = Product::with(['category', 'store'])->paginate(10);
        return view('dashboard.products.index', compact('products'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $this->authorize('create', Product::class);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->authorize('create', Product::class);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $product = Product::findOrFail($id);
        $this->authorize('view', $product);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        // $user = Auth::user();
        // if ($user->store_id) {
        //     $product = Product::where('store_id', '=', $user->store_id)->findOrFail($id);
        // } else {
        //     $product = Product::findOrFail($id);
        // }
        $product = Product::findOrFail($id);
        $this->authorize('update', $product);

        $tags = implode(',', $product->tags()->pluck('name')->toArray());

        return view('dashboard.products.edit', compact('product', 'tags'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Product $product)
    {
        $this->authorize('update', $product);

        $data = $request->except(['image', 'tags']);
        /* file */
        $old_image = $product->image;
        $new_image = $this->uploadImage($request);
        if ($new_image) {
            $data['image'] = $new_image;
        }

        if ($old_image && $new_image) {
            Storage::disk('uploads')->delete($old_image);
        }

        /* /file */
        $product->update($data);

        /* tags */
        // (2) هذه الطريقة الافضل
        $tags = json_decode($request->post('tags'));
        $tag_ids = [];
        $saved_tags = Tag::all();

        if (is_array($tags) || is_object($tags)) {
            foreach ($tags as $item) {
                $slug = Str::slug($item->value);
                $tag = $saved_tags->where('slug', $slug)->first();
                if (!$tag) {
                    $tag = Tag::create([
                        'name' => $item->value,
                        'slug' => $slug,
                    ]);
                }
                $tag_ids[] = $tag->id;
            }
        }
        $product->tags()->sync($tag_ids);
        /*
            //(1)
            $tags = explode(',', $request->post('tags'));
            $tag_ids = [];

            foreach ($tags as $t_name) {
                $slug = Str::slug($t_name);
                $tag = Tag::where('slug', $slug)->first();
                if (!$tag) {
                    $tag = Tag::create([
                        'name' => $t_name,
                        'slug' => $slug,
                    ]);
                }
                $tag_ids[] = $tag->id;
            }
            $product->tags()->sync($tag_ids);
        */
        /* /tags */

        return redirect()->route('dashboard.products.index')
            ->with('success', 'Product updated');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $product = Product::findOrFail($id);
        $this->authorize('delete', $product);
    }

    // (2)
    protected function uploadImage(Request $request)
    {
        if (!$request->hasFile('image')) {
            return;
        }
        $file = $request->file('image'); //UploadedFile Object
        $path = $file->store('products', 'uploads');
        return $path;
    }
}
