"use client";

import { useEffect, useState } from "react";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import CreatePageDialog from "@/components/create-page-dialog";
import { fetchUserPages, handleDelete } from "@/lib/api";
import { useRouter } from "next/navigation"
import { Button } from "@/components/ui/button"
import { Trash2 } from "lucide-react";

export default function PagesDashboard() {
  const [pages, setPages] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const router = useRouter()

  const loadPages = async () => {
    try {
      const data = await fetchUserPages();
      setPages(data);
    } catch (err: any) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    loadPages();
  }, []);

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-semibold">Pages</h1>
          <p className="text-muted-foreground">Manage website pages</p>
        </div>

        <div className="flex gap-2">
          <CreatePageDialog onCreate={loadPages} /> {/* refresh list after create */}
        </div>
      </div>

      {/* Pages */}
      {loading ? (
        <p>Loading...</p>
      ) : error ? (
        <p className="text-red-500">{error}</p>
      ) : pages.length === 0 ? (
        <p>No pages yet. Create one!</p>
      ) : (
        <div className="grid gap-4 md:grid-cols-4">
          {pages.map((page) => (
            <Card
              key={page.id}
              onClick={() => router.push(`pages/${page.id}`)}
              className="relative"
            >
              <CardHeader>
                <Button
                  variant="ghost"
                  size="icon"
                  className="absolute top-2 right-2 text-destructive"
                  onClick={async (e) => {
                    e.stopPropagation()
                    try {
                      await handleDelete(page.id)
                      setPages((prev) => prev.filter((p) => p.id !== page.id))
                    } catch (err) {
                      console.error(err)
                    }
                  }}
                >
                  <Trash2 className="h-4 w-4" />
                </Button>
                <CardTitle className="text-sm">{page.title}</CardTitle>
              </CardHeader>
              <CardContent>
                <p className="text-2xl font-bold">{page.slug}</p>
              </CardContent>
            </Card>
          ))}
        </div>
      )}
    </div>
  );
}
