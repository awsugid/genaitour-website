import { defineConfig } from 'astro/config';

import tailwind from "@astrojs/tailwind";

// https://astro.build/config
export default defineConfig({
  integrations: [tailwind()],
  publicDir: './static',
  outDir: './public',
  server: {
    port: parseInt(process.env.PORT) || 4321
  }
});