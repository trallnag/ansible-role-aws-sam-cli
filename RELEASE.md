# Release

This document describes the release process and is targeted at maintainers.

## Preparation

Pick a name for the new release. It must follow
[Semantic Versioning](https://semver.org):

```shell
VERSION=1.0.1
```

Make sure that the "Unreleased" section in the [changelog](CHANGELOG.md) is
up-to-date. Feel free to adjust entries for example by adding additional
examples or highlighting breaking changes.

Move the content of the "Unreleased" section that will be included in the new
release to a new section with an appropriate title for the release. Should the
"Unreleased" section now be empty, add "Nothing." to it.

## Trigger

Commit the changes. Make sure to sign the commit:

```shell
git add .
git commit -S -m "chore: Prepare release v$VERSION"
```

Push changes:

```shell
git push origin master
```

Check
[workflow runs](https://github.com/trallnag/ansible-role-aws-sam-cli/actions?query=branch%3Amaster)
in GitHub Actions and ensure everything is fine.

Tag the latest commit with an annotated and signed tag:

```shell
git tag -s v$VERSION -m ""
```

Make sure that the tree looks good:

```shell
git log --graph --oneline --all -n 5
```

Push the tag itself:

```shell
git push origin v$VERSION
```

This triggers the
[release workflow](https://github.com/trallnag/ansible-role-aws-sam-cli/actions/workflows/release.yaml)
which will import the role to Ansible Galaxy and create a release draft.

## Wrap Up

Ensure that the new version has been imported to Ansible Galaxy
[here](https://galaxy.ansible.com/trallnag/aws_sam_cli).

Go to the release page of this project on GitHub
[here](https://github.com/trallnag/ansible-role-aws-sam-cli/releases) and review
the automatically created release draft.

Publish the release draft.
