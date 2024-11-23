<?php

use App\Models\{Book, User};
use function Pest\Laravel\{actingAs, get, post};

beforeEach(function () {
    // Clear relevant data before each test
    Book::query()->delete();
    User::query()->delete();

    // Create and authenticate a user
    $user = User::factory()->create();
    actingAs($user);
});

test('can view borrow book page with available books', function () {
    // Arrange
    $availableBooks = Book::factory(2)->create();
    $borrowedBook = Book::factory()->create(['borrower_id' => User::factory()]);
    $potentialBorrowers = User::factory(2)->create();

    // Act
    $response = get(route('borrow-book.create'));

    // Assert
    $response->assertInertia(fn ($page) => $page
        ->component('ReturnBorrow/BorrowBook')
        ->has('books', 2)
        ->has('users', 4) // 3 potential borrowers + 1 authenticated user
        ->where('books.0.id', $availableBooks[0]->id)
        ->where('books.0.name', $availableBooks[0]->name)
    );
});

test('can borrow multiple books', function () {
    // Arrange
    $borrower = User::factory()->create();
    $books = Book::factory(3)->create();

    // Act
    $response = post(route('borrow-book.store'), [
        'user_id' => $borrower->id,
        'books_ids' => $books->pluck('id')->toArray(),
    ]);

    // Assert
    $response->assertRedirect(route('dashboard'));
    $response->assertSessionHas('sonner', 'Buku terpilih berhasil dipinjam');

    foreach ($books as $book) {
        $this->assertDatabaseHas('books', [
            'id' => $book->id,
            'borrower_id' => $borrower->id,
        ]);
    }
});

test('cannot borrow already borrowed books', function () {
    // Arrange
    $borrower = User::factory()->create();
    $availableBook = Book::factory()->create();
    $borrowedBook = Book::factory()->create(['borrower_id' => User::factory()]);

    // Act
    $response = post(route('borrow-book.store'), [
        'user_id' => $borrower->id,
        'books_ids' => [$availableBook->id, $borrowedBook->id],
    ]);

    // Assert
    $response->assertRedirect();
    $response->assertSessionHas('sonner', 'Ada buku terpilih yang sudah dipinjam!');

    // Verify no books were borrowed
    $this->assertDatabaseHas('books', [
        'id' => $availableBook->id,
        'borrower_id' => null,
    ]);
});

test('can view return book page with borrowed books', function () {
    // Arrange
    $borrower = User::factory()->create();
    $borrowedBooks = Book::factory(2)->create(['borrower_id' => $borrower->id]);
    $availableBook = Book::factory()->create();

    // Act
    $response = get(route('return-book.create'));

    // Assert
    $response->assertInertia(fn ($page) => $page
        ->component('ReturnBorrow/ReturnBook')
        ->has('books', 2)
        ->has('users')
        ->where('books.0.id', $borrowedBooks[0]->id)
        ->where('books.0.borrower_id', $borrower->id)
    );
});

test('can return multiple books', function () {
    // Arrange
    $borrower = User::factory()->create();
    $books = Book::factory(3)->create(['borrower_id' => $borrower->id]);

    // Act
    $response = post(route('return-book.store'), [
        'user_id' => $borrower->id,
        'books_ids' => $books->pluck('id')->toArray(),
    ]);

    // Assert
    $response->assertRedirect(route('dashboard'));
    $response->assertSessionHas('sonner', 'Buku berhasil dikembalikan');

    foreach ($books as $book) {
        $this->assertDatabaseHas('books', [
            'id' => $book->id,
            'borrower_id' => null,
        ]);
    }
});

test('cannot return books borrowed by different user', function () {
    // Arrange
    $borrower1 = User::factory()->create();
    $borrower2 = User::factory()->create();
    $book1 = Book::factory()->create(['borrower_id' => $borrower1->id]);
    $book2 = Book::factory()->create(['borrower_id' => $borrower2->id]);

    // Act
    $response = post(route('return-book.store'), [
        'user_id' => $borrower1->id,
        'books_ids' => [$book1->id, $book2->id],
    ]);

    // Assert
    $response->assertRedirect();
    $response->assertSessionHas('sonner', 'Ada buku yang bukan dipinjam oleh anggota ini!');

    // Verify no books were returned
    $this->assertDatabaseHas('books', [
        'id' => $book1->id,
        'borrower_id' => $borrower1->id,
    ]);
    $this->assertDatabaseHas('books', [
        'id' => $book2->id,
        'borrower_id' => $borrower2->id,
    ]);
});

test('validates required fields for borrowing', function () {
    post(route('borrow-book.store'), [
        'user_id' => '',
        'books_ids' => [],
    ])->assertSessionHasErrors(['user_id', 'books_ids']);

    post(route('borrow-book.store'), [
        'user_id' => 999,
        'books_ids' => [999],
    ])->assertSessionHasErrors(['user_id', 'books_ids']);
});

test('validates required fields for returning', function () {
    post(route('return-book.store'), [
        'user_id' => '',
        'books_ids' => [],
    ])->assertSessionHasErrors(['user_id', 'books_ids']);

    post(route('return-book.store'), [
        'user_id' => 999,
        'books_ids' => [999],
    ])->assertSessionHasErrors(['user_id', 'books_ids']);
});

test('guests cannot access borrow and return features', function () {
    auth()->logout();

    get(route('borrow-book.create'))->assertRedirect(route('login'));
    post(route('borrow-book.store'))->assertRedirect(route('login'));
    get(route('return-book.create'))->assertRedirect(route('login'));
    post(route('return-book.store'))->assertRedirect(route('login'));
});
