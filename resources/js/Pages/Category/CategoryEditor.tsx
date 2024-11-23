import AuthenticatedLayout from "@/Layouts/AuthenticatedLayout";
import {AppBreadcrumb} from "@/Components/AppBreadcrumb";
import {Head, Link, useForm} from "@inertiajs/react";
import {Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle} from "@/Components/ui/card";
import InputLabel from "@/Components/InputLabel";
import TextInput from "@/Components/TextInput";
import InputError from "@/Components/InputError";
import {MultiSelect} from "@/Components/MultiSelect";
import {Pencil, Plus, Tag} from "lucide-react";
import {FormEventHandler} from "react";
import {Button} from "@/Components/ui/button";


export default function CategoryEditor({category}: { category: any | undefined }) {
    const {data, setData, post, put, processing, errors, reset} = useForm({
        name: category?.name ?? '',
    });


    const submit: FormEventHandler = (e) => {
        e.preventDefault();

        if (category?.id) {
            put(route('category.update', category.id));
            return;
        }

        post(route('category.store'));
    };

    // @ts-ignore
    return (<AuthenticatedLayout
        header={
            <AppBreadcrumb
                routes={[
                    {title: 'Kategori', name: 'category.index'},
                    {title: 'Daftar kategori', name: 'category.index'},
                    ...(category?.id
                        ? [
                            {title: category?.name, name: 'category.show', id: category.id},
                            {title: 'Edit kategori', name: 'category.edit', id: category.id},
                        ]
                        : [{title: 'Tambah kategori', name: 'category.create'}]),
                ]
                }
            />

        }>
        <Head title="Editor kategori"/>


        <div className="py-12">
            <div className="mx-auto max-w-7xl sm:px-6 lg:px-8">
                <Card>
                    <CardHeader>
                        <CardTitle>Tambahkan kategori baru</CardTitle>
                        <CardDescription>
                            Isi form di bawah ini untuk menambahkan kategori baru
                        </CardDescription>
                    </CardHeader>
                    <CardContent>
                        <form onSubmit={submit}>
                            <div>
                                <InputLabel htmlFor="name" value="Nama kategori"/>
                                <TextInput
                                    id="name"
                                    type="text"
                                    name="name"
                                    value={data.name}
                                    className="mt-1 block w-full"
                                    autoComplete="username"
                                    isFocused={true}
                                    onChange={(e) => setData('name', e.target.value)}
                                />
                                <InputError message={errors.name} className="mt-2"/>
                            </div>
                        </form>
                    </CardContent>
                    <CardFooter>
                        <Button onClick={() => {
                            if (category?.id) {
                                put(route('category.update', category.id));
                                return;
                            }

                            post(route('category.store'));
                        }}>
                            {category?.id ? <Pencil/> : <Plus/>}
                            {category?.id ? 'Edit kategori' : 'Tambah kategori'}
                        </Button>
                    </CardFooter>
                </Card>
            </div>
        </div>
    </AuthenticatedLayout>)
}
