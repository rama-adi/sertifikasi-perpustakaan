import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";
import {AppBreadcrumb} from "@/Components/AppBreadcrumb";
import {Head, useForm} from "@inertiajs/react";
import {Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle} from "@/Components/ui/card";
import InputLabel from "@/Components/InputLabel";
import TextInput from "@/Components/TextInput";
import InputError from "@/Components/InputError";
import {Pencil, Plus} from "lucide-react";
import {FormEventHandler} from "react";
import {Button} from "@/Components/ui/button";

export default function UserEditor({user}: { user: any | undefined }) {
    const {data, setData, post, put, processing, errors} = useForm({
        name: user?.name ?? '',
        email: user?.email ?? '',
        password: '',
    });

    const submit: FormEventHandler = (e) => {
        e.preventDefault();

        if (user?.id) {
            put(route('user.update', user.id));
            return;
        }

        post(route('user.store'));
    };

    return (
        <AuthenticatedLayout
            header={
                <AppBreadcrumb
                    routes={[
                        {title: 'Pengguna', name: 'user.index'},
                        {title: 'Daftar pengguna', name: 'user.index'},
                        ...(user?.id
                            ? [
                                {title: user?.name, name: 'user.show', id: user.id},
                                {title: 'Edit pengguna', name: 'user.edit', id: user.id},
                            ]
                            : [{title: 'Tambah pengguna', name: 'user.create'}]),
                    ]}
                />
            }
        >
            <Head title="Editor pengguna"/>

            <div className="py-12">
                <div className="mx-auto max-w-7xl sm:px-6 lg:px-8">
                    <Card>
                        <CardHeader>
                            <CardTitle>{user?.id ? 'Edit pengguna' : 'Tambah pengguna baru'}</CardTitle>
                            <CardDescription>
                                Isi form di bawah ini untuk {user?.id ? 'mengubah data pengguna' : 'menambahkan pengguna baru'}
                            </CardDescription>
                        </CardHeader>
                        <CardContent>
                            <form onSubmit={submit}>
                                <div className="space-y-4">
                                    <div>
                                        <InputLabel htmlFor="name" value="Nama pengguna"/>
                                        <TextInput
                                            id="name"
                                            type="text"
                                            name="name"
                                            value={data.name}
                                            className="mt-1 block w-full"
                                            autoComplete="name"
                                            isFocused={true}
                                            onChange={(e) => setData('name', e.target.value)}
                                        />
                                        <InputError message={errors.name} className="mt-2"/>
                                    </div>

                                    <div>
                                        <InputLabel htmlFor="email" value="Alamat email"/>
                                        <TextInput
                                            id="email"
                                            type="email"
                                            name="email"
                                            value={data.email}
                                            className="mt-1 block w-full"
                                            autoComplete="email"
                                            onChange={(e) => setData('email', e.target.value)}
                                        />
                                        <InputError message={errors.email} className="mt-2"/>
                                    </div>

                                    <div>
                                        <InputLabel htmlFor="password" value="Kata sandi"/>
                                        <TextInput
                                            id="password"
                                            type="password"
                                            name="password"
                                            value={data.password}
                                            className="mt-1 block w-full"
                                            autoComplete="new-password"
                                            onChange={(e) => setData('password', e.target.value)}
                                        />
                                        <InputError message={errors.password} className="mt-2"/>
                                    </div>
                                </div>
                            </form>
                        </CardContent>
                        <CardFooter>
                            <Button onClick={submit} disabled={processing}>
                                {user?.id ? <Pencil className="mr-2"/> : <Plus className="mr-2"/>}
                                {user?.id ? 'Perbarui pengguna' : 'Tambah pengguna'}
                            </Button>
                        </CardFooter>
                    </Card>
                </div>
            </div>
        </AuthenticatedLayout>
    );
}
