# Registry

The package manifest for Akaere's Packages. Each `<distro>/<type>/<name>/<name>.toml` describes one package; the `distro` directory names the target distribution (currently only `archlinux/`, since that's all this project builds for — the layout leaves room for others later), and `type` names the package's source within it (currently only `aur/`).

To add or update a package, edit its toml and open a PR: the PR automatically gets a preview build with the file diff posted as a comment. Once merged to `main`, it's automatically built, signed, published to the package repository, and synced to the [website](https://packages.pysio.online). Packages with `autoupdate = true` are checked daily against their AUR upstream, and a bump PR is opened automatically when a new version is available.

## Packages

<!-- PACKAGE_TABLE:START -->
| Package | Distro | Source | Version | Autoupdate | Last Updated | Details |
|---|---|---|---|---|---|---|
| asusctl | archlinux | aur | 6.4.0-1 | yes | - | [details](https://packages.pysio.online/packages/asusctl/) |
| rog-control-center | archlinux | aur | 6.4.0-1 | yes | - | [details](https://packages.pysio.online/packages/rog-control-center/) |
<!-- PACKAGE_TABLE:END -->

The table above is regenerated automatically after every publish — don't edit the content between the markers by hand.
