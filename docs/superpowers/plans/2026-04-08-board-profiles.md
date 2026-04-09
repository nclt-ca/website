# Board Member Profile Pages Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add individual profile pages for each board member, linked from the About page, with navigation between members.

**Architecture:** Hugo content section at `content/board/` — one `.md` file per member. Hugo auto-generates pages at `/board/<slug>/`. A custom `layouts/board/single.html` renders each profile with a photo placeholder, bio placeholder, and nav strip linking all board members. The about page gets inline Markdown links to each profile.

**Tech Stack:** Hugo static site generator, Bootstrap 5, Bootstrap Icons (already loaded)

---

## File Map

| Action | Path | Responsibility |
|--------|------|----------------|
| Create | `content/board/_index.md` | Section index (minimal, makes Hugo recognise the section) |
| Create | `content/board/anna-wynne.md` | Anna Wynne stub |
| Create | `content/board/blaine-cook.md` | Blaine Cook stub |
| Create | `content/board/cameron-wenaus.md` | Cameron Wenaus stub |
| Create | `content/board/deryk-wenaus.md` | Deryk Wenaus stub |
| Create | `content/board/matt-wynne.md` | Matt Wynne stub |
| Create | `content/board/natasha-carolan.md` | Natasha Carolan stub |
| Create | `content/board/sonja-logtenberg.md` | Sonja Logtenberg stub |
| Create | `layouts/board/single.html` | Profile page template |
| Modify | `content/about.md` | Link board names to profile pages |

---

### Task 1: Create the board section index

**Files:**
- Create: `content/board/_index.md`

- [ ] **Step 1: Create the section index file**

```markdown
---
title: "Board"
---
```

Save to `content/board/_index.md`.

- [ ] **Step 2: Verify Hugo recognises the section**

Run:
```bash
hugo list all 2>/dev/null | grep board
```
Expected: no output yet (no member pages), but no error either. If `hugo list all` errors, run `hugo` and check for parse errors.

- [ ] **Step 3: Commit**

```bash
git add content/board/_index.md
git commit -m "feat: add board content section"
```

---

### Task 2: Create stub content files for all 7 board members

**Files:**
- Create: `content/board/anna-wynne.md`
- Create: `content/board/blaine-cook.md`
- Create: `content/board/cameron-wenaus.md`
- Create: `content/board/deryk-wenaus.md`
- Create: `content/board/matt-wynne.md`
- Create: `content/board/natasha-carolan.md`
- Create: `content/board/sonja-logtenberg.md`

- [ ] **Step 1: Create all 7 member files**

`content/board/anna-wynne.md`:
```markdown
---
title: "Anna Wynne"
photo: ""
bio: ""
---
```

`content/board/blaine-cook.md`:
```markdown
---
title: "Blaine Cook"
photo: ""
bio: ""
---
```

`content/board/cameron-wenaus.md`:
```markdown
---
title: "Cameron Wenaus"
photo: ""
bio: ""
---
```

`content/board/deryk-wenaus.md`:
```markdown
---
title: "Deryk Wenaus"
photo: ""
bio: ""
---
```

`content/board/matt-wynne.md`:
```markdown
---
title: "Matt Wynne"
photo: ""
bio: ""
---
```

`content/board/natasha-carolan.md`:
```markdown
---
title: "Natasha Carolan"
photo: ""
bio: ""
---
```

`content/board/sonja-logtenberg.md`:
```markdown
---
title: "Sonja Logtenberg"
photo: ""
bio: ""
---
```

- [ ] **Step 2: Verify Hugo generates 7 board pages**

Run:
```bash
hugo list all 2>/dev/null | grep board
```
Expected: 7 lines, one per member, each showing a `/board/<slug>/` URL.

- [ ] **Step 3: Commit**

```bash
git add content/board/
git commit -m "feat: add board member stub content files"
```

---

### Task 3: Create the board profile layout

**Files:**
- Create: `layouts/board/single.html`

This layout must:
1. Extend `baseof.html` via the `"main"` block
2. Show a photo if `.Params.photo` is set, otherwise a Bootstrap placeholder box using Bootstrap Icons (already loaded via CDN)
3. Show `.Title` as an `<h1>`
4. Show `.Params.bio` if set, otherwise muted *"Bio coming soon."*
5. Show a nav strip linking all board members, with the current member displayed in bold (not a link)

- [ ] **Step 1: Create the layout file**

```html
{{ define "main" }}
  {{ $boardPages := where .Site.RegularPages "Section" "board" | sort "Title" }}
  <div class="container my-5">

    <nav class="mb-4">
      <ul class="list-inline">
        {{ range $boardPages }}
          <li class="list-inline-item me-3">
            {{ if eq .RelPermalink $.RelPermalink }}
              <strong>{{ .Title }}</strong>
            {{ else }}
              <a href="{{ .RelPermalink }}">{{ .Title }}</a>
            {{ end }}
          </li>
        {{ end }}
      </ul>
    </nav>

    <div class="row">
      <div class="col-md-3 mb-4">
        {{ if .Params.photo }}
          <img
            src="{{ .Params.photo }}"
            alt="{{ .Title }}"
            class="img-fluid rounded"
          />
        {{ else }}
          <div
            class="bg-secondary rounded d-flex align-items-center justify-content-center"
            style="width: 200px; height: 200px;"
          >
            <i class="bi bi-person-fill text-white" style="font-size: 4rem;"></i>
          </div>
        {{ end }}
      </div>
      <div class="col-md-9">
        <h1>{{ .Title }}</h1>
        {{ if .Params.bio }}
          <p>{{ .Params.bio }}</p>
        {{ else }}
          <p class="text-muted">Bio coming soon.</p>
        {{ end }}
      </div>
    </div>

  </div>
{{ end }}
```

Save to `layouts/board/single.html`.

- [ ] **Step 2: Start dev server and verify a profile page renders**

Run:
```bash
hugo server
```
Open `http://localhost:1313/board/anna-wynne/` in a browser.

Expected:
- Nav strip shows all 7 names; "Anna Wynne" is bold (not a link)
- Grey placeholder box with a person icon on the left
- "Anna Wynne" as `<h1>`
- "Bio coming soon." in muted text
- No layout errors in the terminal

- [ ] **Step 3: Verify nav links work**

Click another name in the nav strip (e.g. "Blaine Cook").

Expected: navigates to `/board/blaine-cook/`, "Blaine Cook" is now bold, "Anna Wynne" is a link again.

- [ ] **Step 4: Stop dev server and commit**

```bash
git add layouts/board/single.html
git commit -m "feat: add board member profile layout"
```

---

### Task 4: Link board member names on the About page

**Files:**
- Modify: `content/about.md`

- [ ] **Step 1: Replace the plain name list with linked names**

In `content/about.md`, replace:

```markdown
## Board

* Deryk Wenaus
* Cameron Wenaus
* Natasha Carolan
* Blaine Cook
* Sonja Logtenberg
* Anna Wynne
* Matt Wynne
```

With:

```markdown
## Board

* [Deryk Wenaus](/board/deryk-wenaus/)
* [Cameron Wenaus](/board/cameron-wenaus/)
* [Natasha Carolan](/board/natasha-carolan/)
* [Blaine Cook](/board/blaine-cook/)
* [Sonja Logtenberg](/board/sonja-logtenberg/)
* [Anna Wynne](/board/anna-wynne/)
* [Matt Wynne](/board/matt-wynne/)
```

- [ ] **Step 2: Start dev server and verify links**

Run:
```bash
hugo server
```
Open `http://localhost:1313/about/`.

Expected:
- All 7 board member names are clickable links
- Clicking each link navigates to the correct profile page

- [ ] **Step 3: Stop dev server and commit**

```bash
git add content/about.md
git commit -m "feat: link board member names to profile pages"
```
