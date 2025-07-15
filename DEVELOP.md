# Develop!

This document is targeted at project developers. It helps people to make their
first steps. It also serves as a general entry to development documentation like
tooling configuration and usage.

The environment is expected to be Unix-like.

For core development activities, [uv](https://docs.astral.sh/uv/) is sufficient.
Other stuff just comes on top and is in any case handled by GitHub Actions. For
a complete development environment (Git hooks, Markdown formatting, etc.),
several other tools are required, all of which are managed with
[mise](https://mise.jdx.dev/dev-tools/).

Common tasks like initialization and runnings tests are covered by and
documented in [`Justfile`](./Justfile). To run a complete suite of tasks, just
invoke `just` without arguments.

This projects supports [Development Containers](https://containers.dev/). Check
out [`.devcontainer/README.md`](./.devcontainer/README.md) for more information.
