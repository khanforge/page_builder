"use client";

import { useState } from "react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Switch } from "@/components/ui/switch";

const contentTypes = ["text", "list", "numbered_list", "image", "link"];

export default function ComponentForm({
  pageId,
  initialData,
  onSubmit,
}: {
  pageId: string;
  initialData?: any;
  onSubmit: (payload: any) => Promise<void>;
}) {
  const [title, setTitle] = useState(initialData?.title ?? "");
  const [isActive, setIsActive] = useState(initialData?.is_active ?? true);
  const [subcomponents, setSubcomponents] = useState(
    initialData?.subcomponents ?? []
  );

  const addSubcomponent = () => {
    setSubcomponents([
      ...subcomponents,
      { title: "", is_active: true, content: [] },
    ]);
  };

  const updateSubcomponent = (i: number, key: string, val: any) => {
    const copy = [...subcomponents];
    copy[i][key] = val;
    setSubcomponents(copy);
  };

  const addContent = (si: number) => {
    const copy = [...subcomponents];
    copy[si].content.push({ content_type: "text", data: "" });
    setSubcomponents(copy);
  };

  const updateContent = (
    si: number,
    ci: number,
    key: string,
    val: any
  ) => {
    const copy = [...subcomponents];
    copy[si].content[ci][key] = val;
    setSubcomponents(copy);
  };

  const addListItem = (si: number, ci: number) => {
    const copy = [...subcomponents];
    if (!Array.isArray(copy[si].content[ci].data)) {
      copy[si].content[ci].data = [];
    }
    copy[si].content[ci].data.push("");
    setSubcomponents(copy);
  };

  async function handleSubmit() {
    await onSubmit({
      page_id: Number(pageId),
      title,
      is_active: isActive,
      subcomponents,
    });
  }

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

      {subcomponents.map((sub, si) => (
        <div key={si} className="border p-4 rounded space-y-3">
          <Input
            placeholder="Subcomponent title"
            value={sub.title}
            onChange={(e) =>
              updateSubcomponent(si, "title", e.target.value)
            }
          />

          {sub.content.map((c, ci) => (
            <div key={ci} className="border-l pl-4 space-y-2">
              <select
                value={c.content_type}
                onChange={(e) =>
                  updateContent(si, ci, "content_type", e.target.value)
                }
              >
                {contentTypes.map((t) => (
                  <option key={t}>{t}</option>
                ))}
              </select>

              {(c.content_type === "text" ||
                c.content_type === "link") && (
                <Input
                  value={c.data}
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
                          const copy = [...subcomponents];
                          copy[si].content[ci].data[ii] =
                            e.target.value;
                          setSubcomponents(copy);
                        }}
                      />
                    ))}
                  <Button
                    size="sm"
                    onClick={() => addListItem(si, ci)}
                  >
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
