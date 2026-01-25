export const API_BASE_URL = "http://localhost:8000";

export async function loginUser(username: string, password: string) {
  const res = await fetch(`${API_BASE_URL}/auth/api/token/`, {
    method: "POST",
    headers: { "Content-Type": "application/json" },
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
  return localStorage.getItem("access");
}

export function isAuthenticated() {
  if (typeof window === "undefined") return false;
  return !!localStorage.getItem("access");
}

export function getAuthHeaders() {
  const token = localStorage.getItem("access"); // assuming JWT stored in localStorage
  return token ? { Authorization: `Bearer ${token}` } : {};
}

// Optional: fetch user pages
export async function fetchUserPages() {
  const res = await fetch(`${API_BASE_URL}/cms/api/page/`, {
    headers: {
      "Content-Type": "application/json",
      ...getAuthHeaders(),
    },
  });

  if (!res.ok) throw new Error("Failed to fetch pages");
  return res.json();
}

export async function fetchPageComponents(pageId: string|number) {
  const res = await fetch(`${API_BASE_URL}/cms/api/component/?page=${pageId}`, {
    headers: {
      "Content-Type": "application/json",
      ...getAuthHeaders(),
    }
  });
  if (!res.ok) throw new Error("Failed to fetch component")
  return res.json();
}

export async function createComponent(
  pageId: string,
  payload: any
) {
  const res = await fetch(
    `${API_BASE_URL}/cms/api/${pageId}/components/create`,
    {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        ...getAuthHeaders(),
      },
      body: JSON.stringify(payload),
    }
  );

  if (!res.ok) throw new Error("Create failed");
}

export async function fetchComponent(id: string) {
  const res = await fetch(`${API_BASE_URL}/cms/api/component/${id}/`);
  return res.json();
}

export async function updateComponent(
  id: string,
  payload: any
) {
  const res = await fetch(`${API_BASE_URL}/cms/api/components/${id}/update/`, {
    method: "PUT",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(payload),
  });

  if (!res.ok) throw new Error("Update failed");
}

export const handleDelete = async (pageId: number) => {
      await fetch(
        `${API_BASE_URL}/cms/api/page/${pageId}/`,
        {
          method: "DELETE",
          headers: {
            "Content-Type": "application/json",
            ...getAuthHeaders(),
          }
        }
      );
    }