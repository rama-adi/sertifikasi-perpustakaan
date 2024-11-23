import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";
import {AppBreadcrumb} from "@/Components/AppBreadcrumb";
import {Head, Link} from "@inertiajs/react";
import {Button} from "@/Components/ui/button";
import {Plus} from "lucide-react";
import {Separator} from "@/Components/ui/separator";
import {Table, TableBody, TableCaption, TableCell, TableHead, TableHeader, TableRow} from "@/Components/ui/table";

export default function CategoryIndex({categories}: { categories: any[] }) {
    return (
        <AuthenticatedLayout
            header={
                <AppBreadcrumb routes={[
                    {title: 'Kategori', name: 'category.index'},
                    {title: 'Daftar kategori', name: 'book.index'}
                ]}/>
            }>
            <Head title="Daftar kategori"/>

            <div className="flex m-2">
                <h2 className="text-2xl font-semibold grow">Daftar kategori</h2>
                <Button asChild>
                    <Link href={route('category.create')}>
                        <Plus/>
                        Tambah kategori
                    </Link>
                </Button>
            </div>

            <Separator/>

            <Table>
                <TableCaption>Daftar kategori yang dimiliki perpustakaan ini.</TableCaption>
                <TableHeader>
                    <TableRow>
                        <TableHead className="w-[100px]">ID</TableHead>
                        <TableHead>Judul kategori</TableHead>
                        <TableHead>Total buku</TableHead>
                        <TableHead className="text-right">Aksi</TableHead>
                    </TableRow>
                </TableHeader>
                <TableBody>
                    {categories.map((category, index) => (
                        <TableRow key={index}>
                            <TableCell className="font-medium">{category.id}</TableCell>
                            <TableCell>{category.name}</TableCell>
                            <TableCell>
                                {category.books_count} Buku di kategori ini
                            </TableCell>
                            <TableCell className="text-right space-x-4">
                                <Link href={route('category.show', category.id)}>
                                    Lihat
                                </Link>
                                <Link href={route('category.edit', category.id)}>
                                    Edit
                                </Link>
                            </TableCell>
                        </TableRow>
                    ))}
                </TableBody>
            </Table>
        </AuthenticatedLayout>
    );
}
