/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'export',
  basePath: '/library-dispensary-preview',
  assetPrefix: '/library-dispensary-preview',
  images: {
    unoptimized: true
  },
  // Ensure trailing slashes for better compatibility
  trailingSlash: true,
  eslint: {
    ignoreDuringBuilds: true
  },
  typescript: {
    ignoreBuildErrors: true
  }
};

module.exports = nextConfig;