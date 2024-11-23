import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";
import {AppBreadcrumb} from "@/Components/AppBreadcrumb";
import {Head, Link} from "@inertiajs/react";
import {Pencil, Plus, Tag, Trash, BookOpen} from "lucide-react";
import {Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle} from "@/Components/ui/card";
import {router} from '@inertiajs/react'
import {Button} from "@/Components/ui/button";

export default function CategoryShow({category}: { category: any }) {

    const deleteCategory = () => {
        if (confirm('Apakah anda yakin ingin menghapus kategori ini?')) {
            router.delete(route('category.destroy', category.id))
        }
    }

    return (
        <AuthenticatedLayout
            header={
                <AppBreadcrumb routes={[
                    {title: 'Kategori', name: 'category.index'},
                    {title: 'Daftar kategori', name: 'category.index'},
                    {title: category.name, name: 'category.show', id: category.id}
                ]}/>
            }>
            <Head title={category.title}/>

            <div className="py-12">
                <div className="mx-auto max-w-7xl sm:px-6 lg:px-8 space-y-6">
                    <Card>
                        <CardHeader>
                            <CardTitle>Detail kategori {category.name}</CardTitle>
                            <CardDescription>
                                Berikut adalah detail kategori {category.name}.
                            </CardDescription>
                        </CardHeader>
                        <CardContent>
                            <div className="flex flex-col space-y-4">
                                <div>
                                    <h2 className="text-lg font-semibold">Nama kategori</h2>
                                    <p className="text-gray-600">{category.name}</p>
                                </div>
                            </div>
                        </CardContent>
                        <CardFooter>
                            <div className="flex gap-4">
                                <Button variant="secondary" asChild>
                                    <Link href={route('category.edit', category.id)}>
                                        <Pencil/>
                                        Edit kategori
                                    </Link>
                                </Button>
                                <Button variant="destructive" onClick={deleteCategory}>
                                    <Trash/>
                                    Hapus kategori
                                </Button>
                            </div>
                        </CardFooter>
                    </Card>

                    <Card>
                        <CardHeader>
                            <CardTitle>Buku dalam kategori ini</CardTitle>
                            <CardDescription>
                                Berikut adalah daftar buku dalam kategori {category.name}.
                            </CardDescription>
                        </CardHeader>
                        <CardContent>
                            <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                                {category.books.map((book: any, index: number) => (
                                    <div key={index} className="p-4 rounded-lg border">
                                        <div className="flex items-center mb-2">
                                            <div className="bg-gray-800 rounded-md p-3 mr-2">
                                                <BookOpen className="text-white" size={20} />
                                            </div>
                                            <div>
                                                <h2 className="text-lg font-semibold">{book.name}</h2>
                                                <Link
                                                    href={route('book.show', book.id)}
                                                    className="text-primary hover:underline inline-block"
                                                >
                                                    Lihat detail
                                                </Link>
                                            </div>
                                        </div>


                                    </div>
                                ))}
                            </div>
                        </CardContent>
                    </Card>
                </div>
            </div>
        </AuthenticatedLayout>
    );
}
