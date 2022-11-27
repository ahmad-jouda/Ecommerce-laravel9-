<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\CategoryRequest;
use App\Models\Category;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class CategoriesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if (!Gate::allows('categories.view')) {
            abort(404);
        }
        /*
            //All Data
            // $categories = Category::all(); //Return Collection object -> $categories->first(); == $categories[0];
        */

        /*
            //$query = Category::query();
            (1)
            $name = $request->query('name');
            if ($name) {
                $query->where('name', 'LIKE', "%{$name}%");
            }
            (2)
            if ($name = $request->query('name')) {
                $query->where('name', 'LIKE', "%{$name}%");
            }
            (1)
            if ($status = $request->query('status')) {
                $query->where('status', '=', $status);
            }
            (2)
            if ($status = $request->query('status')) {
                $query->whereStatus($status);
            }
            $categories = $query->paginate(1);
        */

        /*
            //تعرض  عدد محدد من المنتجات Defult(15);
            // $categories = Category::simplePaginate(2); //next,Previous
            // $categories = Category::paginate(2); //1,2,3,4,..
        */

        /*
            // local scope
            // $categories = Category::active()->paginate();
            // $categories = Category::status('active')->paginate();
            // $categories = Category::active()->status('active')->paginate(); //بشرط السكوب لا يتعارض مع بعضه
            // $categories = Category::filter($request->query())->paginate(5); //Filter Scope Local
        */

        /*
            // ->latest() ترتب العناصر من الاحدث للاقدم defult ('created_at')
            // ->latest('name') ترتيب على حسب الاسم من z -> a
            // ->orderBy('name', 'ASC') ترتيب تنازلي Defult
            // ->orderBy('name', 'DESC') ترتيب تصاعدي
        */

        /*
            (لو بدنا نجيب اسم البارينت بدل رقمه)

            // العناصر الي الها parent_id
            // SELECT a.*, b.name as parent_name FROM categories as a
            // INNER JOIN categories as b ON b.id = a.parent_id
        
        
            // لو بدك العناصر الي الها parent_id و الي ما الها
            // SELECT a.*, b.name as parent_name FROM categories as a
            // LEFT JOIN categories as b ON b.id = a.parent_id
        */

        /*
            $categories = Category::join('categories as parents', 'parents.id', '=', 'categories.parent_id')
                //تحديد الحقول التي تريدها من الجدولين
                ->select([
                    'categories.*',
                    'parents.name as parent_name',
                ])
                ->orderBy('categories.name')
                ->filter($request->query())
                ->paginate(5); //Filter Scope Local + Parent Name (Inner Join)
        */

        $request = request();
        /*
            $categories = Category::leftJoin('categories as parents', 'parents.id', '=', 'categories.parent_id')
                ->select([
                    'categories.*',
                    'parents.name as parent_name',
                ])
                //->selectRaw('(SELECT COUNT(*) FROM products WHERE status='active' AND  category_id = categories.id) as products_count')
                ->selectRaw('(SELECT COUNT(*) FROM products WHERE category_id = categories.id) as products_count')
                ->filter($request->query())
                ->orderBy('categories.name')
                //->withTrashed() //لعرض العناصر المحذوفة softDeletes()
                //->onlyTrashed()  // العناصر فقط المحذوفة softDeletes()
                ->paginate(2); //Filter Scope Local + Parent Name (Left Join)
        */
        /*
            $categories = Category::with('parent')
                ->select('categories.*')
                //->selectRaw('(SELECT COUNT(*) FROM products WHERE status='active' AND category_id = categories.id) as products_count') //ممكن تتكرر
                ->selectRaw('(SELECT COUNT(*) FROM products WHERE category_id = categories.id) as products_count')
                // ->addSelect نستخدمها في حال كان يوجد  ->select() لانه لا ينفع أن تكرر مرتين
                //->addSelect(DB::row('(SELECT COUNT(*) FROM products WHERE category_id = categories.id) as products_count')) //نفس الي فوقها
                ->filter($request->query())
                ->orderBy('categories.name')
                ->paginate(2);
        */

        // بدون شرط status
        $categories = Category::with('parent')
            ->withCount('products as products_number') // هنا ممكن ما نستخدم as ولكن هنا سوف يأخذ اسم العلاقة ويضيف عليها products_count
            ->filter($request->query())
            ->orderBy('categories.name')
            ->paginate(2);

        /*
            // مع شرط status
            $categories = Category::with('parent')
                ->withCount([
                    'products as products_number' => function ($query) {
                        $query->where('status', '=', 'active');
                    }
                ])
                ->filter($request->query())
                ->orderBy('categories.name')
                ->paginate(2);
        */
        return view('dashboard.categories.index', [
            'categories' => $categories,
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        if (Gate::denies('categories.create')) {
            abort(404);
        }

        $parents = Category::all();
        $category = new Category();

        return view('dashboard.categories.create', [
            'parents' => $parents,
            'category' => $category
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        Gate::authorize('categories.create');

        //ممكن من هان نجيب البيانات ولكن هنا حيرجع البيانات الي تم فحصها
        // نستخدمها عندما نعمل في model
        $clean_date = $request->validate(Category::rules(), [
            'name.required' => 'This field (:attribute) is required',
            'name.unique' => 'This name is already exists'
        ]);

        /**
         * $request->input('name');
         * $request->post('name'); 
         * $request->get('name'); 
         * $request->name;
         * $request['name'];
         */

        /**
         * $request->query('name'); //url
         */

        /**
         * $request->all(); //return array of all input data
         * $request->only(['name', 'parent_id']);
         * $request->except(['image', 'status']);
         */

        /**
         * $category = new Category();
         * $category->name = $request->post('name');
         * $category->parent_id = $request->post('parent_id');
         * //... باقي الحقول بعد ذلك
         * $category->save();
         */

        /**
         * $category = new Category(['name' => $request->post('name'),'parent_id' => $request->post('parent_id'),]);
         * $category->save();
         */

        /**
         * $category = new Category($request->all());
         * $category->save();
         */

        //Request merge
        $request->merge([
            'slug' => Str::slug($request->post('name'))
        ]);
        //'ملابس'=> 'malabes'

        //file
        $data = $request->except('image');
        // (1)
        /*
            if ($request->hasFile('image')) {
                $file = $request->file('image'); //UploadedFile Object
                $path = $file->store('categories', 'uploads');
                // 
                //     $file->store('uploads', [
                //         'disk' => 'public'
                //     ]);
                // 
                $data['image'] = $path;
            }
        */
        // (/1)

        // (2)
        $data['image'] = $this->uploadImage($request);
        // (/2)

        //Mass assignment
        $category = Category::create($data);

        //PRG (POST Redirect GET)
        //return Redirect::route('categories.index');
        return redirect()->route('dashboard.categories.index')->with('success', 'Category Created!');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Category $category)
    {
        if (Gate::denies('categories.view')) {
            abort(404);
        }

        return view('dashboard.categories.show', compact('category'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        Gate::authorize('categories.update');

        try {
            $category = Category::findOrFail($id);
        } catch (Exception $e) {
            return redirect()->route('dashboard.categories.index')->with('info', 'Record not found!');
        }
        //$category = Category::findOrFail($id);

        /*
            $category = Category::find($id);
            if(!$category){
                abort(404);
            }
        */
        /*
            // SELECT * FROM categories
            //$parents = Category::all();
        */
        /*
            // SELECT * FROM categories WHERE id<> $id 
            //$parents = Category::where('id', '<>', $id)->get();
        */
        /*
            // SELECT * FROM categories WHERE id<> $id OR parent_id <> $id
            // $parents = Category::where('id', '<>', $id)
            //     ->orWhere('parent_id', '=', $id)
            //     ->get();
        */
        /*
            // SELECT * FROM categories WHERE id<> $id AND parent_id <> $id
            // $parents = Category::where('id', '<>', $id)
            //     ->where('parent_id', '<>', $id)
            //     ->get();
        */
        /*
            // SELECT * FROM categories WHERE id<> $id AND parent_id IS NOT NULL OR parent_id <> $id
            // $parents = Category::where('id', '<>', $id)
            //     ->whereNotNull('parent_id')
            //     ->orWhere('parent_id', '<>', $id)
            //     ->get();
        */
        /*
            // SELECT * FROM categories WHERE id<> $id AND parent_id IS NULL OR parent_id <> $id
            // $parents = Category::where('id', '<>', $id)
            //     ->whereNull('parent_id')
            //     ->orWhere('parent_id', '<>', $id)
            //     ->get();
        */

        // SELECT * FROM categories WHERE id<> $id AND (parent_id IS NULL OR parent_id <> $id)
        $parents = Category::where('id', '<>', $id)
            ->where(function ($query) use ($id) {
                $query->whereNull('parent_id')
                    ->orWhere('parent_id', '<>', $id);
            })
            ->get();

        return view('dashboard.categories.edit', [
            'category' => $category,
            'parents' => $parents,
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    //مستخدم validate request
    public function update(CategoryRequest $request, $id)
    {
        //Gate::authorize('categories.update'); اذا كنت مستخدم custom request زي الي هان بتستخدمها في custom مباشرة

        // $request->validate(Category::rules($id));

        $category = Category::findOrFail($id);

        /*
            $category = Category::find($id);
            if(!$category){
                abort(404);
            }
        */

        /* file */
        $old_image = $category->image;
        $data = $request->except('image');

        // (1)
        /*
            if ($request->hasFile('image')) {
                $file = $request->file('image'); //UploadedFile Object

                //$file->getClientOriginalName(); //اسم الحقيقي للملف
                //$file->getSize(); //حجم الملف
                //$file->getClientOriginalExtension(); //امتداد الملف
                //$file->getMimeType(); //نوع الملف image/png

                $path = $file->store('categories', 'uploads');

                // $file->store('uploads', [
                //     'disk' => 'public'
                // ]);

                $data['image'] = $path;
            }
        */
        // (/1)

        // (2)
        $new_image = $this->uploadImage($request);
        if ($new_image) {
            $data['image'] = $new_image;
        }
        // (/2)

        $category->update($data);

        // (2)  
        if ($old_image && $new_image) {
            Storage::disk('uploads')->delete($old_image);
        }
        // (/2)

        // (1)
        /*
            if ($old_image && isset($data['image'])) {
                Storage::disk('uploads')->delete($old_image);
            }
        */
        // (/1)

        /* /file */

        /**
         * 1
         * $category->name = $request->name;
         * $category->parent_id = $request->parent_id;
         * //...
         * $category->save();
         */
        /**
         * 2
         * $category->update(['name' => $request->name,]);
         */
        /**
         * 3
         * $category->fill($request->all())->save();
         */
        return redirect()->route('dashboard.categories.index')->with('success', 'Category Update!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    //  ولكن هنا لازم نفس المتغير الموجود في راوت
    public function destroy(Category $category)
    {
        Gate::authorize('categories.delete');
        //اذا كان يوجد file نستخدمها
        // نستخدمها عندما نضع باراميتير $id
        //$category = Category::findOrFail($id);
        $category->delete();

        //تم نقل كود الصورة الى forceDelete() لانه هذا الكود يحدث حذف الصورة نهائي

        /*
            // Category::where('id', '=', $id)->delete();

            // Category::destroy($id); //اذا كان غير موجود صورة استخدمها
        */

        return redirect()->route('dashboard.categories.index')->with('success', 'Category deleted!');
    }

    // (2)
    protected function uploadImage(Request $request)
    {
        if (!$request->hasFile('image')) {
            return;
        }
        $file = $request->file('image'); //UploadedFile Object
        $path = $file->store('categories', 'uploads');
        return $path;
    }

    public function trash()
    {
        $categories = Category::onlyTrashed()->paginate();
        return view('dashboard.categories.trash', compact('categories'));
    }

    public function restore(Request $request, $id)
    {
        // هات العناصر المحذوفة onlyTrashed
        $category = Category::onlyTrashed()->findOrFail($id);
        $category->restore();

        return redirect()->route('dashboard.categories.trash')
            ->with('success', 'Category restored!');
    }

    public function forceDelete($id)
    {
        $category = Category::onlyTrashed()->findOrFail($id);
        $category->forceDelete();

        //تم نقل كود الصورة الى هنا لانه هذا الكود يحدث حذف الصورة نهائي
        if ($category->image) {
            Storage::disk('uploads')->delete($category->image);
        }

        return redirect()->route('dashboard.categories.trash')
            ->with('success', 'Category deleted forever!');
    }
}
