# Release

This document describes the release process and is targeted at maintainers.

## Preparation

Check the existing tags:

```sh
git tag --list --sort=taggerdate 'v*' | tail --lines=5
```

Pick a name for the new release. It must follow
[Semantic Versioning](https://semver.org):

```sh
VERSION=1.0.1
```

Bump the version constant in [`pyproject.toml`](./pyproject.toml):

```sh
sed --in-place "s/^version = \".*\"/version = \"$VERSION\"/" pyproject.toml
uv sync
```

Make sure that [`CHANGELOG.md`](./CHANGELOG.md) is up-to-date.

Adjust entries in the changelog for example by adding additional examples or
highlighting breaking changes.

Move the content of the "Unreleased" section that will be included in the new
release to a new section with an appropriate title for the release. Should the
"Unreleased" section now be empty, add "Nothing." to it.

## Trigger

Commit the changes. Make sure to sign the commit:

```sh
git add .
git commit --gpg-sign --message="chore: Prepare release v$VERSION"
git log --show-signature --max-count=1
```

Push changes:

```sh
git push origin master
```

Check
[workflow runs](https://github.com/trallnag/ansible-role-aws-sam-cli/actions?query=branch%3Amaster)
in GitHub Actions and ensure everything is fine.

Tag the latest commit with an annotated and signed tag:

```sh
git tag --sign --message="" v$VERSION
git show v$VERSION
```

Make sure that the tree looks good:

```sh
git log --graph --oneline --all --max-count=5
```

Push the tag itself:

```sh
git push origin v$VERSION
```

This triggers the release workflow which will import the role to Ansible Galaxy
and create a release draft. Monitor the
[release workflow](https://github.com/trallnag/ansible-role-aws-sam-cli/actions/workflows/release.yaml)
run and check the
[role on Ansible Galaxy](https://galaxy.ansible.com/ui/standalone/roles/trallnag/aws_sam_cli).

This triggers the
[release workflow](https://github.com/trallnag/ansible-role-aws-sam-cli/actions/workflows/release.yaml)
which will import the role to Ansible Galaxy and create a release draft.

## Wrap up

If everything is fine, go to the release page of this project on GitHub
[here](https://github.com/trallnag/ansible-role-aws-sam-cli/releases) and review
the automatically created release draft.

Publish the draft.
