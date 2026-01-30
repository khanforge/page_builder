export const API_BASE_URL =
  process.env.NEXT_PUBLIC_API_BASE_URL!;

export async function fetchPages(slug: string) {
    if (!slug) slug = "home";
    console.log("slug = ", slug)
    const res = await fetch(`${API_BASE_URL}/api/public/page/${process.env.NEXT_PUBLIC_VITE_API_USERNAME}/${slug}`)
    const data = await res.json();
    return data[0];
}

export async function fetchPageSlugs() {
    const res = await fetch(`${API_BASE_URL}/api/public/slugs/${process.env.NEXT_PUBLIC_VITE_API_USERNAME}`)
    return res.json();
}