<?php

use App\Models\Book;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

beforeEach(function () {
    // Create an admin user for authentication
    $this->admin = User::factory()->create();
    $this->actingAs($this->admin);
});

test('user index page displays all users', function () {
    // Arrange
    $users = User::factory(3)->create();

    // Act
    $response = $this->get(route('user.index'));

    // Assert
    $response->assertInertia(fn($page) => $page
        ->component('User/UserIndex')
        ->has('users', 4) // 3 created users + 1 admin
        ->where('users.0.name', $this->admin->name)
        ->where('users.0.email', $this->admin->email)
    );
});

test('user create page can be rendered', function () {
    $response = $this->get(route('user.create'));

    $response->assertInertia(fn($page) => $page
        ->component('User/UserEditor')
        ->where('user', null)
    );
});

test('new user can be created', function () {
    $userData = [
        'name' => 'Test User',
        'email' => 'test@example.com',
        'password' => 'password123',
    ];

    $response = $this->post(route('user.store'), $userData);

    $response->assertRedirect(route('user.index'));
    $this->assertDatabaseHas('users', [
        'name' => $userData['name'],
        'email' => $userData['email'],
    ]);
    expect(session('sonner'))->toBe('Berhasil menambahkan pengguna');
});

test('user cannot be created with invalid data', function () {
    $response = $this->post(route('user.store'), [
        'name' => '',
        'email' => 'invalid-email',
        'password' => 'short',
    ]);

    $response->assertSessionHasErrors(['name', 'email', 'password']);
});

test('user details page can be viewed', function () {
    $user = User::factory()->create();

    $response = $this->get(route('user.show', $user));

    $response->assertInertia(fn($page) => $page
        ->component('User/UserShow')
        ->has('user', fn($user) => $user
            ->has('id')
            ->has('name')
            ->has('email')
        )
        ->has('borrowed_books')
    );
});

test('user edit page can be rendered', function () {
    $user = User::factory()->create();

    $response = $this->get(route('user.edit', $user));

    $response->assertInertia(fn($page) => $page
        ->component('User/UserEditor')
        ->has('user', fn($user) => $user
            ->has('id')
            ->has('name')
            ->has('email')
        )
    );
});

test('user can be updated', function () {
    $user = User::factory()->create();
    $updatedData = [
        'name' => 'Updated Name',
        'email' => 'updated@example.com',
        'password' => 'newpassword123',
    ];

    $response = $this->put(route('user.update', $user), $updatedData);

    $response->assertRedirect(route('user.show', $user));
    $this->assertDatabaseHas('users', [
        'id' => $user->id,
        'name' => $updatedData['name'],
        'email' => $updatedData['email'],
    ]);
    expect(session('sonner'))->toBe('Berhasil mengubah pengguna');
});

test('user can be updated without changing password', function () {
    $user = User::factory()->create();
    $oldPasswordHash = $user->password;

    $response = $this->put(route('user.update', $user), [
        'name' => 'Updated Name',
        'email' => 'updated@example.com',
        'password' => '',
    ]);

    $user->refresh();
    expect($user->password)->toBe($oldPasswordHash);
});

test('user cannot be updated with invalid data', function () {
    $user = User::factory()->create();
    $originalEmail = $user->email;

    $response = $this->put(route('user.update', $user), [
        'name' => '',
        'email' => 'invalid-email',
        'password' => 'short',
    ]);

    $response->assertSessionHasErrors(['name', 'email', 'password']);
    expect($user->refresh()->email)->toBe($originalEmail);
});

test('user can be deleted', function () {
    $user = User::factory()->create();

    $response = $this->delete(route('user.destroy', $user));

    $response->assertRedirect(route('user.index'));
    $this->assertDatabaseMissing('users', ['id' => $user->id]);
    expect(session('sonner'))->toBe('Berhasil menghapus pengguna');
});

test('logged in user cannot delete themselves', function () {
    $response = $this->delete(route('user.destroy', $this->admin));

    $response->assertRedirect(route('user.index'));
    $this->assertDatabaseHas('users', ['id' => $this->admin->id]);
    expect(session('sonner'))->toBe('Tidak dapat menghapus akun yang sedang digunakan');
});

test('email must be unique when creating user', function () {
    $existingUser = User::factory()->create();

    $response = $this->post(route('user.store'), [
        'name' => 'Test User',
        'email' => $existingUser->email,
        'password' => 'password123',
    ]);

    $response->assertSessionHasErrors('email');
});

test('email must be unique when updating user except for current user', function () {
    $user1 = User::factory()->create();
    $user2 = User::factory()->create();

    $response = $this->put(route('user.update', $user1), [
        'name' => 'Updated Name',
        'email' => $user2->email,
        'password' => 'password123',
    ]);

    $response->assertSessionHasErrors('email');
});

test('user index shows correct book borrowing count', function () {
    $user = User::factory()->create();
    $books = Book::factory(3)->create();

    $books->each(fn(Book $book) => $book->update(['borrower_id' => $user->id]));

    $response = $this->get(route('user.index'));

    $response->assertInertia(fn($page) => $page
        ->where('users.1.total_borrowing', 3)
    );
});

test('very long user names are properly handled', function () {
    $veryLongName = str_repeat('a', 300);

    $response = $this->post(route('user.store'), [
        'name' => $veryLongName,
        'email' => 'test@example.com',
        'password' => 'password123',
    ]);

    $response->assertSessionHasErrors('name');
});

test('password hashing is working correctly', function () {
    $password = 'password123';

    $response = $this->post(route('user.store'), [
        'name' => 'Test User',
        'email' => 'test@example.com',
        'password' => $password,
    ]);

    $user = User::where('email', 'test@example.com')->first();
    expect(Hash::check($password, $user->password))
        ->toBeTrue()
        ->and($user->password)->not->toBe($password);
});

test('user cannot be created with existing email in different case', function () {
    User::factory()->create(['email' => 'test@example.com']);

    $response = $this->post(route('user.store'), [
        'name' => 'Test User',
        'email' => 'TEST@example.com',
        'password' => 'password123',
    ]);

    $response->assertSessionHasErrors('email');
});

test('special characters in user names are properly handled', function () {
    $response = $this->post(route('user.store'), [
        'name' => 'Test User !@#$%^&*()',
        'email' => 'test@example.com',
        'password' => 'password123',
    ]);

    $response->assertRedirect(route('user.index'));
    $this->assertDatabaseHas('users', [
        'name' => 'Test User !@#$%^&*()',
    ]);
});

test('unicode characters in user names are properly handled', function () {
    $response = $this->post(route('user.store'), [
        'name' => 'Test 用户 مستخدم',
        'email' => 'test@example.com',
        'password' => 'password123',
    ]);

    $response->assertRedirect(route('user.index'));
    $this->assertDatabaseHas('users', [
        'name' => 'Test 用户 مستخدم',
    ]);
});

test('user cannot be updated with empty name', function () {
    $user = User::factory()->create();

    $response = $this->put(route('user.update', $user), [
        'name' => '',
        'email' => 'test@example.com',
        'password' => 'password123',
    ]);

    $response->assertSessionHasErrors('name');
});

test('user cannot be created with extremely long email', function () {
    $longEmail = str_repeat('a', 255) . '@example.com';

    $response = $this->post(route('user.store'), [
        'name' => 'Test User',
        'email' => $longEmail,
        'password' => 'password123',
    ]);

    $response->assertSessionHasErrors('email');
});

test('user show page handles non-existent user', function () {
    $nonExistentId = 99999;

    $response = $this->get(route('user.show', $nonExistentId));

    $response->assertNotFound();
});
