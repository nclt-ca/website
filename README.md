# Nelson Community Land Trust Website

A static website for the Nelson Community Land Trust, built with [Hugo](https://gohugo.io/) and [Bootstrap 5](https://getbootstrap.com/), and automatically deployed to GitHub Pages.

## About

The Nelson Community Land Trust (NCLT) is a non-profit community land trust working to transform the historic Jam Factory Building into a vibrant, community-owned studio and co-working space for Nelson's creative community.

## Development

### Quick Start with devenv

The easiest way to get started is using [devenv](https://devenv.sh/):

**Prerequisites:**

1. Install [Nix](https://nixos.org/download.html)
2. Install [direnv](https://direnv.net/docs/installation.html) and hook it into your shell
3. Install [devenv](https://devenv.sh/getting-started/)

**Getting Started:**

```bash
# Allow direnv to load the environment (first time only)
direnv allow

# Start the development server
dev

# Or run Hugo directly
hugo server --buildDrafts --buildFuture
```

The devenv setup includes:

- Hugo Extended
- Node.js (for Prettier)
- Go (for Hugo modules)

### Manual Setup

Alternatively, you can install dependencies manually:

> [!IMPORTANT]
> Running locally requires [Hugo Extended](https://gohugo.io/installation/) (v0.152.2 or later) to be installed.

Install npm dependencies:

```bash
npm install
```

Start the development server:

```bash
hugo server --buildDrafts --buildFuture
```

### Contributing

Contributions are welcome! Please make contributions in the form of a well-described [Pull Request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests).

For simple content changes, consider using the "Edit this page" link on any page to suggest changes directly.

## Deployment

The site is automatically built and deployed to GitHub Pages using GitHub Actions. The workflow is triggered by:

- **Push to `main` branch**: Immediately builds and deploys the site
- **Manual trigger**: Via the Actions tab in GitHub
- **Daily schedule**: Rebuilds every day at midnight Pacific Time (8 AM UTC)

> [!TIP]
> Deployments are typically live within 40 seconds.
