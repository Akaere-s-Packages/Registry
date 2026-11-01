{
  description = "Akaere's Packages: upstream Nix flakes built daily into the akaere Cachix cache";

  # Only honoured for users listed in nix.settings.trusted-users; everyone
  # else (NixOS configs included) should add the substituter themselves.
  nixConfig = {
    extra-substituters = [ "https://akaere.cachix.org" ];
    extra-trusted-public-keys = [
      "akaere.cachix.org-1:tGTjjFMhKZFaxBrRo/8dpWjjEjXttHhqBJcX4ix5NzQ="
    ];
  };

  # Upstream flakes are deliberately NOT `follows`-overridden: the cached
  # store paths are only reusable by consumers that evaluate the exact same
  # derivation, i.e. the upstream rev plus upstream's own locked inputs.
  # Consumers get cache hits by following these inputs, e.g.
  #   inputs.akaere.url = "github:Akaere-s-Packages/Registry?dir=nix";
  #   inputs.omp.follows = "akaere/omp";
  inputs = {
    omp.url = "github:can1357/oh-my-pi";

    # Packages built here (not re-exported from an upstream flake) are
    # evaluated against this nixpkgs; follow it as `akaere/nixpkgs` to hit
    # the cache.
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    # Kwi has no releases yet; the daily lock update tracks master.
    kwi-src = {
      url = "git+https://invent.kde.org/utilities/kwi.git";
      flake = false;
    };
  };

  outputs =
    { omp, nixpkgs, kwi-src, ... }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in
    {
      # Every attribute here is built and pushed by workflow-build-kit's
      # nix-cache.yml. Only x86_64-linux is built.
      packages.x86_64-linux = {
        omp = omp.packages.x86_64-linux.default;
        kwi = pkgs.callPackage ./pkgs/kwi/package.nix { src = kwi-src; };
      };
    };
}
