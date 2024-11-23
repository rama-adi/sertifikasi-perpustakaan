import ApplicationLogo from '@/Components/ApplicationLogo';
import Dropdown from '@/Components/Dropdown';
import NavLink from '@/Components/NavLink';
import ResponsiveNavLink from '@/Components/ResponsiveNavLink';
import {Link, usePage} from '@inertiajs/react';
import {PropsWithChildren, ReactNode, useEffect, useState} from 'react';
import {SidebarInset, SidebarProvider, SidebarTrigger} from "@/Components/ui/sidebar";
import {AppSidebar} from "@/Components/AppSidebar";
import {Separator} from "@/Components/ui/separator";
import {Toaster} from "@/Components/ui/sonner";
import {toast} from "sonner";

function Breadcrumb(props: { children: React.ReactNode }) {
    return null;
}

export default function Authenticated(
    {
        header,
        children,
    }: PropsWithChildren<{ header?: ReactNode }>
) {
    const user = usePage().props.auth.user;
    const sonner = usePage().props.sonner as string | undefined;

    useEffect(() => {
        if (sonner) {
            toast(sonner);
        }
    }, []);

    return (
        <SidebarProvider>
            <AppSidebar user={user}/>
            <SidebarInset>
                <header className="flex h-16 shrink-0 items-center gap-2 border-b px-4">
                    <SidebarTrigger className="-ml-1"/>
                    <Separator orientation="vertical" className="mr-2 h-4"/>
                    {header}
                </header>
                {children}
            </SidebarInset>
            <Toaster/>
        </SidebarProvider>
    );
}
