export const API_BASE_URL =
  import.meta.env.VITE_API_BASE_URL!;

export async function fetchPages(slug: string) {
    if (!slug) slug = "home";
    const res = await fetch(`${API_BASE_URL}/api/public/page/admin/${slug}`)
    const data = await res.json();
    return data[0];
}

export async function fetchPageSlugs() {
    const res = await fetch(`${API_BASE_URL}/api/public/slugs/admin`)
    return res.json();
}