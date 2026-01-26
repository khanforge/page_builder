// src/app/page.tsx
import { redirect } from "next/navigation";

export default function HomePage() {
  // redirect to login or dashboard
  redirect("/login");
}
