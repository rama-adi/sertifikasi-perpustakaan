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


export default function BookEditor({categories, book}: { categories: any[], book: any | undefined }) {
    const {data, setData, post, put, processing, errors, reset} = useForm({
        name: book?.name ?? '',
        category_ids: book?.categories.map((category: any) => `${category.id}`) ?? []
    });


    const multiSelectCategories = Object.entries(categories).map(([id, name]) => ({
        value: id,
        label: name,
        icon: Tag
    }));

    const submit: FormEventHandler = (e) => {
        e.preventDefault();

        if (book?.id) {
            put(route('book.update', book.id));
            return;
        }

        post(route('book.store'));
    };

    // @ts-ignore
    return (<AuthenticatedLayout
        header={
            <AppBreadcrumb
                routes={[
                    {title: 'Buku', name: 'book.index'},
                    {title: 'Daftar buku', name: 'book.index'},
                    ...(book?.id
                        ? [
                            {title: book?.name, name: 'book.show', id: book.id},
                            {title: 'Edit buku', name: 'book.edit', id: book.id},
                        ]
                        : [{title: 'Tambah buku', name: 'book.create'}]),
                ]
                }
            />

        }>
        <Head title="Editor buku"/>


        <div className="py-12">
            <div className="mx-auto max-w-7xl sm:px-6 lg:px-8">
                <Card>
                    <CardHeader>
                        <CardTitle>Tambahkan buku baru</CardTitle>
                        <CardDescription>
                            Isi form di bawah ini untuk menambahkan buku baru
                        </CardDescription>
                    </CardHeader>
                    <CardContent>
                        <form onSubmit={submit}>
                            <div>
                                <InputLabel htmlFor="name" value="Nama buku"/>
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
                            <div className="mt-4">
                                <InputLabel htmlFor="category_ids" value="Kategori buku"/>
                                <MultiSelect
                                    defaultValue={data.category_ids}
                                    onValueChange={(e =>
                                            // @ts-ignore
                                            setData('category_ids', e)
                                    )}
                                    options={multiSelectCategories}/>
                                <InputError message={errors.category_ids} className="mt-2"/>
                            </div>
                        </form>
                    </CardContent>
                    <CardFooter>
                        <Button onClick={() => {
                            if (book?.id) {
                                put(route('book.update', book.id));
                                return;
                            }

                            post(route('book.store'));
                        }}>
                            {book?.id ? <Pencil/> : <Plus/>}
                            {book?.id ? 'Edit buku' : 'Tambah buku'}
                        </Button>
                    </CardFooter>
                </Card>
            </div>
        </div>
    </AuthenticatedLayout>)
}
