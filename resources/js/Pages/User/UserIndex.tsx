
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout';
import {Head, Link} from '@inertiajs/react';
import {AppBreadcrumb} from "@/Components/AppBreadcrumb";
import {Table, TableBody, TableCaption, TableCell, TableHead, TableHeader, TableRow} from "@/Components/ui/table";
import {Plus, Tag} from "lucide-react";
import {Button} from "@/Components/ui/button";
import {Separator} from "@/Components/ui/separator";

export default function UserIndex({users}: { users: any[] }) {

    return (
        <AuthenticatedLayout
            header={
                <AppBreadcrumb routes={[
                    {title: 'Anggota', name: 'user.index'},
                    {title: 'Daftar anggota', name: 'user.index'}
                ]}/>
            }>
            <Head title="Daftar anggota"/>

            <div className="flex m-2">
                <h2 className="text-2xl font-semibold grow">Daftar Anggota</h2>
                <Button asChild>
                    <Link href={route('user.create')}>
                        <Plus/>
                        Tambah Anggota
                    </Link>
                </Button>
            </div>

            <Separator/>

            <Table>
                <TableCaption>Daftar anggota yang dimiliki perpustakaan ini.</TableCaption>
                <TableHeader>
                    <TableRow>
                        <TableHead className="w-[100px]">ID</TableHead>
                        <TableHead>Nama</TableHead>
                        <TableHead>Email</TableHead>
                        <TableHead>Pinjaman saat ini</TableHead>
                        <TableHead className="text-right">Aksi</TableHead>
                    </TableRow>
                </TableHeader>
                <TableBody>
                    {users.map((user, index) => (
                        <TableRow key={index}>
                            <TableCell className="font-medium">{user.id}</TableCell>
                            <TableCell>{user.name}</TableCell>
                            <TableCell>
                                {user.email}
                            </TableCell>
                            <TableCell>
                                {user.total_borrowing} buku dipinjam
                            </TableCell>
                            <TableCell className="text-right space-x-4">
                                <Link href={route('user.show', user.id)}>
                                    Lihat
                                </Link>
                                <Link href={route('user.edit', user.id)}>
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
