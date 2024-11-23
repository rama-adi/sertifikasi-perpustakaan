<?php

use App\Models\{Category, User};
use function Pest\Laravel\{get, post, put, delete, actingAs};

beforeEach(function () {
    // Clear any existing data before each test
    Category::query()->delete();

    // Create and authenticate a user before each test
    $user = User::factory()->create();
    actingAs($user);
});

test('can view category listing page', function () {
    // Arrange
    $categories = Category::factory(3)->create();

    // Act
    $response = get(route('category.index'));

    // Assert
    $response->assertInertia(fn($page) => $page
        ->component('Category/CategoryIndex')
        ->has('categories', 3)
        ->where('categories.0.name', $categories[0]->name)
    );
});

test('can view category creation page', function () {
    $response = get(route('category.create'));

    $response->assertInertia(fn($page) => $page
        ->component('Category/CategoryEditor')
        ->where('category', null)
    );
});

test('can create new category', function () {
    $response = post(route('category.store'), [
        'name' => 'Fiction'
    ]);

    $response->assertRedirect(route('category.index'));
    $response->assertSessionHas('sonner', 'Berhasil menambahkan kategori');

    $this->assertDatabaseHas('categories', [
        'name' => 'Fiction'
    ]);
});

test('cannot create category without name', function () {
    $response = post(route('category.store'), [
        'name' => ''
    ]);

    $response->assertSessionHasErrors(['name']);
});

test('can view single category', function () {
    $category = Category::factory()->create();

    $response = get(route('category.show', $category));

    $response->assertInertia(fn($page) => $page
        ->component('Category/CategoryShow')
        ->where('category.id', $category->id)
        ->where('category.name', $category->name)
    );
});

test('can view category edit page', function () {
    $category = Category::factory()->create();

    $response = get(route('category.edit', $category));

    $response->assertInertia(fn($page) => $page
        ->component('Category/CategoryEditor')
        ->where('category.id', $category->id)
        ->where('category.name', $category->name)
    );
});

test('can update category', function () {
    $category = Category::factory()->create();

    $response = put(route('category.update', $category), [
        'name' => 'Updated Name'
    ]);

    $response->assertRedirect(route('category.show', $category->id));
    $response->assertSessionHas('sonner', 'Berhasil mengubah kategori');

    $this->assertDatabaseHas('categories', [
        'id' => $category->id,
        'name' => 'Updated Name'
    ]);
});

test('cannot update category without name', function () {
    $category = Category::factory()->create();

    $response = put(route('category.update', $category), [
        'name' => ''
    ]);

    $response->assertSessionHasErrors(['name']);
});

test('can delete category', function () {
    $category = Category::factory()->create();

    $response = delete(route('category.destroy', $category));

    $response->assertRedirect(route('category.index'));
    $response->assertSessionHas('sonner', 'Berhasil menghapus kategori');

    $this->assertDatabaseMissing('categories', [
        'id' => $category->id
    ]);
});
