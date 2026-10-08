# fhl.dc2.crunchtools.com Constitution

> **Version:** 1.1.0
> **Ratified:** 2026-05-08
> **Amended:** 2026-10-02
> **Status:** Active
> **Inherits:** [crunchtools/constitution](https://github.com/crunchtools/constitution) v1.21.0
> **Profile:** Container Image

This file holds what is specific to fhl.dc2.crunchtools.com. The fleet rules
and the Container Image profile apply at the inherited version and are checked
against this repo's files by `constitution.yml`. They are not restated here.

## Image Purpose

Fedora Hummingbird bootc VM image for homelab datacenter 2. A headless
developer workstation with kernel security testing tools. Primary use case:
testing kernel vulnerabilities (Dirty Frag / CVE-2026-43284, CVE-2026-43500)
and general development. Deployed as an image-mode VM via `bootc switch` or
`bootc install`. Published to `quay.io/crunchtools/fhl.dc2.crunchtools.com`.

## Base Image Choice

`quay.io/hummingbird-community/bootc-os:latest`: the Fedora Hummingbird Linux
bootc image, built by the Hummingbird pipeline with hermetic builds, RPM
lockfiles, CVE scanning, SBOM and attestation artifacts.

## Packages and Services

- **Packages:** gcc, glibc-devel, make, git, gdb, binutils, findutils,
  python3-pip, less, file, which, tar, curl. vim, cockpit, strace, perf and
  bpftool are not available in the Hummingbird repo.
- **Services:** `fstrim.timer` enabled; default target `multi-user.target`.
- **System config:** timezone America/New_York; `etc/bashrc.customizations`
  appended to `/etc/bashrc`.
- **Final step:** `bootc container lint`, after transient logs and dnf caches
  are removed.

## History

| Version | Date | Changes |
|---------|------|---------|
| 1.0.0 | 2026-05-08 | Initial constitution |
| 1.0.1 | 2026-09-25 | Gatehouse review, triage and pre-commit gates |
| 1.1.0 | 2026-10-02 | Manifest under constitution v1.18.0: fleet and profile restatement removed, image specifics kept |
