<?php

use App\Models\{Book, Category, User};
use function Pest\Laravel\{get, post, put, delete, actingAs};

beforeEach(function () {
    // Clear relevant data before each test
    Book::query()->delete();
    Category::query()->delete();

    // Create and authenticate a user
    $user = User::factory()->create();
    actingAs($user);
});

test('can view book listing page with proper data structure', function () {
    // Arrange
    $categories = Category::factory(2)->create();
    $borrower = User::factory()->create();
    $book = Book::factory()->create(['name' => 'Test Book']);
    $book->categories()->attach($categories);
    $book->update(['borrower_id' => $borrower->id]);

    // Create another book without borrower
    $unborrowedBook = Book::factory()->create(['name' => 'Unborrowered Book']);
    $unborrowedBook->categories()->attach($categories->first());

    // Act
    $response = get(route('book.index'));

    // Assert
    $response->assertInertia(fn ($page) => $page
        ->component('Book/BookIndex')
        ->has('books', 2)
        ->where('books.0.name', 'Test Book')
        ->where('books.0.categories', $categories->pluck('name'))
        ->where('books.0.borrower', $borrower->name)
        ->where('books.1.name', 'Unborrowered Book')
        ->where('books.1.borrower', 'Belum dipinjam')
    );
});

test('can view book creation page with categories', function () {
    $categories = Category::factory(3)->create();

    $response = get(route('book.create'));

    $response->assertInertia(fn ($page) => $page
        ->component('Book/BookEditor')
        ->where('book', null)
        ->has('categories', 3)
        ->where('categories', $categories->pluck('name', 'id'))
    );
});

test('can create new book with categories', function () {
    $categories = Category::factory(2)->create();

    $response = post(route('book.store'), [
        'name' => 'New Book',
        'category_ids' => $categories->pluck('id')->toArray(),
        'publisher' => 'Test Publisher',
        'published_year' => 2020,
        'synopsis' => 'Test synopsis'
    ]);

    $book = Book::first();

    $response->assertRedirect(route('book.show', $book));
    $response->assertSessionHas('sonner', 'Berhasil menambahkan buku');

    $this->assertDatabaseHas('books', [
        'name' => 'New Book',
        'publisher' => 'Test Publisher',
        'published_year' => 2020,
        'synopsis' => 'Test synopsis'
    ]);

    expect($book->categories)->toHaveCount(2)
        ->and($book->categories->pluck('id'))->toEqual($categories->pluck('id'));
});

test('cannot create book with invalid data', function () {
    // Test missing name
    post(route('book.store'), [
        'name' => '',
        'category_ids' => [1],
    ])->assertSessionHasErrors(['name']);

    // Test missing categories
    post(route('book.store'), [
        'name' => 'New Book',
        'category_ids' => [],
    ])->assertSessionHasErrors(['category_ids']);

    // Test invalid category IDs
    post(route('book.store'), [
        'name' => 'New Book',
        'category_ids' => [999],
    ])->assertSessionHasErrors(['category_ids']);

    // Test missing publisher
    post(route('book.store'), [
        'name' => 'New Book',
        'category_ids' => [1],
        'published_year' => 2020,
        'synopsis' => 'Test synopsis'
    ])->assertSessionHasErrors(['publisher']);

    // Test invalid published_year
    post(route('book.store'), [
        'name' => 'New Book',
        'category_ids' => [1],
        'publisher' => 'Test Publisher',
        'published_year' => 999, // Too low
        'synopsis' => 'Test synopsis'
    ])->assertSessionHasErrors(['published_year']);

    // Test missing synopsis
    post(route('book.store'), [
        'name' => 'New Book',
        'category_ids' => [1],
        'publisher' => 'Test Publisher',
        'published_year' => 2020,
    ])->assertSessionHasErrors(['synopsis']);
});

test('can view single book with relationships', function () {
    $categories = Category::factory(2)->create();
    $book = Book::factory()->create();
    $book->categories()->attach($categories);

    $response = get(route('book.show', $book));

    $response->assertInertia(fn ($page) => $page
        ->component('Book/BookShow')
        ->has('book.categories', 2)
        ->where('book.id', $book->id)
        ->where('book.name', $book->name)
    );
});

test('can view book edit page with current data', function () {
    $categories = Category::factory(3)->create();
    $book = Book::factory()->create();
    $book->categories()->attach($categories->take(2));

    $response = get(route('book.edit', $book));

    $response->assertInertia(fn ($page) => $page
        ->component('Book/BookEditor')
        ->where('book.id', $book->id)
        ->where('book.name', $book->name)
        ->has('book.categories', 2)
        ->has('categories', 3)
        ->where('categories', $categories->pluck('name', 'id'))
    );
});

test('can update book with categories', function () {
    $oldCategories = Category::factory(2)->create();
    $newCategories = Category::factory(2)->create();
    $book = Book::factory()->create([
        'name' => 'Old Name',
        'publisher' => 'Old Publisher',
        'published_year' => 2020,
        'synopsis' => 'Old synopsis'
    ]);
    $book->categories()->attach($oldCategories);

    $response = put(route('book.update', $book), [
        'name' => 'Updated Name',
        'category_ids' => $newCategories->pluck('id')->toArray(),
        'publisher' => 'New Publisher',
        'published_year' => 2021,
        'synopsis' => 'New synopsis'
    ]);

    $response->assertRedirect(route('book.show', $book));
    $response->assertSessionHas('sonner', 'Berhasil mengubah buku');

    $book->refresh();

    expect($book->name)->toBe('Updated Name')
        ->and($book->publisher)->toBe('New Publisher')
        ->and($book->published_year)->toBe(2021)
        ->and($book->synopsis)->toBe('New synopsis')
        ->and($book->categories)->toHaveCount(2)
        ->and($book->categories->pluck('id'))->toEqual($newCategories->pluck('id'));
});

test('cannot update book with invalid data', function () {
    $book = Book::factory()->create();
    $categories = Category::factory(2)->create();
    $book->categories()->attach($categories);

    // Test empty name
    put(route('book.update', $book), [
        'name' => '',
        'category_ids' => $categories->pluck('id')->toArray(),
    ])->assertSessionHasErrors(['name']);

    // Test empty categories
    put(route('book.update', $book), [
        'name' => 'Updated Name',
        'category_ids' => [],
    ])->assertSessionHasErrors(['category_ids']);

    // Test invalid category IDs
    put(route('book.update', $book), [
        'name' => 'Updated Name',
        'category_ids' => [999],
    ])->assertSessionHasErrors(['category_ids']);
});

test('can delete book', function () {
    $categories = Category::factory(2)->create();
    $book = Book::factory()->create();
    $book->categories()->attach($categories);

    $response = delete(route('book.destroy', $book));

    $response->assertRedirect(route('book.index'));
    $response->assertSessionHas('sonner', 'Berhasil menghapus buku');

    $this->assertDatabaseMissing('books', ['id' => $book->id]);
    $this->assertDatabaseCount('book_category', 0);
});

test('guests cannot access book pages', function () {
    $book = Book::factory()->create();
    auth()->logout();

    // Test all routes
    get(route('book.index'))->assertRedirect(route('login'));
    get(route('book.create'))->assertRedirect(route('login'));
    post(route('book.store'), ['name' => 'Test'])->assertRedirect(route('login'));
    get(route('book.show', $book))->assertRedirect(route('login'));
    get(route('book.edit', $book))->assertRedirect(route('login'));
    put(route('book.update', $book), ['name' => 'Test'])->assertRedirect(route('login'));
    delete(route('book.destroy', $book))->assertRedirect(route('login'));
});

test('book listing handles empty state correctly', function () {
    $response = get(route('book.index'));

    $response->assertInertia(fn ($page) => $page
        ->component('Book/BookIndex')
        ->has('books', 0)
    );
});

test('book relationships are properly deleted when book is deleted', function () {
    $categories = Category::factory(2)->create();
    $borrower = User::factory()->create();
    $book = Book::factory()->create(['borrower_id' => $borrower->id]);
    $book->categories()->attach($categories);

    $this->assertDatabaseCount('book_category', 2);

    $book->delete();

    $this->assertDatabaseCount('book_category', 0);
    $this->assertDatabaseMissing('books', ['id' => $book->id]);
    // Categories and borrower should still exist
    $this->assertDatabaseHas('users', ['id' => $borrower->id]);
    $this->assertDatabaseCount('categories', 2);
});