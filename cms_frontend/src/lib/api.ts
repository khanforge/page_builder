export const API_BASE_URL = "http://localhost:8000";

/* ===================== AUTH ===================== */

export async function loginUser(username: string, password: string) {
  const res = await fetch(`${API_BASE_URL}/auth/api/token/`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({ username, password }),
  });

  const data = await res.json();

  if (!res.ok) {
    throw new Error("Invalid credentials");
  }

  localStorage.setItem("access", data.access);
  localStorage.setItem("refresh", data.refresh);

  return data;
}

export function logoutUser() {
  localStorage.removeItem("access");
  localStorage.removeItem("refresh");
}

export function getAccessToken() {
  if (typeof window === "undefined") return null;
  return localStorage.getItem("access");
}

export function isAuthenticated() {
  if (typeof window === "undefined") return false;
  return !!localStorage.getItem("access");
}

/* ===================== HEADERS (FIXED) ===================== */

export function getAuthHeaders(): HeadersInit {
  const headers = new Headers();
  headers.set("Content-Type", "application/json");

  if (typeof window !== "undefined") {
    const token = localStorage.getItem("access");
    if (token) {
      headers.set("Authorization", `Bearer ${token}`);
    }
  }

  return headers;
}

/* ===================== API CALLS ===================== */

export async function fetchUserPages() {
  const res = await fetch(`${API_BASE_URL}/cms/api/page/`, {
    headers: getAuthHeaders(),
  });

  if (!res.ok) throw new Error("Failed to fetch pages");
  return res.json();
}

export async function fetchPageComponents(pageId: string | number) {
  const res = await fetch(
    `${API_BASE_URL}/cms/api/component/?page=${pageId}`,
    {
      headers: getAuthHeaders(),
    }
  );

  if (!res.ok) throw new Error("Failed to fetch component");
  return res.json();
}

export async function createComponent(pageId: string, payload: any) {
  const res = await fetch(
    `${API_BASE_URL}/cms/api/${pageId}/components/create`,
    {
      method: "POST",
      headers: getAuthHeaders(),
      body: JSON.stringify(payload),
    }
  );

  if (!res.ok) throw new Error("Create failed");
}

export async function fetchComponent(id: string) {
  const res = await fetch(`${API_BASE_URL}/cms/api/component/${id}/`, {
    headers: getAuthHeaders(),
  });

  if (!res.ok) throw new Error("Fetch component failed");
  return res.json();
}

export async function updateComponent(id: string, payload: any) {
  const res = await fetch(
    `${API_BASE_URL}/cms/api/components/${id}/update/`,
    {
      method: "PUT",
      headers: getAuthHeaders(),
      body: JSON.stringify(payload),
    }
  );

  if (!res.ok) throw new Error("Update failed");
}

export const handleDelete = async (pageId: number) => {
  const res = await fetch(
    `${API_BASE_URL}/cms/api/page/${pageId}/`,
    {
      method: "DELETE",
      headers: getAuthHeaders(),
    }
  );

  if (!res.ok) throw new Error("Delete failed");
};
