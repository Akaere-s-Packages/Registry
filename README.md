# Registry

The package manifest for Akaere's Packages. Each `<distro>/<type>/<name>/<name>.toml` describes one package; the `distro` directory names the target distribution (currently only `archlinux/`, since that's all this project builds for — the layout leaves room for others later), and `type` names the package's source within it (currently only `aur/`).

To add or update a package, edit its toml and open a PR: the PR automatically gets a preview build with the file diff posted as a comment. Once merged to `main`, it's automatically built, signed, published to the package repository, and synced to the [website](https://packages.pysio.online). Packages with `autoupdate = true` are checked daily against their AUR upstream, and a bump PR is opened automatically when a new version is available.

To remove a package, run the **remove-package** workflow with its name (Actions → remove-package → Run workflow): it opens a PR deleting the manifest, and merging that PR is what actually drops the package from the published repository — the build pipeline repo-removes it from the pacman database and deletes its files from storage. It refuses if another package here still hard-depends on it; if those are going too, list every name at once, comma-separated.

## Nix binary cache

`nix/flake.nix` re-exports upstream flake packages (currently `omp` from `github:can1357/oh-my-pi`). Every day the **nix-cache** workflow updates `nix/flake.lock` to each upstream's latest commit, builds every `packages.x86_64-linux` attribute, pushes the results to the [`akaere` Cachix cache](https://app.cachix.org/cache/akaere), and commits the new lock — only after everything built and was pushed, so the committed lock is always fully cached. A day with no upstream change builds nothing. To add a flake, add an input and a `packages.x86_64-linux` attribute to `nix/flake.nix`; the push builds it right away.

A store path only matches when the consumer evaluates the same lock, so follow this flake's inputs instead of tracking upstream directly:

```nix
{
  inputs = {
    akaere.url = "github:Akaere-s-Packages/Registry?dir=nix";
    omp.follows = "akaere/omp";
  };
}
```

and trust the cache (NixOS):

```nix
nix.settings = {
  extra-substituters = [ "https://akaere.cachix.org" ];
  extra-trusted-public-keys = [ "akaere.cachix.org-1:tGTjjFMhKZFaxBrRo/8dpWjjEjXttHhqBJcX4ix5NzQ=" ];
};
```

`nix flake update akaere` then pulls the latest cached revision. Requires the `CACHIX_AUTH_TOKEN` secret (a write token for `akaere`).

## Packages

<!-- PACKAGE_TABLE:START -->
| Package | Distro | Source | Version | Autoupdate | Last Updated | Details |
|---|---|---|---|---|---|---|
| 1password | archlinux | aur | 8.12.42-36 | yes | 2026-10-20 | [details](https://packages.pysio.online/packages/1password/) |
| asusctl | archlinux | aur | 6.4.0-1 | yes | 2026-09-13 | [details](https://packages.pysio.online/packages/asusctl/) |
| claude-code | archlinux | aur | 2.1.312-1 | yes | 2026-10-27 | [details](https://packages.pysio.online/packages/claude-code/) |
| datagrip | archlinux | aur | 2026.2.6-1 | yes | 2026-10-10 | [details](https://packages.pysio.online/packages/datagrip/) |
| github-copilot-cli | archlinux | aur | 1.0.105-1 | yes | 2026-10-28 | [details](https://packages.pysio.online/packages/github-copilot-cli/) |
| google-chrome | archlinux | aur | 156.0.8078.73-1 | yes | 2026-10-28 | [details](https://packages.pysio.online/packages/google-chrome/) |
| infisical | archlinux | aur | 0.44.8-1 | yes | 2026-10-23 | [details](https://packages.pysio.online/packages/infisical/) |
| linuxqq | archlinux | aur | 5:3.2.34_53644-1 | yes | 2026-09-23 | [details](https://packages.pysio.online/packages/linuxqq/) |
| lolia-cli | archlinux | aur | 0.71.0-1 | yes | 2026-09-13 | [details](https://packages.pysio.online/packages/lolia-cli/) |
| netbird-bin | archlinux | aur | 0.81.5-1 | yes | 2026-10-26 | [details](https://packages.pysio.online/packages/netbird-bin/) |
| nexttrace-bin | archlinux | aur | 1.7.5-1 | yes | 2026-10-26 | [details](https://packages.pysio.online/packages/nexttrace-bin/) |
| noto-fonts-sc | archlinux | aur | 2:20210430-2 | yes | 2026-09-13 | [details](https://packages.pysio.online/packages/noto-fonts-sc/) |
| oh-my-pi-bin | archlinux | aur | 18.13.2-1 | yes | 2026-10-27 | [details](https://packages.pysio.online/packages/oh-my-pi-bin/) |
| oopz | archlinux | aur | 1.0.0-1 | yes | 2026-09-13 | [details](https://packages.pysio.online/packages/oopz/) |
| opencode-bin | archlinux | aur | 1.19.5-1 | yes | 2026-10-28 | [details](https://packages.pysio.online/packages/opencode-bin/) |
| paru | archlinux | aur | 2.1.0-2 | yes | 2026-09-13 | [details](https://packages.pysio.online/packages/paru/) |
| pi | archlinux | aur | 1.4.0-2 | yes | 2026-10-25 | [details](https://packages.pysio.online/packages/pi/) |
| python-zxing-cpp | archlinux | aur | 3.1.1-2 | yes | 2026-09-13 | [details](https://packages.pysio.online/packages/python-zxing-cpp/) |
| repoq | archlinux | aur | 0.2.1-1 | yes | 2026-09-13 | [details](https://packages.pysio.online/packages/repoq/) |
| rog-control-center | archlinux | aur | 6.4.0-1 | yes | 2026-09-13 | [details](https://packages.pysio.online/packages/rog-control-center/) |
| samsung-unified-driver | archlinux | aur | 1.00.39-11 | yes | 2026-09-13 | [details](https://packages.pysio.online/packages/samsung-unified-driver/) |
| samsung-unified-driver-common | archlinux | aur | 1.00.39-11 | yes | 2026-09-13 | [details](https://packages.pysio.online/packages/samsung-unified-driver-common/) |
| samsung-unified-driver-printer | archlinux | aur | 1.00.39-11 | yes | 2026-09-13 | [details](https://packages.pysio.online/packages/samsung-unified-driver-printer/) |
| samsung-unified-driver-scanner | archlinux | aur | 1.00.39-11 | yes | 2026-09-13 | [details](https://packages.pysio.online/packages/samsung-unified-driver-scanner/) |
| sparkle-bin | archlinux | aur | 1.26.9-1 | yes | 2026-10-09 | [details](https://packages.pysio.online/packages/sparkle-bin/) |
| supergfxctl | archlinux | aur | 5.2.7-2 | yes | 2026-09-13 | [details](https://packages.pysio.online/packages/supergfxctl/) |
| visual-studio-code-bin | archlinux | aur | 1.143.1-1 | yes | 2026-10-23 | [details](https://packages.pysio.online/packages/visual-studio-code-bin/) |
| yubico-authenticator | archlinux | aur | 7.4.1-2 | yes | 2026-09-13 | [details](https://packages.pysio.online/packages/yubico-authenticator/) |
| zulu-17-bin | archlinux | aur | 17.0.20.1-1 | yes | 2026-09-22 | [details](https://packages.pysio.online/packages/zulu-17-bin/) |
| zulu-21-bin | archlinux | aur | 21.0.12.1-1 | yes | 2026-09-13 | [details](https://packages.pysio.online/packages/zulu-21-bin/) |
<!-- PACKAGE_TABLE:END -->

The table above is regenerated automatically after every publish — don't edit the content between the markers by hand.
