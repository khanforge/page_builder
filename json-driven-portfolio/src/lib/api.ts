export const API_BASE_URL =
  process.env.NEXT_PUBLIC_API_BASE_URL!;

export async function fetchPages() {
    const res = await fetch(`${API_BASE_URL}/api/public/page/admin`)
    return res.json();
}

export async function fetchPageSlugs() {
    const res = await fetch(`${API_BASE_URL}/api/public/page/slugs/admin`)
    return res.json();
}