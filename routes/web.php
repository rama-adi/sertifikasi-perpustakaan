<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

Route::get('/', function () {
    return Inertia::render('Welcome', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
    ]);
});

Route::prefix('/dashboard')->middleware(['auth', 'verified'])->group(function () {
    Route::get('/', function () {
        return Inertia::render('Dashboard');
    })->name('dashboard');

    Route::resource('user', \App\Http\Controllers\UserController::class);

    Route::prefix('/borrow-book')->group(function () {
        Route::get('/', [App\Http\Controllers\ReturnBorrowController::class, 'borrowCreate'])
            ->name('borrow-book.create');
        Route::post('/', [App\Http\Controllers\ReturnBorrowController::class, 'borrowStore'])
            ->name('borrow-book.store');
    });

    Route::prefix('/return-book')->group(function () {
        Route::get('/', [App\Http\Controllers\ReturnBorrowController::class, 'returnCreate'])
            ->name('return-book.create');
        Route::post('/', [App\Http\Controllers\ReturnBorrowController::class, 'returnStore'])
            ->name('return-book.store');
    });

    Route::resource('book', \App\Http\Controllers\BookController::class);
    Route::resource('category', \App\Http\Controllers\CategoryController::class);

    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__ . '/auth.php';
