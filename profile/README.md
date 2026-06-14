# Arsvine Realm Dev Team

Arsvine Realm Dev Team is the development organization behind the ARSVINE web presence: a stylized personal realm for portfolio work, long-form writing, short-form signals, and protected writing flows.

We build around a simple split:

- `arsvine-realm` serves the public-facing experience.
- `arsvine-admin` handles authoring and publishing.
- `arsvine-content` stores canonical private post content.
- `arsvine-tweets` stores private tweet data for runtime rendering.

## Projects

### `arsvine-realm`

The main public site.

- Portfolio and project presentation
- Public blog and posts archive
- Tweets page rendered from a private content source
- TOTP-protected writing access flow
- Locale-aware routing and presentation

### `arsvine-admin`

The writing and publishing console.

- Admin login and session flow
- Markdown writing and preview
- Publish to the private content repository
- Rebuild indexes
- Trigger public-site revalidation

### `arsvine-content`

The canonical private content store.

- `posts/YYYY/slug.md`
- `posts-index.json`
- Archived legacy multilingual blog sources

### `arsvine-tweets`

The private tweets source.

- `tweets/index.json`
- `tweets/YYYY-MM.json`
- GitHub-driven update flow for public-site refresh

## Current Direction

The organization is moving toward a cleaner separation between:

- public delivery
- private authoring
- canonical content storage
- protected reading access

This keeps sensitive content, write permissions, and public rendering responsibilities clearly separated.

## Writing System

The current writing system is designed around:

- private GitHub-backed storage
- server-side content reads
- controlled publishing from admin
- selective protection for sensitive posts through TOTP

## Notes

- Public repositories may expose implementation details of the site itself.
- Private repositories hold canonical content or authoring infrastructure.
- The organization profile is intentionally concise; project-specific details live in each repository.
