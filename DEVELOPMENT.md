# Development

This document is targeted at project developers. It helps people to make their
first steps. It also serves as a general entry to development documentation like
tooling configuration and usage.

## Requirements

Your environment should fulfill the following basic requirements:

- [Poetry](https://python-poetry.org). For Python dependency management.
- [Pre-commit](https://pre-commit.com). For managing and maintaining hooks.
- [Just](https://github.com/casey/just). For running tasks.
- Unix-like. Not required by itself, but assumed as the standard.

In addition to the following sections in this document, note that the
[`docs/devel`](docs/devel) directory contains more documentation including
further information about the tooling listed above.

## Initial Setup

Environment can be set up with:

```sh
just init
```

Run all hooks to make sure things are alright:

```shell
pre-commit run -a
```

### Running Tests

Ansible Molecule is used for testing this role. Tests can be triggered with:

```shell
just test
```

Note that the existing Molecule scenarios are hardcoded to use Docker as
provider. So Docker must be available on the system to run tests.

## FAQ

### Why is the extension `.yml` used instead of `.yaml`?

Molecule ignores YAML files that use the `.yaml` extension. See the following
links for more information:

- <https://github.com/ansible-community/molecule/issues/3849>
- <https://github.com/ansible-community/molecule/discussions/3910>
