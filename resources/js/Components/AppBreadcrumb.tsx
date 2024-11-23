import {User} from "@/types";
import {
    Breadcrumb,
    BreadcrumbItem,
    BreadcrumbLink,
    BreadcrumbList, BreadcrumbPage,
    BreadcrumbSeparator
} from "@/Components/ui/breadcrumb";
import {Link} from "@inertiajs/react";

interface BreadcrumbRoutes {
    title: string;
    name: string;
    id?: number;
}

export function AppBreadcrumb({routes}: { routes: BreadcrumbRoutes[] }) {
    // @ts-ignore
    return (
        <Breadcrumb>
            <BreadcrumbList>
                <BreadcrumbItem className="hidden md:block">
                    <BreadcrumbLink asChild>
                        <Link href={route('dashboard')}>
                            Beranda
                        </Link>
                    </BreadcrumbLink>
                </BreadcrumbItem>
                <BreadcrumbSeparator className="hidden md:block"/>
                {routes.map((current, index) => (
                    <>
                        {index > 0 && <BreadcrumbSeparator key={`separator-${index}`} className="hidden md:block"/>}
                        <BreadcrumbItem key={`item-${index}`}>
                            {index === routes.length - 1 ? (
                                <BreadcrumbPage>{current.title}</BreadcrumbPage>
                            ) : (
                                <BreadcrumbLink asChild>
                                    {current.id ? (
                                        <Link href={route(current.name, current.id)}>
                                            {current.title}
                                        </Link>
                                    ) : (
                                        <Link href={route(current.name)}>
                                            {current.title}
                                        </Link>
                                    )}
                                </BreadcrumbLink>
                            )}
                        </BreadcrumbItem>
                    </>
                ))}
            </BreadcrumbList>
        </Breadcrumb>
    );
}
