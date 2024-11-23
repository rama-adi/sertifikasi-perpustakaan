// ... imports same as BorrowBook.tsx ...

import {useMemo, useState} from "react";
import {Head, useForm} from "@inertiajs/react";
import InputLabel from "@/Components/InputLabel";
import TextInput from "@/Components/TextInput";
import {Button} from "@/Components/ui/button";
import {Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle} from "@/Components/ui/card";
import InputError from "@/Components/InputError";
import {Pencil} from "lucide-react";
import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";
import {AppBreadcrumb} from "@/Components/AppBreadcrumb";

export default function ReturnBook({users, books}: { users: any[], books: any[] }) {

    const {data, setData, post, processing, errors, reset} = useForm({
        user_id: '',
        books_ids: [] as number[],
    });

    const SearchUserInput = () => {
        const [searchQuery, setSearchQuery] = useState('');
        if (data.user_id !== '') {
            return (
                <div className="space-y-2">
                    <InputLabel htmlFor="selectUser">Anggota yang dipilih</InputLabel>
                    <div id="selectUser" className="border p-4 rounded-md flex items-center justify-between bg-gray-50">
                        <span className="font-semibold">{users.find(user => user.id === data.user_id)?.name}</span>
                        <Button
                            variant="outline"
                            onClick={() => {
                                setData('books_ids', []);
                                setData('user_id', '');

                            }}
                            className="text-sm"
                        >
                            Ganti anggota
                        </Button>
                    </div>
                </div>
            );
        }

        return (
            <div className="space-y-4">
                <InputLabel htmlFor="searchUser">Cari anggota</InputLabel>
                <TextInput
                    id="searchUser"
                    type="text"
                    placeholder="Masukkan nama anggota..."
                    className="w-full"
                    value={searchQuery}
                    autoFocus={true}
                    onChange={(e) => setSearchQuery(e.target.value)}
                />
                <div className="border rounded-md overflow-hidden">
                    <div className="max-h-60 overflow-y-auto">
                        {users
                            .filter(user =>
                                user.name.toLowerCase().includes(searchQuery.toLowerCase())
                            )
                            .map(user => (
                                <div key={user.id}
                                     className="flex items-center justify-between p-3 hover:bg-gray-50 transition-colors">
                                    <span className="font-medium">{user.name}</span>
                                    <Button
                                        variant="outline"
                                        onClick={() => {
                                            setData('user_id', user.id);

                                        }}
                                        className="text-sm"
                                    >
                                        Pilih
                                    </Button>
                                </div>
                            ))
                        }
                    </div>
                </div>
            </div>
        );
    }

    const SearchBookInput = () => {
        const [searchQuery, setSearchQuery] = useState('');

        const handleAddBook = (bookId: number) => {
            if (!data.books_ids.includes(bookId)) {
                setData('books_ids', [...data.books_ids, bookId]);
            }
        };

        const handleRemoveBook = (bookId: number) => {
            setData('books_ids', data.books_ids.filter(id => id !== bookId));
        };

        // Only show books borrowed by selected user
        const userBooks = useMemo(() =>
            books.filter(book =>
                book.borrower?.id === data.user_id || book.borrower_id === data.user_id
            ), [books, data.user_id]);
        const selectedBooks = useMemo(() => data.books_ids.map(id => books.find(book => book.id === id)).filter(Boolean), [books, data.books_ids]);
        const availableBooks = useMemo(() => userBooks.filter(book => !data.books_ids.includes(book.id)), [userBooks, data.books_ids]);

        if (selectedBooks.length > 0) {
            return (
                <div className="space-y-4">
                    <div className="space-y-2">
                        <InputLabel>Buku yang akan dikembalikan</InputLabel>
                        <ul className="border rounded-md divide-y">
                            {selectedBooks.map(book => (
                                <li key={book.id}
                                    className="flex items-center justify-between p-3 hover:bg-gray-50 transition-colors">
                                    <span className="font-medium">{book.name}</span>
                                    <Button
                                        variant="outline"
                                        onClick={() => handleRemoveBook(book.id)}
                                        className="text-sm"
                                    >
                                        Hapus
                                    </Button>
                                </li>
                            ))}
                        </ul>
                    </div>
                    <InputLabel htmlFor="searchBook">Tambah buku lain</InputLabel>
                    <TextInput
                        id="searchBook"
                        type="text"
                        placeholder="Cari judul buku..."
                        className="w-full"
                        value={searchQuery}
                        onChange={(e) => setSearchQuery(e.target.value)}
                    />
                    <div className="border rounded-md">
                        <ul className="max-h-60 overflow-y-auto divide-y">
                            {availableBooks.length > 0 ? (
                                availableBooks
                                    .filter(book =>
                                        book.name.toLowerCase().includes(searchQuery.toLowerCase())
                                    )
                                    .map(book => (
                                        <li key={book.id} className="p-3 hover:bg-gray-50 transition-colors">
                                            <div className="flex items-center justify-between">
                                                <span className="font-medium">{book.name}</span>
                                                <Button
                                                    variant="outline"
                                                    onClick={() => handleAddBook(book.id)}
                                                    className="text-sm"
                                                >
                                                    Tambah
                                                </Button>
                                            </div>
                                        </li>
                                    ))
                            ) : (
                                <li className="text-center py-4 text-gray-500">
                                    Tidak ada buku lain yang tersedia untuk dikembalikan.
                                </li>
                            )}
                        </ul>
                    </div>
                </div>
            );
        }

        return (
            <div className="space-y-4">
                <TextInput
                    type="text"
                    placeholder="Cari judul buku..."
                    className="w-full"
                    value={searchQuery}
                    autoFocus={true}
                    onChange={(e) => setSearchQuery(e.target.value)}
                />
                <div className="border rounded-md">
                    <ul className="max-h-60 overflow-y-auto divide-y">
                        {userBooks.length > 0 ? (
                            userBooks
                                .filter(book =>
                                    book.name.toLowerCase().includes(searchQuery.toLowerCase())
                                )
                                .map(book => (
                                    <li key={book.id} className="p-3 hover:bg-gray-50 transition-colors">
                                        <div className="flex items-center justify-between">
                                            <span className="font-medium">{book.name}</span>
                                            <Button
                                                variant="outline"
                                                onClick={() => handleAddBook(book.id)}
                                                className="text-sm"
                                            >
                                                Tambah
                                            </Button>
                                        </div>
                                    </li>
                                ))
                        ) : (
                            <li className="text-center py-4 text-gray-500">
                                {data.user_id === '' ? 'Pilih anggota terlebih dahulu.' : 'Anggota belum meminjam buku.'}
                            </li>
                        )}
                    </ul>
                </div>
            </div>
        );
    }

    return (
        <AuthenticatedLayout
            header={
                <AppBreadcrumb
                    routes={[
                        {title: 'Pengembalian', name: 'return-book.create'},
                    ]}
                />
            }>
            <Head title="Pengembalian buku"/>
            <div className="py-12">
                <div className="mx-auto max-w-7xl sm:px-6 lg:px-8">
                    <Card>
                        <CardHeader>
                            <CardTitle>Catat pengembalian buku</CardTitle>
                            <CardDescription>
                                Formulir ini digunakan untuk mencatat pengembalian buku oleh anggota perpustakaan.
                            </CardDescription>
                        </CardHeader>
                        <CardContent>
                            <form className={"space-y-8"}>
                                <SearchUserInput/>
                                <InputError message={errors.user_id} className="mt-2"/>

                                <SearchBookInput/>
                                <InputError message={errors.books_ids} className="mt-2"/>
                            </form>
                        </CardContent>
                        <CardFooter>
                            <Button
                                onClick={() => {
                                    post(route('return-book.store'));
                                }}>
                                <Pencil/>
                                Catat pengembalian
                            </Button>
                        </CardFooter>
                    </Card>
                </div>
            </div>
        </AuthenticatedLayout>
    );
}
