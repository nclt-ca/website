# Board Member Profile Pages

**Date:** 2026-04-08
**Status:** Approved

## Goal

Each board member name on the About page becomes a link to their individual profile page at `/board/<slug>/` (e.g. `/board/anna-wynne/`). Each profile page includes navigation to all other board members. Pages are initially stubs with placeholder photo and bio, to be filled in later.

## Content Structure

One Markdown file per board member under `content/board/`:

```
content/board/
  _index.md         # section index (minimal, just exists)
  anna-wynne.md
  blaine-cook.md
  cameron-wenaus.md
  deryk-wenaus.md
  matt-wynne.md
  natasha-carolan.md
  sonja-logtenberg.md
```

Each member file front matter:

```yaml
---
title: "Anna Wynne"
photo: ""
bio: ""
---
```

The `photo` field will hold an asset path when real photos are added. The `bio` field will hold a short bio text. Both are empty strings for stubs.

## URLs

Hugo automatically serves each file at its slugified path:
- `content/board/anna-wynne.md` → `/board/anna-wynne/`

## Layout

A new layout `layouts/board/single.html` renders each profile page with:

1. **Photo area** — if `photo` is set, render the image; otherwise render a Bootstrap placeholder box (grey square, ~200×200px)
2. **Name** — `<h1>` from `.Title`
3. **Bio** — if `bio` is set, render it; otherwise render *"Bio coming soon."* in muted text
4. **Board member navigation** — a horizontal list of links to all other board members in the section, highlighting the current member. Uses Hugo's `.Site.Pages` filtered to the `board` section.

## About Page Changes

The board list in `content/about.md` changes from plain names to Markdown links:

```markdown
* [Anna Wynne](/board/anna-wynne/)
* [Blaine Cook](/board/blaine-cook/)
...
```

## Navigation Menu

No change to the main nav. The `/board/` section index is not added to the menu.

## Out of Scope

- Real photos (added later by editing each member's `.md` file)
- Real bios (added later by editing each member's `.md` file)
- A standalone `/board/` listing page (not needed)
