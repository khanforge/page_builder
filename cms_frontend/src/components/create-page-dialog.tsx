"use client";

import { useState } from "react";
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from "@/components/ui/dialog";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { API_BASE_URL, getAuthHeaders } from "@/lib/api";

interface CreatePageDialogProps {
  onCreate?: () => void; // optional callback to refresh page list
}

export default function CreatePageDialog({ onCreate }: CreatePageDialogProps) {
  const [title, setTitle] = useState("");
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");
  console.log(getAuthHeaders())
  async function handleCreate() {
    if (!title) {
      setError("Title is required");
      return;
    }

    setLoading(true);
    setError("");

    try {
      const payload: any = { title };

      const res = await fetch(`${API_BASE_URL}/cms/api/page/`, {
        method: "POST",
        headers: getAuthHeaders(),
        body: JSON.stringify(payload),
      });
      
      if (!res.ok) {
        const data = await res.json();
        // show backend validation errors
        const message =
          data.detail ||
          JSON.stringify(data, null, 2) ||
          "Failed to create page";
        throw new Error(message);
      }
      
      // Reset form
      setTitle("");

      // callback to refresh dashboard
      if (onCreate) onCreate();
    } catch (err: any) {
      setError(err.message);
    } finally {
      setLoading(false);
    }
  }

  return (
    <Dialog>
      <DialogTrigger asChild>
        <Button>Create Page</Button>
      </DialogTrigger>

      <DialogContent>
        <DialogHeader>
          <DialogTitle>Create New Page</DialogTitle>
        </DialogHeader>

        <div className="space-y-4">
          {error && <p className="text-red-500">{error}</p>}

          <div>
            <Label>Title *</Label>
            <Input
              placeholder="Enter page title"
              value={title}
              onChange={(e) => setTitle(e.target.value)}
            />
          </div>

          <Button
            onClick={handleCreate}
            disabled={loading || !title}
            className="w-full"
          >
            {loading ? "Creating..." : "Create"}
          </Button>
        </div>
      </DialogContent>
    </Dialog>
  );
}
