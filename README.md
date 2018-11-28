# hab-aem

# Summary
This Chef Habitat repo can be used to stand-up Adobe Experience Manager (AEM) Author, Publisher, as well as deploy AEM content. It can be leveraged for production deployments with a few changes as well as for demonstrative purposes.

Each of the 3 subdirectories (hab-aem-author, hab-aem-publisher, and hab-aem-base) must be 'built' according to the README contained within each.

The remaining directory (comp-pkg) is intended to server as an example of how AEM content (e.g., a website) could be deployed as a .hart file to allow its content to be 'synced' to a large AEM infrastructure communicating via Habitat ring. This would solve one of the challenges among AEM users.

The terraform directory can be used to instantiate cloud infrastructure to run the AEM applications on, however, additional edits are needed, as in the present state, the infra is only stood up with `terraform apply`.

## Usage
Before entering the Hab studio be sure to export Docker environment variables to port forward the AEM ports to your local machine, if testing locally.
e.g., `export HAB_DOCKER_OPTS="-p 4502:4502 -p 4503:4503"`

Enter the Hab studio from the root level of this repo. This will allow you to build each of the artifacts from separate subdirectories without exiting the studio
`hab studio enter`

Navigate into each of the 3 subdirectories (hab-aem-author, hab-aem-publisher, and hab-aem-base) and perform the steps as indicated within their README and build each artifact.

After all 3 artifacts are built, you can launch both Author and Publisher from within the studio as follows:

`hab svc load aem-author` will take about 10-15min to be available via web browser at http://localhost:4503. You can monitor the log with `sup-log` for progress.

The final log output appears as follows:
```bash
aem-author.default(O): RAWProcessor succesfully installed
aem-author.default(O): Opening browser using cmd=x-www-browser "http://localhost:4503/"  || gnome-open "http://localhost:4503/"  || firefox "http://localhost:4503/"  || mozilla "http://localhost:4503/"  || konqueror "http://localhost:4503/"  || netscape "http://localhost:4503/"  || chromium-browser "http://localhost:4503/"  || opera "http://localhost:4503/"  || links "http://localhost:4503/"  || lynx "http://localhost:4503/"
aem-author.default(O): Installation time:487 seconds
aem-author.default(O): http://localhost:4503/
aem-author.default(O): Quickstart started
```

`hab svc load aem-publisher --bind author:aem-author.default` will also take several minutes to become available via web browser at http://localhost:4502. You can monitor the log with `sup-log` for progress.

Nearing the end of the log output you'll see:
```bash
aem-publisher.default(O): Opening browser using cmd=x-www-browser "http://localhost:4502/"  || gnome-open "http://localhost:4502/"  || firefox "http://localhost:4502/"  || mozilla "http://localhost:4502/"  || konqueror "http://localhost:4502/"  || netscape "http://localhost:4502/"  || chromium-browser "http://localhost:4502/"  || opera "http://localhost:4502/"  || links "http://localhost:4502/"  || lynx "http://localhost:4502/"
aem-publisher.default(O): Installation time:572 seconds
aem-publisher.default(O): http://localhost:4502/
aem-publisher.default(O): Quickstart started
```

TO DO:
Add info on how to run AEM from the terraform instances (either manually or via terraform)
* Copy the .hart files to instances (scp or terraform, reference: https://www.terraform.io/docs/provisioners/file.html & https://github.com/habitat-sh/on-prem-builder/blob/master/terraform/aws/main.tf#L132
)
* hab pkg install </path/to/hart> to make pkg available
* hab svc load commands as above
