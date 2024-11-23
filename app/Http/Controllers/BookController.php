<?php

namespace App\Http\Controllers;

use App\Models\Book;
use App\Models\Category;
use Illuminate\Http\Request;
use Inertia\Inertia;

class BookController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $books = Book::with('categories', 'borrower')
            ->get()
            ->map(fn(Book $book) => [
                'id' => $book->id,
                'name' => $book->name,
                'categories' => $book->categories->pluck('name'),
                'published_year' => $book->published_year,
                'publisher' => $book->publisher,
                'borrower' => $book->borrower->name ?? 'Belum dipinjam',
            ]);
        return Inertia::render('Book/BookIndex')->with('books', $books);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $categories = Category::all()->pluck('name', 'id');
        return Inertia::render('Book/BookEditor')
            ->with('book', null)
            ->with('categories', $categories);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'category_ids' => 'required|min:1|array|exists:categories,id',
            'publisher' => 'required',
            'published_year' => 'required|integer|min:1000|max:' . (date('Y') + 1),
            'synopsis' => 'required',
        ]);

        $book = Book::create($request->only(['name', 'publisher', 'published_year', 'synopsis']));
        $book->categories()->sync($request->category_ids);

        session()->flash('sonner', 'Berhasil menambahkan buku');
        return to_route('book.show', [
            'book' => $book,
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(Book $book)
    {
        $book->load('categories', 'borrower');
        return Inertia::render('Book/BookShow')->with('book', $book);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Book $book)
    {
        $book->load('categories');
        $categories = Category::all()->pluck('name', 'id');
        return Inertia::render('Book/BookEditor')
            ->with('book', $book)
            ->with('categories', $categories);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Book $book)
    {
        $request->validate([
            'name' => 'required',
            'category_ids' => 'required|array|min:1|exists:categories,id',
            'publisher' => 'required',
            'published_year' => 'required|integer|min:1000|max:' . (date('Y') + 1),
            'synopsis' => 'required',
        ]);

        $book->update($request->only(['name', 'publisher', 'published_year', 'synopsis']));
        $book->categories()->sync($request->category_ids);

        session()->flash('sonner', 'Berhasil mengubah buku');
        return to_route('book.show', [
            'book' => $book,
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Book $book)
    {
        $book->delete();
        session()->flash('sonner', 'Berhasil menghapus buku');
        return to_route('book.index');
    }
}
