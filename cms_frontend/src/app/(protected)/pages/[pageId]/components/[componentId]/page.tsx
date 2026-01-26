"use client";

import { useEffect, useState } from "react";
import { useParams, useRouter } from "next/navigation";
import ComponentForm from "../_form/ComponentForm";
import { fetchComponent, updateComponent } from "@/lib/api";
import { normalizeComponent } from "@/lib/normalizeComponent";

export default function EditComponentPage() {
  const { pageId, componentId } = useParams();
  const router = useRouter();

  const [initialData, setInitialData] = useState<any>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    async function load() {
      const apiData = await fetchComponent(componentId as string);
      const normalized = normalizeComponent(apiData);
      console.log(normalized);
      setInitialData(normalized);
      setLoading(false);
    }

    load();
  }, [componentId]);

  if (loading) return <p>Loading...</p>;

  return (
    <ComponentForm
      pageId={pageId as string}
      initialData={initialData}
      onSubmit={async (payload) => {
        await updateComponent(componentId as string, payload);
        router.push(`/pages/${pageId}`);
      }}
    />
  );
}
