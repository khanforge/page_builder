"use client";

import { useEffect, useRef } from "react";
import Quill from "quill";
import "quill/dist/quill.snow.css";

type Props = {
  value?: string;
  onChange: (html: string) => void;
};

export default function RichTextEditor({ value = "", onChange }: Props) {
  const editorRef = useRef<HTMLDivElement | null>(null);
  const quillRef = useRef<Quill | null>(null);

  useEffect(() => {
    if (!editorRef.current || quillRef.current) return;

    quillRef.current = new Quill(editorRef.current, {
      theme: "snow",
    });

    quillRef.current.on("text-change", () => {
      onChange(quillRef.current!.root.innerHTML);
    });

    quillRef.current.root.innerHTML = value;
  }, []);

  return <div className="bg-white" ref={editorRef} />;
}
