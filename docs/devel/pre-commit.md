# Pre-commit

Used for managing Git hooks. Must be installed globally.

- [pre-commit.com](https://pre-commit.com)
- [github.com/pre-commit/pre-commit](https://github.com/pre-commit/pre-commit)

As it is written in Python, for example [`pipx`](https://github.com/pypa/pipx)
can be used to install it.

Pre-commit is configured via
[`.pre-commit-config.yaml`](../../.pre-commit-config.yaml).

## Housekeeping

### Update hooks

```shell
pre-commit autoupdate
```

## Cheat Sheet

### Run pre-commit against all files

```shell
pre-commit run -a
```

### Run specific hook against all files

```shell
pre-commit run -a $hook
```
