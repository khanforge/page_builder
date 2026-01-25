"use client"

import Link from "next/link"
import { usePathname } from "next/navigation"
import { cn } from "@/lib/utils"
import LogoutButton from "./LogoutButton"

const nav = [
  { name: "Dashboard", href: "/" },
  { name: "Pages", href: "/pages" },
  { name: "Settings", href: "/settings" },
]

export default function Sidebar() {
  const pathname = usePathname()

  return (
    <div className="h-full p-4">
      <h1 className="text-xl font-semibold mb-6">Portfolio CMS</h1>

      <nav className="space-y-1">
        {nav.map((item) => (
          <Link
            key={item.href}
            href={item.href}
            className={cn(
              "block rounded-md px-3 py-2 text-sm hover:bg-muted",
              pathname === item.href && "bg-muted font-medium"
            )}
          >
            {item.name}
          </Link>
        ))}
      </nav>
      <div className="mt-auto pt-4 border-t border-muted/20">
        <LogoutButton />
      </div>
    </div>
  )
}
