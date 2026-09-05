# Registry

The package manifest for Akaere's Packages. Each `<distro>/<type>/<name>/<name>.toml` describes one package; the `distro` directory names the target distribution (currently only `archlinux/`, since that's all this project builds for — the layout leaves room for others later), and `type` names the package's source within it (currently only `aur/`).

To add or update a package, edit its toml and open a PR: the PR automatically gets a preview build with the file diff posted as a comment. Once merged to `main`, it's automatically built, signed, published to the package repository, and synced to the [website](https://packages.pysio.online). Packages with `autoupdate = true` are checked daily against their AUR upstream, and a bump PR is opened automatically when a new version is available.

## Packages

<!-- PACKAGE_TABLE:START -->
| Package | Distro | Source | Version | Autoupdate | Last Updated | Details |
|---|---|---|---|---|---|---|
| 1password | archlinux | aur | 8.12.34-34 | yes | 2026-09-04 | [details](https://packages.pysio.online/packages/1password/) |
| asusctl | archlinux | aur | 6.4.0-1 | yes | 2026-09-04 | [details](https://packages.pysio.online/packages/asusctl/) |
| claude-code | archlinux | aur | 2.1.261-1 | yes | 2026-09-05 | [details](https://packages.pysio.online/packages/claude-code/) |
| github-copilot-cli | archlinux | aur | 1.0.83-1 | yes | 2026-09-05 | [details](https://packages.pysio.online/packages/github-copilot-cli/) |
| google-chrome | archlinux | aur | 152.0.7977.82-1 | yes | 2026-09-04 | [details](https://packages.pysio.online/packages/google-chrome/) |
| infisical | archlinux | aur | 0.43.129-1 | yes | 2026-09-04 | [details](https://packages.pysio.online/packages/infisical/) |
| linuxqq | archlinux | aur | 5:3.2.33_52892-1 | yes | 2026-09-04 | [details](https://packages.pysio.online/packages/linuxqq/) |
| lolia-cli | archlinux | aur | 0.71.0-1 | yes | 2026-09-04 | [details](https://packages.pysio.online/packages/lolia-cli/) |
| netbird-bin | archlinux | aur | 0.78.1-1 | yes | 2026-09-04 | [details](https://packages.pysio.online/packages/netbird-bin/) |
| noto-fonts-sc | archlinux | aur | 2:20210430-2 | yes | 2026-09-04 | [details](https://packages.pysio.online/packages/noto-fonts-sc/) |
| oh-my-pi-bin | archlinux | aur | 18.1.11-1 | yes | 2026-09-05 | [details](https://packages.pysio.online/packages/oh-my-pi-bin/) |
| oopz | archlinux | aur | 1.0.0-1 | yes | 2026-09-04 | [details](https://packages.pysio.online/packages/oopz/) |
| opencode-bin | archlinux | aur | 1.18.29-1 | yes | 2026-09-05 | [details](https://packages.pysio.online/packages/opencode-bin/) |
| paru | archlinux | aur | 2.1.0-2 | yes | 2026-09-04 | [details](https://packages.pysio.online/packages/paru/) |
| python-zxing-cpp | archlinux | aur | 3.1.1-2 | yes | 2026-09-04 | [details](https://packages.pysio.online/packages/python-zxing-cpp/) |
| repoq | archlinux | aur | 0.2.1-1 | yes | 2026-09-04 | [details](https://packages.pysio.online/packages/repoq/) |
| rog-control-center | archlinux | aur | 6.4.0-1 | yes | 2026-09-04 | [details](https://packages.pysio.online/packages/rog-control-center/) |
| samsung-unified-driver | archlinux | aur | 1.00.39-11 | yes | 2026-09-04 | [details](https://packages.pysio.online/packages/samsung-unified-driver/) |
| samsung-unified-driver-common | archlinux | aur | 1.00.39-11 | yes | 2026-09-04 | [details](https://packages.pysio.online/packages/samsung-unified-driver-common/) |
| samsung-unified-driver-printer | archlinux | aur | 1.00.39-11 | yes | 2026-09-04 | [details](https://packages.pysio.online/packages/samsung-unified-driver-printer/) |
| samsung-unified-driver-scanner | archlinux | aur | 1.00.39-11 | yes | 2026-09-04 | [details](https://packages.pysio.online/packages/samsung-unified-driver-scanner/) |
| sparkle-bin | archlinux | aur | 1.26.7-1 | yes | 2026-09-04 | [details](https://packages.pysio.online/packages/sparkle-bin/) |
| supergfxctl | archlinux | aur | 5.2.7-2 | yes | 2026-09-04 | [details](https://packages.pysio.online/packages/supergfxctl/) |
| visual-studio-code-bin | archlinux | aur | 1.136.1-1 | yes | 2026-09-04 | [details](https://packages.pysio.online/packages/visual-studio-code-bin/) |
| yubico-authenticator | archlinux | aur | 7.4.1-2 | yes | 2026-09-04 | [details](https://packages.pysio.online/packages/yubico-authenticator/) |
| zulu-17-bin | archlinux | aur | 17.0.20-1 | yes | 2026-09-04 | [details](https://packages.pysio.online/packages/zulu-17-bin/) |
| zulu-21-bin | archlinux | aur | 21.0.12.1-1 | yes | 2026-09-04 | [details](https://packages.pysio.online/packages/zulu-21-bin/) |
<!-- PACKAGE_TABLE:END -->

The table above is regenerated automatically after every publish — don't edit the content between the markers by hand.
