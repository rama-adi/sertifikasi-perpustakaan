<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Inertia\Inertia;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $users = User::withCount('books')
            ->get()
            ->map(function ($user) {
                return [
                    'id' => $user->id,
                    'name' => $user->name,
                    'email' => $user->email,
                    'total_borrowing' => $user->books_count ?? 0,
                ];
            });

        return Inertia::render('User/UserIndex')->with('users', $users);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return Inertia::render('User/UserEditor')->with('user', null);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255',
            'password' => 'required|string|min:8',
        ]);

        // Check for existing email case-insensitively
        $existingUser = User::whereRaw('LOWER(email) = ?', [strtolower($request->email)])->first();
        if ($existingUser) {
            return back()->withErrors(['email' => 'Email sudah digunakan']);
        }

        User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password),
        ]);

        session()->flash('sonner', 'Berhasil menambahkan pengguna');
        return to_route('user.index');
    }

    /**
     * Display the specified resource.
     */
    public function show(User $user)
    {
        $user->load('books');

        return Inertia::render('User/UserShow')->with([
            'user' => [
                'id' => $user->id,
                'name' => $user->name,
                'email' => $user->email,
            ],
            'borrowed_books' => $user->books->map(function ($book) {
                return [
                    'id' => $book->id,
                    'name' => $book->name,
                ];
            }),
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(User $user)
    {
        return Inertia::render('User/UserEditor')->with('user', [
            'id' => $user->id,
            'name' => $user->name,
            'email' => $user->email,
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, User $user)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users,email,' . $user->id,
            'password' => 'nullable|string|min:8',
        ]);

        $userData = [
            'name' => $request->name,
            'email' => $request->email,
        ];

        if ($request->filled('password')) {
            $userData['password'] = Hash::make($request->password);
        }

        $user->update($userData);

        session()->flash('sonner', 'Berhasil mengubah pengguna');
        return to_route('user.show', $user->id);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(User $user)
    {
        if (auth()->id() === $user->id) {
            session()->flash('sonner', 'Tidak dapat menghapus akun yang sedang digunakan');
            return to_route('user.index');
        }

        $user->delete();

        session()->flash('sonner', 'Berhasil menghapus pengguna');
        return to_route('user.index');
    }
}
