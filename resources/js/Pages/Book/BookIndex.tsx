import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import {Head, Link} from '@inertiajs/react';
import {AppBreadcrumb} from "@/Components/AppBreadcrumb";
import {Table, TableBody, TableCaption, TableCell, TableHead, TableHeader, TableRow} from "@/Components/ui/table";
import {Plus, Tag} from "lucide-react";
import {Button} from "@/Components/ui/button";
import {Separator} from "@/Components/ui/separator";

export default function BookIndex({books}: { books: any[] }) {
    const BookCategory = ({categories}: { categories: string[] }) => {
        return (
            <div className={"flex flex-wrap gap-2"}>
                {categories.map((category, index) => (
                    <span
                        key={index}
                        className="inline-flex items-center gap-x-1.5 rounded-md bg-gray-100 px-2 py-1 text-xs font-medium text-gray-600">
                        <Tag size={10} className={"fill-gray-200"}/>
                        {category}
                  </span>
                ))}
            </div>
        );
    }
    return (
        <AuthenticatedLayout
            header={
                <AppBreadcrumb routes={[
                    {title: 'Buku', name: 'book.index'},
                    {title: 'Daftar buku', name: 'book.index'}
                ]}/>
            }>
            <Head title="Daftar buku"/>

            <div className="flex m-2">
                <h2 className="text-2xl font-semibold grow">Daftar Buku</h2>
                <Button asChild>
                    <Link href={route('book.create')}>
                        <Plus/>
                        Tambah Buku
                    </Link>
                </Button>
            </div>

            <Separator/>

            <div className="overflow-x-auto">
                <Table>
                    <TableCaption>Daftar buku yang dimiliki perpustakaan ini.</TableCaption>
                    <TableHeader>
                        <TableRow>
                            <TableHead className="w-[50px]">ID</TableHead>
                            <TableHead>Judul Buku</TableHead>
                            <TableHead>Penerbit</TableHead>
                            <TableHead>Kategori</TableHead>
                            <TableHead>Peminjam</TableHead>
                            <TableHead className="text-right">Aksi</TableHead>
                        </TableRow>
                    </TableHeader>
                    <TableBody>
                        {books.map((book, index) => (
                            <TableRow key={index}>
                                <TableCell className="font-medium">{book.id}</TableCell>
                                <TableCell>{book.name}</TableCell>
                                <TableCell>{book.publisher} ({book.published_year})</TableCell>
                                <TableCell>
                                    {book.categories.length > 0 ? <BookCategory categories={book.categories}/> : 'Tidak ada kategori'}
                                </TableCell>
                                <TableCell>
                                    {book.borrower}
                                </TableCell>
                                <TableCell className="text-right space-x-4">
                                    <Link href={route('book.show', book.id)}>
                                        Lihat
                                    </Link>
                                    <Link href={route('book.edit', book.id)}>
                                        Edit
                                    </Link>
                                </TableCell>
                            </TableRow>
                        ))}
                    </TableBody>
                </Table>
            </div>
        </AuthenticatedLayout>
    );
}
