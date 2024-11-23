import {
    Sidebar,
    SidebarContent,
    SidebarFooter,
    SidebarGroup, SidebarGroupAction, SidebarGroupContent, SidebarGroupLabel,
    SidebarHeader, SidebarMenu, SidebarMenuButton, SidebarMenuItem,
} from "@/Components/ui/sidebar"
import {ArrowDownFromLine, ArrowUpFromLine, Book, ChevronUp, Home, Tag, User2, Users} from "lucide-react";
import {User} from "@/types";
import {ReactNode} from "react";
import {DropdownMenu, DropdownMenuContent, DropdownMenuItem, DropdownMenuTrigger} from "@/Components/ui/dropdown-menu";
import {Link} from "@inertiajs/react";

export function AppSidebar({user}: { user: User }) {
    return (
        <Sidebar>
            <SidebarHeader>
                <div className="flex gap-4 p-2">
                    <div
                        className="flex aspect-square size-8 items-center justify-center rounded-lg bg-sidebar-primary text-sidebar-primary-foreground">
                        <Book className="size-4"/>
                    </div>
                    <div className="flex flex-col gap-0.5 leading-none">
                        <span className="font-semibold">Perpustakaan</span>
                        <span className="">App</span>
                    </div>
                </div>
            </SidebarHeader>
            <SidebarContent>
                <SidebarGroup>
                    <SidebarMenuButton asChild isActive={route().current('dashboard')}>
                        <Link href={route('dashboard')} className="w-full">
                            <Home/>
                            <span>Beranda</span>
                        </Link>
                    </SidebarMenuButton>
                </SidebarGroup>
                <SidebarGroup>
                    <SidebarGroupLabel>Buku</SidebarGroupLabel>
                    <SidebarGroupContent>
                        <SidebarMenuButton asChild isActive={route().current('book.*')}>
                            <Link href={route('book.index')} className="w-full">
                                <Book/>
                                <span>Manajemen Buku</span>
                            </Link>
                        </SidebarMenuButton>

                        <SidebarMenuButton asChild isActive={route().current('category.*')}>
                            <Link href={route('category.index')} className="w-full">
                                <Tag/>
                                <span>Manajemen Kategori</span>
                            </Link>
                        </SidebarMenuButton>
                    </SidebarGroupContent>
                </SidebarGroup>

                <SidebarGroup>
                    <SidebarGroupLabel>Peminjaman</SidebarGroupLabel>
                    <SidebarGroupContent>
                        <SidebarMenuButton asChild isActive={route().current('borrow-book.*')}>
                            <Link href={route('borrow-book.create')} className="w-full">
                                <ArrowUpFromLine/>
                                <span>Catat peminjaman</span>
                            </Link>
                        </SidebarMenuButton>

                        <SidebarMenuButton asChild isActive={route().current('return-book.*')}>
                            <Link href={route('return-book.create')} className="w-full">
                                <ArrowDownFromLine/>
                                <span>Catat pengembalian</span>
                            </Link>
                        </SidebarMenuButton>
                    </SidebarGroupContent>
                </SidebarGroup>

                <SidebarGroup>
                    <SidebarGroupLabel>Anggota</SidebarGroupLabel>
                    <SidebarGroupContent>
                        <SidebarMenuButton asChild isActive={route().current('user.*')}>
                            <Link href={route('user.index')} className="w-full">
                                <Users/>
                                <span>Manajemen Anggota</span>
                            </Link>
                        </SidebarMenuButton>
                    </SidebarGroupContent>
                </SidebarGroup>

            </SidebarContent>
            <SidebarFooter>
                <SidebarMenu>
                    <SidebarMenuItem>
                        <DropdownMenu>
                            <DropdownMenuTrigger asChild>
                                <SidebarMenuButton>
                                    <User2/> {user.name}
                                    <ChevronUp className="ml-auto"/>
                                </SidebarMenuButton>
                            </DropdownMenuTrigger>
                            <DropdownMenuContent
                                side="top"
                                className="w-[--radix-popper-anchor-width]"
                            >
                                <DropdownMenuItem>
                                    <Link
                                        method="post"
                                        href={route('logout')}
                                        as="button"
                                        className="w-full text-left"
                                    >
                                        Keluar
                                    </Link>
                                </DropdownMenuItem>
                            </DropdownMenuContent>
                        </DropdownMenu>
                    </SidebarMenuItem>
                </SidebarMenu>
            </SidebarFooter>
        </Sidebar>
    )
}
