# Arsvine Realm Dev Team

**Arsvine Realm Dev Team** is the development organization responsible for maintaining projects related to **ARSVINE**.

This organization is not a traditional commercial team. Instead, it is an engineering namespace built around a personal digital space. It is used to centrally manage the site, writing tools, content pipelines, access control, and related infrastructure, so that projects with different responsibilities can maintain clear boundaries and avoid becoming entangled during long-term maintenance.

## Organization Role

Arsvine Realm Dev Team is mainly responsible for:

* Maintaining the public ARSVINE site and related frontend experiences
* Managing writing, publishing, and content synchronization tools
* Separating permission boundaries between public and private repositories
* Maintaining content rendering, cache invalidation, and access protection workflows
* Providing independent development space for future experimental features

Repositories in this organization are not created for the sake of quantity. They are separated by responsibility: public site, admin tools, content sources, short-form post data, and helper utilities are kept independent to avoid mixing code and data of different natures in a single repository.

## Design Principles

Projects in this organization are maintained according to the following principles:

* **Separation of responsibilities**: Public presentation, private writing, content storage, publishing workflows, and access control are maintained separately.
* **Minimum public surface**: Public repositories expose only the necessary site implementation, while sensitive content and write capabilities remain in private repositories or controlled environments.
* **Decoupling content from code**: Content updates should not frequently pollute main site development commits, nor should they always trigger a full-site redeployment.
* **Rollbackability and auditability**: Important content and configuration should preserve Git history where possible, making them easier to trace, revert, and maintain.
* **Lightweight by default**: Heavy CMS systems, databases, or complex backend systems should not be introduced unless they are necessary.
* **Long-term maintainability**: The project structure should support continuous writing, publishing, and evolution, rather than serving only a one-time deployment.

## Repository Boundaries

Repositories in this organization are generally divided into the following types:

### Public Site

Site projects intended for public access. They are responsible for page rendering, visual style, routing, SEO, public content presentation, and the user-facing browsing experience.

### Admin Tools

Management tools intended for the author. They are responsible for writing, previewing, publishing, index rebuilding, cache invalidation, and permission verification.

### Content Stores

Private content repositories used to store finalized articles, short-form post data, index files, or historical content archives. These repositories are usually not directly exposed to the public.

### Infrastructure Helpers

Auxiliary scripts or configuration projects used to handle deployment, synchronization, content conversion, validation, automation tasks, and other engineering workflows.

## Current Repositories

* `arsvine-realm`: Public site and primary browsing experience.
* `arsvine-admin`: Writing and publishing console.
* `arsvine-content`: Private storage repository for finalized content.
* `arsvine-tweets`: Private content source for short-form posts / tweet-like data.

## Current Direction

Arsvine Realm Dev Team is evolving toward a clearer multi-repository structure:

* The main site is responsible for public presentation.
* The admin side is responsible for writing and publishing.
* Private repositories store finalized content.
* Content updates are synchronized to the public site through indexes, caching, and revalidation mechanisms.
* Protected content is handled through an independent access workflow.

The goal of this structure is not to create complexity, but to ensure that each repository has one clearly defined responsibility, allowing ARSVINE to evolve steadily as a long-term personal digital space.

## Notes

This organization mainly serves the engineering maintenance and content publishing workflows of ARSVINE-related projects.

Project details, runtime behavior, and development conventions are defined by the documentation inside each repository.
