"use client";

import { useState } from "react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Switch } from "@/components/ui/switch";

/* -------------------- TYPES -------------------- */

type ContentType =
  | "text"
  | "list"
  | "numbered_list"
  | "image"
  | "link";

const contentTypes: ContentType[] = [
  "text",
  "list",
  "numbered_list",
  "image",
  "link",
];

type ContentBlock = {
  content_type: ContentType;
  data: string | string[];
};

type SubComponent = {
  id?: string;
  title: string;
  slug?: string;
  order?: number;
  is_active: boolean;
  content: ContentBlock[];
};

type ComponentFormProps = {
  pageId: string;
  initialData?: {
    title?: string;
    is_active?: boolean;
    subcomponents?: SubComponent[];
  };
  onSubmit: (payload: any) => Promise<void>;
};

/* -------------------- COMPONENT -------------------- */

export default function ComponentForm({
  pageId,
  initialData,
  onSubmit,
}: ComponentFormProps) {
  const [title, setTitle] = useState<string>(initialData?.title ?? "");
  const [isActive, setIsActive] = useState<boolean>(
    initialData?.is_active ?? true
  );

  const [subcomponents, setSubcomponents] = useState<SubComponent[]>(
    initialData?.subcomponents ?? []
  );

  /* -------------------- HELPERS -------------------- */

  const addSubcomponent = () => {
    setSubcomponents((prev) => [
      ...prev,
      {
        title: "",
        is_active: true,
        content: [],
      },
    ]);
  };

  const updateSubcomponent = <
    K extends keyof SubComponent
  >(
    index: number,
    key: K,
    value: SubComponent[K]
  ) => {
    setSubcomponents((prev) => {
      const copy = [...prev];
      copy[index] = { ...copy[index], [key]: value };
      return copy;
    });
  };

  const addContent = (si: number) => {
    setSubcomponents((prev) => {
      const copy = [...prev];
      copy[si] = {
        ...copy[si],
        content: [
          ...copy[si].content,
          { content_type: "text", data: "" },
        ],
      };
      return copy;
    });
  };

  const updateContent = <
    K extends keyof ContentBlock
  >(
    si: number,
    ci: number,
    key: K,
    value: ContentBlock[K]
  ) => {
    setSubcomponents((prev) => {
      const copy = [...prev];
      const content = [...copy[si].content];
      content[ci] = { ...content[ci], [key]: value };
      copy[si] = { ...copy[si], content };
      return copy;
    });
  };

  const addListItem = (si: number, ci: number) => {
    setSubcomponents((prev) => {
      const copy = [...prev];
      const block = copy[si].content[ci];

      const data = Array.isArray(block.data) ? block.data : [];
      block.data = [...data, ""];

      return copy;
    });
  };

  async function handleSubmit() {
    await onSubmit({
      page_id: Number(pageId),
      title,
      is_active: isActive,
      subcomponents,
    });
  }

  /* -------------------- UI -------------------- */

  return (
    <div className="space-y-6 max-w-3xl">
      <Input
        placeholder="Component title"
        value={title}
        onChange={(e) => setTitle(e.target.value)}
      />

      <div className="flex gap-2 items-center">
        <Switch checked={isActive} onCheckedChange={setIsActive} />
        Active
      </div>

      {subcomponents.map((sub: SubComponent, si: number) => (
        <div key={si} className="border p-4 rounded space-y-3">
          <Input
            placeholder="Subcomponent title"
            value={sub.title}
            onChange={(e) =>
              updateSubcomponent(si, "title", e.target.value)
            }
          />

          {sub.content.map((c: ContentBlock, ci: number) => (
            <div key={ci} className="border-l pl-4 space-y-2">
              <select
                value={c.content_type}
                onChange={(e) =>
                  updateContent(
                    si,
                    ci,
                    "content_type",
                    e.target.value as ContentType
                  )
                }
              >
                {contentTypes.map((t) => (
                  <option key={t} value={t}>
                    {t}
                  </option>
                ))}
              </select>

              {(c.content_type === "text" ||
                c.content_type === "link") && (
                <Input
                  value={c.data as string}
                  onChange={(e) =>
                    updateContent(si, ci, "data", e.target.value)
                  }
                />
              )}

              {(c.content_type === "list" ||
                c.content_type === "numbered_list") && (
                <div className="space-y-1">
                  {Array.isArray(c.data) &&
                    c.data.map((item: string, ii: number) => (
                      <Input
                        key={ii}
                        value={item}
                        onChange={(e) => {
                          const value = e.target.value;
                          setSubcomponents((prev) => {
                            const copy = [...prev];
                            const data = [
                              ...(copy[si].content[ci].data as string[]),
                            ];
                            data[ii] = value;
                            copy[si].content[ci].data = data;
                            return copy;
                          });
                        }}
                      />
                    ))}
                  <Button size="sm" onClick={() => addListItem(si, ci)}>
                    Add Item
                  </Button>
                </div>
              )}
            </div>
          ))}

          <Button size="sm" onClick={() => addContent(si)}>
            Add Content
          </Button>
        </div>
      ))}

      <Button onClick={addSubcomponent}>Add Subcomponent</Button>
      <Button onClick={handleSubmit}>
        {initialData ? "Update Component" : "Create Component"}
      </Button>
    </div>
  );
}
