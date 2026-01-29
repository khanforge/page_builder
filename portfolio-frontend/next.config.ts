import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  reactStrictMode: true,
  images: {
    remotePatterns: [
      {
        protocol: 'http',                     // Use 'http' since your src URL is http
        hostname: 'backend.pagebuilder.dpdns.org',
        pathname: '/**',                      // Allow all paths under this hostname
      },
    ],
  },
};

export default nextConfig;
