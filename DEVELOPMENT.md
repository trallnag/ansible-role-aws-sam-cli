# Development

This document is targeted at project developers. It helps people to make their
first steps. It also serves as a general entry to development documentation like
tooling configuration and usage.

## Requirements

Your environment should fulfill the following basic requirements:

- [Poetry](https://python-poetry.org). For Python dependency management.
- [Pre-commit](https://pre-commit.com). For managing and maintaining hooks.
- [Task](https://taskfile.dev/). For running tasks.
- Unix-like. Not required by itself, but assumed as the standard.
- Docker. For running Molecule tests.

In addition to the following sections in this document, note that the
[`docs/devel`](docs/devel) directory contains more documentation including
further information about the tooling listed above.

## Initial Setup

Execute `task`. This will run several tasks defined as default in
[`Taskfile.yaml`](Taskfile.yaml), including formatting, linting, and testing.

## FAQ

### Why is the extension `.yml` used instead of `.yaml`?

Molecule ignores YAML files that use the `.yaml` extension. See the following
links for more information:

- <https://github.com/ansible-community/molecule/issues/3849>
- <https://github.com/ansible-community/molecule/discussions/3910>
