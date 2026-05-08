# fhl.dc2.crunchtools.com Constitution

> **Version:** 1.0.0
> **Ratified:** 2026-05-08
> **Status:** Active
> **Inherits:** [crunchtools/constitution](https://github.com/crunchtools/constitution) v1.0.0
> **Profile:** Container Image

Fedora Hummingbird bootc VM image for homelab datacenter 2 (breetai). Developer workstation with kernel security testing tools. Primary use case: testing kernel vulnerabilities (Dirty Frag / CVE-2026-43284, CVE-2026-43500) and general development.

---

## License

AGPL-3.0-or-later

## Versioning

Follow Semantic Versioning 2.0.0. MAJOR/MINOR/PATCH.

## Base Image

`quay.io/hummingbird-community/bootc-os:latest` — Fedora Hummingbird Linux bootc image built by the Hummingbird pipeline with hermetic builds, RPM lockfiles, CVE scanning, SBOM, and attestation artifacts.

## Registry

Published to `quay.io/crunchtools/fhl.dc2.crunchtools.com`.

## Containerfile Conventions

- Uses `Containerfile` (not Dockerfile)
- `dnf install -y --nodocs` followed by `dnf clean all`
- systemd services enabled: fstrim.timer
- `systemctl set-default multi-user.target` (headless server)
- `bootc container lint` as final build step

## Packages Installed

gcc, glibc-devel, make, git, gdb, binutils, findutils, python3-pip, less, file, which, tar, curl

Note: vim, cockpit, strace, perf, bpftool are not available in the Hummingbird repo.

## Runtime

Deployed as bootc image-mode VM on breetai via `bootc switch` or `bootc install`.

## Testing

- **Build test**: CI builds the image on every push to main

## Quality Gates

1. Build — CI builds the Containerfile successfully
