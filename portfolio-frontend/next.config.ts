import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  reactStrictMode: true,
  images: {
    remotePatterns: [
      {
        protocol: 'http',
        hostname: 'backend.pagebuilder.dpdns.org',
        pathname: '/**',
      },
    ],
  },
  experimental: {
    // Disable Turbopack for production builds
    turbo: false,
  },
};

export default nextConfig;
