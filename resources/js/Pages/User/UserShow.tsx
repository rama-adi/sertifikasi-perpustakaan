import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";
import {AppBreadcrumb} from "@/Components/AppBreadcrumb";
import {Head, Link} from "@inertiajs/react";
import {Pencil, Trash, BookOpen, User} from "lucide-react";
import {Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle} from "@/Components/ui/card";
import {router} from '@inertiajs/react'
import {Button} from "@/Components/ui/button";

export default function UserShow({user, borrowed_books}: { user: any, borrowed_books: any[] }) {
    const deleteUser = () => {
        if (confirm('Apakah anda yakin ingin menghapus pengguna ini?')) {
            router.delete(route('user.destroy', user.id))
        }
    }

    return (
        <AuthenticatedLayout
            header={
                <AppBreadcrumb routes={[
                    {title: 'Pengguna', name: 'user.index'},
                    {title: 'Daftar pengguna', name: 'user.index'},
                    {title: user.name, name: 'user.show', id: user.id}
                ]}/>
            }>
            <Head title={user.name}/>

            <div className="py-12">
                <div className="mx-auto max-w-7xl sm:px-6 lg:px-8 space-y-6">
                    <Card>
                        <CardHeader>
                            <CardTitle>Detail pengguna {user.name}</CardTitle>
                            <CardDescription>
                                Berikut adalah detail pengguna {user.name}.
                            </CardDescription>
                        </CardHeader>
                        <CardContent>
                            <div className="flex flex-col space-y-4">
                                <div>
                                    <h2 className="text-lg font-semibold">Nama</h2>
                                    <p className="text-gray-600">{user.name}</p>
                                </div>
                                <div>
                                    <h2 className="text-lg font-semibold">Email</h2>
                                    <p className="text-gray-600">{user.email}</p>
                                </div>
                            </div>
                        </CardContent>
                        <CardFooter>
                            <div className="flex gap-4">
                                <Button variant="secondary" asChild>
                                    <Link href={route('user.edit', user.id)}>
                                        <Pencil/>
                                        Edit pengguna
                                    </Link>
                                </Button>
                                <Button variant="destructive" onClick={deleteUser}>
                                    <Trash/>
                                    Hapus pengguna
                                </Button>
                            </div>
                        </CardFooter>
                    </Card>

                    <Card>
                        <CardHeader>
                            <CardTitle>Buku yang dipinjam</CardTitle>
                            <CardDescription>
                                Berikut adalah daftar buku yang dipinjam oleh {user.name}.
                            </CardDescription>
                        </CardHeader>
                        <CardContent>
                            {borrowed_books.length > 0 ? (
                                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                                    {borrowed_books.map((borrowed: any, index: number) => (
                                        <div key={index} className="p-4 rounded-lg border">
                                            <div className="flex items-center mb-2">
                                                <div className="bg-gray-800 rounded-md p-3 mr-2">
                                                    <BookOpen className="text-white" size={20} />
                                                </div>
                                                <div>
                                                    <h2 className="text-lg font-semibold">{borrowed.name}</h2>
                                                    <Link
                                                        href={route('book.show', borrowed.id)}
                                                        className="text-primary hover:underline inline-block"
                                                    >
                                                        Lihat detail buku
                                                    </Link>
                                                </div>
                                            </div>
                                        </div>
                                    ))}
                                </div>
                            ) : (
                                <div className="text-center py-8 text-gray-500">
                                    <p>Pengguna ini belum meminjam buku apapun.</p>
                                </div>
                            )}
                        </CardContent>
                    </Card>
                </div>
            </div>
        </AuthenticatedLayout>
    );
}
