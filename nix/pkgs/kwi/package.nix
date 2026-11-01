{
  lib,
  stdenv,
  src,
  cmake,
  ninja,
  pkg-config,
  libghostty-vt,
  ghostty,
  zig_0_17,
  kdePackages,
}:

let
  # nixpkgs' libghostty-vt pins an older ghostty commit that lacks APIs
  # FindGhostty.cmake checks for (e.g. ghostty_selection_gesture_event).
  # Kwi targets the ghostty 1.4.0 release, which nixpkgs' ghostty already
  # packages along with its zig dependency cache; reuse both.
  libghostty-vt' =
    (libghostty-vt.override { zig_0_16 = zig_0_17; }).overrideAttrs
      (_: {
        version = "0.1.0-dev+ghostty.${ghostty.version}";
        inherit (ghostty) src deps;
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
