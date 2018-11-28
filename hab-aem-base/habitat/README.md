# Habitat package: hab-aem-base

## Description

The successful build will produce an artifact that contains the downloaded AEM install file as well as licensing information. This artifact dependency is referenced by subsequent builds of Author and Publisher.

## Usage

Apply the edits below to the `plan.sh` file.
* `pkg_origin` should to your origin name
* `pkg_source` should be revised to point to your source for the AEM installation file (e.g., AEM_6.3_Quickstart.jar) NOTE: This plan assumes this example source file name. If your file name differs, additional edits may be needed throughout.
* `pkg_shasum` should be revised to match your source file pkg_shasum

Apply the edits below to the `default.toml` file.
* `customer_name` should be revised to your customer customer_name
* `product_version` should be revised as needed
* `download_id` should be revised to your customer license ID

Execute a `build` from within the hab-aem-base directory.
