"use client";

import { useEffect } from "react";
import { useRouter } from "next/navigation";
import Sidebar from "@/components/app-sidebar";
import MobileSidebar from "@/components/mobile-sidebar";
import { isAuthenticated } from "@/lib/api";

export default function ProtectedLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const router = useRouter();

  useEffect(() => {
    if (!isAuthenticated()) {
      router.replace("/login");
    }
  }, []);

  return (
    <div className="flex min-h-screen">
      {/* Sidebar */}
      <aside className="hidden md:block w-64 border-r bg-background">
        <Sidebar />
      </aside>

      {/* Main content */}
      <main className="flex-1 p-6">
        <div className="md:hidden mb-4">
          <MobileSidebar />
        </div>
        {children}
      </main>
    </div>
  );
}
