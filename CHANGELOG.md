# Changelog

All notable changes to this project are documented here. The format follows
[Keep a Changelog](https://keepachangelog.com/) and this project adheres to
[Semantic Versioning](https://semver.org/).

## [Unreleased]

### Fixed
- The Container workflow no longer carries a `paths:` filter, matching
  `examples/container.yml` and every other image in the fleet. The filter
  made build-once conditional on what a release commit happened to touch:
  `v1.0.1` promoted in 30s only because it bumped workflow refs, which the
  filter matched. A release that edits nothing but `CHANGELOG.md` would have
  gone ungated and forced a rebuild, as it does in `rhel10-bootc-server`.

### Changed
- The container release runs constitution v1.56.0 and sets `outside-image:
  VERSION CHANGELOG.md` (RT#1660). A release pull request, its merge and its
  `v*` tag reuse the digest the feature pull request built and gated, so a
  change costs one build and a release is a tag move.
- Gatehouse triage gets `review_result` from the review job, so a pull request
  whose review died before posting anything is held instead of passing.
- The container release runs constitution v1.51.0's `container-release.yml`
  (was v1.46.0) and grants it `issues: write`, so a failed scheduled rebuild
  opens an issue instead of only warning. A `v*` promote now also refuses an
  image whose `version` label names a different release of this repo.

## [1.0.1] - 2026-11-11

### Changed

- Constitution is now a v1.18.0 manifest: it holds only what is specific to
  this repo; fleet and profile rules apply by reference.
- Constitution validation is pinned to the inherited release via
  `.github/workflows/constitution.yml`.
- Dependabot auto-merges GitHub Actions minor and patch updates.

## [1.0.0] - 2026-09-20

First tagged release. This image has been running in production since
before it had version control; this release marks the current state as
the baseline going forward.
