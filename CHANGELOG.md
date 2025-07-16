# Changelog

All notable changes to this project are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0),
and adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0).

## Unreleased

Nothing.

## [1.0.0](https://github.com/trallnag/ansible-role-aws-sam-cli/compare/v0.1.0...v1.0.0) / 2024-07-17

### Changed

- Switched permissions of temporary artifacts from `u=rw,g=r,o=r` to
  `u=rw,g=,o=`.
- Updated public key.
- Changed license from Apache-2.0 to ISC.
- Added additional underscore to all variables.
- Changed default install dir to `/usr/local/aws-sam-cli`.

## [0.1.0](https://github.com/trallnag/ansible-role-aws-sam-cli/compare/25fe7a005901b3ab35131672700edfe869ed15dc...v0.1.0) / 2024-05-20

Initial release.
