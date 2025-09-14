import { Html, Head, Main, NextScript } from 'next/document'

export default function Document() {
  // Use basePath for GitHub Pages subdirectory deployment
  const basePath = process.env.NEXT_PUBLIC_BASE_PATH || '/library-dispensary-preview';

  return (
    <Html lang="en">
      <Head>
        <link rel="icon" href={`${basePath}/favicon.ico`} />
        <link rel="apple-touch-icon" sizes="180x180" href={`${basePath}/apple-touch-icon.png`} />
        <link rel="icon" type="image/png" sizes="32x32" href={`${basePath}/favicon-32x32.png`} />
        <link rel="icon" type="image/png" sizes="16x16" href={`${basePath}/favicon-16x16.png`} />
        <link rel="manifest" href={`${basePath}/site.webmanifest`} />
        <meta name="theme-color" content="#0A4D3C" />
      </Head>
      <body>
        <Main />
        <NextScript />
      </body>
    </Html>
  )
}