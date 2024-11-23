<?php

namespace App\Http\Controllers;

use App\Models\Book;
use App\Models\User;
use DB;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ReturnBorrowController extends Controller
{
    public function borrowCreate()
    {
        $users = User::all()->map(function ($user) {
            return [
                'id' => $user->id,
                'name' => $user->name,
            ];
        });

        $books = Book::where('borrower_id', null)
            ->get()
            ->map(function ($book) {
                return [
                    'id' => $book->id,
                    'name' => $book->name,
                ];
            });

        return Inertia::render('ReturnBorrow/BorrowBook')->with([
            'users' => $users,
            'books' => $books,
        ]);
    }

    public function borrowStore(Request $request)
    {
        $request->validate([
            'user_id' => 'required|exists:users,id',
            'books_ids' => 'required|array|exists:books,id',
        ]);

        return DB::transaction(function () use ($request) {
            // Check if any books are already borrowed before proceeding
            $borrowedBooks = Book::whereIn('id', $request->books_ids)
                ->whereNotNull('borrower_id')
                ->exists();

            if ($borrowedBooks) {
                return back()->with('sonner', 'Ada buku terpilih yang sudah dipinjam!');
            }

            // If no books are borrowed, proceed with borrowing
            foreach ($request->books_ids as $bookId) {
                $book = Book::find($bookId);
                $book->borrower_id = $request->user_id;
                $book->save();
            }

            return to_route('dashboard')->with('sonner', 'Buku terpilih berhasil dipinjam');
        });
    }

    public function returnCreate()
    {
        $users = User::all()->map(function ($user) {
            return [
                'id' => $user->id,
                'name' => $user->name,
            ];
        });

        $books = Book::whereNotNull('borrower_id')
            ->get()
            ->map(function ($book) {
                return [
                    'id' => $book->id,
                    'name' => $book->name,
                    'borrower_id' => $book->borrower_id,
                ];
            });

        return Inertia::render('ReturnBorrow/ReturnBook')->with([
            'users' => $users,
            'books' => $books,
        ]);
    }

    public function returnStore(Request $request)
    {
        $request->validate([
            'user_id' => 'required|exists:users,id',
            'books_ids' => 'required|array|exists:books,id',
        ]);

        return DB::transaction(function () use ($request) {
            // Check if any books are borrowed by a different user before proceeding
            $invalidBooks = Book::whereIn('id', $request->books_ids)
                ->where('borrower_id', '!=', $request->user_id)
                ->exists();

            if ($invalidBooks) {
                return back()->with('sonner', 'Ada buku yang bukan dipinjam oleh anggota ini!');
            }

            // If all books are borrowed by the correct user, proceed with returning
            foreach ($request->books_ids as $bookId) {
                $book = Book::find($bookId);
                $book->borrower_id = null;
                $book->save();
            }

            return to_route('dashboard')->with('sonner', 'Buku berhasil dikembalikan');
        });
    }
}
