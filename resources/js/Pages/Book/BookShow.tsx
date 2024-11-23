import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";
import {AppBreadcrumb} from "@/Components/AppBreadcrumb";
import {Head, Link} from "@inertiajs/react";
import {Pencil, Plus, Tag, Trash} from "lucide-react";
import {Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle} from "@/Components/ui/card";
import {router} from '@inertiajs/react'
import {Button} from "@/Components/ui/button";

export default function BookShow({book}: { book: any }) {
    const BookCategory = ({categories}: { categories: any[] }) => {
        return (
            <div className={"flex gap-2"}>
                {categories.map((category, index) => (
                    <span
                        key={index}
                        className="inline-flex items-center gap-x-1.5 rounded-md bg-gray-100 px-2 py-1 text-xs font-medium text-gray-600">
                        <Tag size={10} className={"fill-gray-200"}/>
                        {category.name}
                  </span>
                ))}
            </div>
        );
    }

    const deleteBook = () => {
        if (confirm('Apakah anda yakin ingin menghapus buku ini?')) {
            router.delete(route('book.destroy', book.id))
        }
    }

    return (
        <AuthenticatedLayout
            header={
                <AppBreadcrumb routes={[
                    {title: 'Buku', name: 'book.index'},
                    {title: 'Daftar buku', name: 'book.index'},
                    {title: book.name, name: 'book.show', id: book.id}
                ]}/>
            }>
            <Head title={book.title}/>

            <div className="py-12">
                <div className="mx-auto max-w-7xl sm:px-6 lg:px-8">
                    <Card>
                        <CardHeader>
                            <CardTitle>Detail buku {book.name}</CardTitle>
                            <CardDescription>
                                Berikut adalah detail buku {book.name}.
                            </CardDescription>
                        </CardHeader>
                        <CardContent>
                            <div className="flex flex-col space-y-4">
                                <div>
                                    <h2 className="text-lg font-semibold">Nama buku</h2>
                                    <p className="text-gray-600">{book.name}</p>
                                </div>
                                <div>
                                    <h2 className="text-lg font-semibold">Kategori</h2>
                                    <BookCategory categories={book.categories}/>
                                </div>

                                <div>
                                    <h2 className="text-lg font-semibold">Nama peminjam</h2>
                                    <p className="text-gray-600">{book.borrower ? book.borrower.name : 'Sedang tidak dipinjam.'}</p>
                                </div>
                            </div>
                        </CardContent>
                        <CardFooter>
                            <div className="flex gap-4">
                                <Button variant="secondary" asChild>
                                    <Link href={route('book.edit', book.id)}>
                                        <Pencil/>
                                        Edit buku
                                    </Link>
                                </Button>
                                <Button variant="destructive" onClick={deleteBook}>
                                    <Trash/>
                                    Hapus buku
                                </Button>
                            </div>
                        </CardFooter>
                    </Card>
                </div>
            </div>
        </AuthenticatedLayout>
    );
}
