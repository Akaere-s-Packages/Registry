{
  lib,
  stdenv,
  src,
  fetchzip,
  cmake,
  ninja,
  pkg-config,
  libghostty-vt,
  zig_0_17,
  kdePackages,
}:

let
  # Kwi requires libghostty-vt >= 1.0.1 (find_package(Ghostty 1.0.1)), but
  # nixpkgs' libghostty-vt is an unversioned 0.1.0 git snapshot. Build the
  # standalone 1.0.1 release instead, the same tarball + vendored zig
  # package cache kwi's own .flatpak-manifest.json pins.
  libghostty-vt' =
    (libghostty-vt.override { zig_0_16 = zig_0_17; }).overrideAttrs
      (finalAttrs: _: {
        version = "1.0.1";
        src = fetchzip {
          url = "https://release.files.ghostty.org/libghostty-vt/${finalAttrs.version}/libghostty-vt-${finalAttrs.version}.tar.gz";
          hash = "sha256-zGuLawiLRplgXoWllDefbR+QYoEiS0MhHG+EKWFFMjI=";
        };
        deps = fetchzip {
          url = "https://release.files.ghostty.org/libghostty-vt/${finalAttrs.version}/libghostty-vt-${finalAttrs.version}-deps.tar.gz";
          hash = "sha256-bqi6TjqxfMtLYyStfHeqZBPsapfdJHVT3ILxL7u+kEQ=";
        };
        # The release installs a relocatable CMake package (prefix derived
        # from its own location) and .pc files under lib/, so splitting a
        # dev output strands them away from the libraries they point at;
        # nixpkgs' snapshot-specific static-archive relocation doesn't apply.
        outputs = [ "out" ];
        postInstall = "";
        postFixup = "";
      });
in
stdenv.mkDerivation {
  pname = "kwi";
  # Upstream has no releases yet; track master. The base comes from
  # project(kwi VERSION ...) in CMakeLists.txt.
  version = "0.1.0-unstable-${
    lib.concatStringsSep "-" [
      (builtins.substring 0 4 src.lastModifiedDate)
      (builtins.substring 4 2 src.lastModifiedDate)
      (builtins.substring 6 2 src.lastModifiedDate)
    ]
  }";

  inherit src;

  strictDeps = true;

  nativeBuildInputs = [
    cmake
    ninja
    pkg-config
    kdePackages.extra-cmake-modules
    kdePackages.wrapQtAppsHook
    kdePackages.qtshadertools
  ];

  buildInputs = [
    libghostty-vt'
  ]
  ++ (with kdePackages; [
    qtbase
    qtdeclarative
    qtsvg
    qtshadertools
    kcoreaddons
    kconfig
    kdbusaddons
    kguiaddons
    ki18n
    kirigami
    kpty
    kio
    knotifications
    kwindowsystem
    kparts
    kxmlgui
    kwidgetsaddons
    kitemmodels
    qqc2-desktop-style
    kirigami-addons
    kirigami-app-components
  ]);

  cmakeFlags = [
    (lib.cmakeBool "BUILD_TESTING" false)
  ];

  meta = {
    description = "Modern and fast terminal for KDE Plasma built on libghostty-vt";
    homepage = "https://invent.kde.org/utilities/kwi";
    license = with lib.licenses; [
      gpl2Only
      gpl3Only
      lgpl21Only
      lgpl3Only
    ];
    mainProgram = "kwi";
    platforms = lib.platforms.linux;
  };
}
