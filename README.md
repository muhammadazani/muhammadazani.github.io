# muhammadazani.github.io

Academic homepage of Muhammad Azani Hasibuan, built with [Quarto](https://quarto.org) and published at <https://muhammadazani.github.io>.

## Structure

| File / folder         | Page                                                   |
|-----------------------|--------------------------------------------------------|
| `_quarto.yml`         | Site config: title, navbar, footer, theme              |
| `index.qmd`           | About (home) page                                      |
| `research.qmd`        | Research projects                                      |
| `publications.qmd`    | Publications, grouped by year                          |
| `teaching.qmd`        | Courses and writing on teaching                        |
| `notes.qmd`, `notes/` | Essays and notes (one `.qmd` each; RSS at `notes.xml`) |
| `cv.qmd`              | CV (put a PDF at `files/cv.pdf` and link it)           |
| `styles.scss`         | Colour and font tweaks for the light and dark themes   |

Search the files for `TODO` to find what is left to fill in.

## Editing

- **Add a publication:** add a line under the right year in `publications.qmd`.
- **Add a note or essay:** create `notes/my-note.qmd` with `title`, `date` and optional `categories` front matter.

## Preview locally

```bash
quarto preview
```

## Publishing

The site is served from the `gh-pages` branch (Settings → Pages → Deploy from a branch → `gh-pages`).

- **Automatically:** every push to `main` runs `.github/workflows/publish.yml`, which renders the site and updates `gh-pages`.
- **Manually** (from RStudio's Terminal or any shell): `quarto publish gh-pages`
