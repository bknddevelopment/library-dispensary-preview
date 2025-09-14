import { type ClassValue, clsx } from "clsx"
import { twMerge } from "tailwind-merge"

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs))
}

export function getAssetPath(path: string): string {
  // Use basePath for GitHub Pages subdirectory deployment
  const basePath = process.env.NEXT_PUBLIC_BASE_PATH || '/library-dispensary-preview';

  // Handle absolute paths
  if (path.startsWith('/')) {
    path = `${basePath}${path}`;
  }

  // Add cache-busting query parameter for logo to force refresh
  // Using fixed version to allow proper caching after initial refresh
  if (path.includes('the-library-logo.png')) {
    return `${path}?v=2`;
  }
  return path;
}