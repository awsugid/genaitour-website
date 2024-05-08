## GenAI Tour Indonesia 2024

Ini adalah repository untuk website GenAI Tour Indonesia 2024. Website ini dimaintain oleh AWS User Group Indonesia.


### Sections

- Header & Menu
- Hero section
- Sponsor logo
- Tentang GenAI Tour
- Narasumber
- Jadwal
- Daftar
- Jadi sponsor (contact us)
- Footer

### 🚀 Struktur Proyek

Proyek ini dibangun menggunakan [Astro](https://astro.build) dan [Tailwind CSS](https://tailwindcss.com). Berikut adalah strukturnya:

Astro akan mencari file dengan ekstensi `.astro` atau `.md` di direktori `src/pages/`. Setiap halaman akan ditampilkan sebagai _route_ berdasarkan nama filenya. Atau istilah kerennya: _file-based routing_.

Halaman mengandung komponen-komponen yang berada di dalam direktori `src/components/`. Komponen Astro dapat ditulis dengan berbagai _framework_ seperti React/Vue/Svelte ataupun Astro.

Sedangkan aset statis seperti gambar dapat ditambahkan kedalam direktori `public/`.

### 🧞 Perintah

Semua perintah dapat dijalankan dari direktori utama dengan terminal:

| Perintah                   | Aksi                                           |
| :------------------------ | :----------------------------------------------- |
| `npm install`             | Installs dependencies                            |
| `npm run dev`             | Starts local dev server at `localhost:4321`      |
| `npm run build`           | Build your production site to `./dist/`          |
| `npm run preview`         | Preview your build locally, before deploying     |
| `npm run astro ...`       | Run CLI commands like `astro add`, `astro check` |
| `npm run astro -- --help` | Get help using the Astro CLI                     |

### 👀 Lebih lanjut tentang Astro

Silakan cek [dokumentasi Astro disini](https://docs.astro.build).

### 📝 Lisensi

### 📄 License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

### 🗒️ TODO

- [x] Hero section
- [x] Sponsor logo section
- ~[ ] Tentang GenAI Tour~
- [x] Narasumber
- [x] Jadwal
- [x] Header & Menu
- [x] Footer
- [x] Jadwal dengan tanggal tentative
- [ ] Daftar -> ke Google docs?
- [ ] Form kontak
- [ ] Jadi sponsor (contact us)
- [ ] Favicon