import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  /* config options here */
  reactStrictMode: true,
  images: {
    domains: ['backend.pagebuilder.dpdns.org'],
  }
};

export default nextConfig;
