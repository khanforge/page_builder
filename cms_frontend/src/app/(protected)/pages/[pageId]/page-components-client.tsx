"use client";

import { useEffect, useState } from "react";
import { fetchPageComponents } from "@/lib/api";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { useRouter } from "next/navigation";

export default function PageComponentsClient({
  pageId,
}: {
  pageId: string;
}) {
  const [components, setComponents] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);
  const router = useRouter();

  useEffect(() => {
    async function loadComponents() {
        const data = await fetchPageComponents(pageId);
        console.log("params = ", pageId)
      setComponents(data);
      setLoading(false);
    }

    loadComponents();
  }, [pageId]);

  if (loading) return <p>Loading...</p>;

  return ( 
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-2xl font-semibold">Page Components</h1>
          <p className="text-muted-foreground">
            Manage components for this page
          </p>
        </div>

        <Button
         onClick={() =>
            router.push(`/pages/${pageId}/components/new`)
          }
        >
          Add Component</Button>
      </div>

      <div className="space-y-4">
        {components.map((component) => (
          <Card
            key={component.id}
            onClick={() => {
              router.push(`/pages/${pageId}/components/${component.id}/`)
            }}
          >
            <CardContent className="flex justify-between py-4">
              <div>
                <p className="font-medium">{component.title}</p>
                <p className="text-sm text-muted-foreground">
                  Order: {component.order}
                </p>
              </div>
            </CardContent>
          </Card>
        ))}
      </div>
    </div>
  );
}
