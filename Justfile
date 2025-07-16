set dotenv-load

set shell := [
  "bash",
  "-o", "errexit", "-o", "nounset", "-o", "pipefail",
  "-O", "extglob", "-O", "globstar", "-O", "nullglob",
  "-c"
]

# Init, fix, check, and test.
default: init fix check test

# Initialize environment.
init:
  # Create local-only directories.
  mkdir -p \
    .cache \
    .local \
    .tmp

  # Set up mise environment.
  mise --version
  mise install

  # Check mise tool availability.
  mise exec -- exec-cmds-defer-errors --version
  mise exec -- filter-pre-commit-hooks --version
  mise exec -- mdformat --version
  mise exec -- pre-commit --version
  mise exec -- shellcheck --version
  mise exec -- shfmt --version
  mise exec -- yamlfmt --version

  # Check tool availability.
  uv --version

  # Install pre-commit hooks.
  pre-commit install --install-hooks
  pre-commit install --install-hooks --hook-type commit-msg
  pre-commit install --install-hooks --hook-type post-checkout
  pre-commit install --install-hooks --hook-type post-merge

  # Initialize project with uv.
  uv sync --all-extras --dev

# Update dependencies.
update:
  # Update tools managed with Homebrew.
  brew upgrade

  # Update tools managed with mise.
  mise upgrade --bump

  # Update pre-commit repositories and hooks.
  pre-commit autoupdate

  # Update project deps managed with uv.
  uv sync --upgrade --all-extras --dev

# Run recipes that fix stuff.
fix:
  exec-cmds-defer-errors \
    "just fix--pre-commit" \
    "just fix--mdformat" \
    "just fix--shfmt"

# Run pre-commit hooks that fix stuff.
fix--pre-commit:
  ./scripts/run-pre-commit-fixes.bash

# Format Markdown files with mdformat.
fix--mdformat:
  mdformat **/*.md

# Format shell scripts with shfmt.
fix--shfmt:
  shfmt --list --write **/*.bash **/*.sh

# Run recipes that check stuff.
check:
  exec-cmds-defer-errors \
    "just check--pre-commit" \
    "just check--shellcheck" \
    "just check--ansible"

# Run pre-commit hooks that check stuff.
check--pre-commit:
  ./scripts/run-pre-commit-checks.bash

# Lint shell scripts with ShellCheck.
check--shellcheck:
  shellcheck **/*.bash **/*.sh

# Lint Ansible files with ansible-lint.
check--ansible:
  uv run ansible-lint

# Test role with Molecule.
test:
  uv run molecule test -s default

# Run role against localhost.
run:
  uv run ansible-playbook playbook.yaml

# Create release notes based on changelog.
[group('misc')]
create-release-notes:
  ./scripts/create-release-notes.bash CHANGELOG.md .tmp/release-notes.md
