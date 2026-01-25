"use client";

import { useParams, useRouter } from "next/navigation";
import ComponentForm from "../_form/ComponentForm";
import { createComponent } from "@/lib/api";

export default function CreateComponentPage() {
  const { pageId } = useParams();
  const router = useRouter();

  async function handleCreate(payload: any) {
    await createComponent(pageId as string, payload);
    router.push(`/pages/${pageId}`);
  }

  return (
    <>
      <h1 className="text-2xl font-semibold mb-4">
        Add Component
      </h1>

      <ComponentForm
        pageId={pageId as string}
        onSubmit={handleCreate}
      />
    </>
  );
}
