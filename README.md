# Arsvine Realm Dev Team `.github`

This repository stores the shared GitHub-facing description for the `Arsvine-Realm-Dev-Team` organization.

## Files

- `profile/README.md`
  The public organization profile shown on the GitHub organization homepage.

## Organization Repositories

- `arsvine-realm`
  Public-facing main site. Portfolio, blog, tweets page, protected posts access, and runtime reading from the private content repository.

- `arsvine-admin`
  Private admin panel for writing, publishing, rebuilding indexes, and triggering public-site revalidation.

- `arsvine-content`
  Private canonical content repository. Stores `posts/YYYY/slug.md`, `posts-index.json`, and archived legacy blog source files.

- `arsvine-tweets`
  Private tweets data repository. Stores `tweets/index.json` and month-based tweet files consumed server-side by the public site.

## Content Flow

1. Authors write and publish from `arsvine-admin`.
2. Published content is written into `arsvine-content`.
3. `arsvine-realm` reads `arsvine-content` server-side at runtime.
4. Protected posts are guarded by TOTP-based access verification.
5. Tweets are maintained separately in `arsvine-tweets` and rendered on the public site via server-side GitHub Contents API reads.

## Notes

- Public visitors should land on the organization profile page, not this repository README.
- Keep `profile/README.md` high-level, polished, and visitor-facing.
- Keep this file operational and maintainer-facing.
