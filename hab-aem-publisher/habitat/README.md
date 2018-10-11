# Habitat package: hab-aem-publisher

## Description

The successful build will produce an artifact that installs and configures AEM Publisher. This build is dependent on the AEM Base artifict that should have been previously produced.

## Usage

Apply the edits below to the `plan.sh` file.
* `pkg_origin` should to your origin
* `pkg_deps` should reference your origin for aem-base

Apply any necessary edits to the `default.toml` file.

Apply the edits below to the `/hooks/init` file.
* Correct any origin references to reflect your origin customer_name

Execute a `build` from within the hab-aem-author directory.
