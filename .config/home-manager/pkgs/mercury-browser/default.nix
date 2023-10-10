{ lib
, stdenv
, fetchurl
, autoPatchelfHook
, dpkg
, wrapGAppsHook
, alsa-lib
, browserpass
, bukubrow
, cairo
, cups
, dbus
, dbus-glib
, ffmpeg
, fontconfig
, freetype
, fx-cast-bridge
, glib
, glibc
, gnome-browser-connector
, gtk3
, harfbuzz
, libcanberra
, libdbusmenu
, libdbusmenu-gtk3
, libglvnd
, libjack2
, libkrb5
, libnotify
, libpulseaudio
, libva
, lyx
, mesa
, nspr
, nss
, opensc
, pango
, pciutils
, pipewire
, plasma5Packages
, sndio
, speechd
, tridactyl-native
, udev
, uget-integrator
, vulkan-loader
, xdg-utils
, xorg
}:

stdenv.mkDerivation rec {
  pname = "mercury-browser";
  version = "115.4.0";

  src = fetchurl {
    url = "https://github.com/Alex313031/Mercury/releases/download/v.${version}/mercury-browser_${version}_amd64.deb";
    hash = "sha256-78b2QEgf312TDBIy4lXzYUBtTfdNui3VJBbyDfXqOtc=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
    dpkg
    wrapGAppsHook
  ];

  buildInputs = [
    stdenv.cc.cc.lib
    alsa-lib
    browserpass
    bukubrow
    cairo
    cups
    dbus
    dbus-glib
    ffmpeg
    fontconfig
    freetype
    fx-cast-bridge
    glib
    glibc
    gnome-browser-connector
    gtk3
    harfbuzz
    libcanberra
    libdbusmenu
    libdbusmenu-gtk3
    libglvnd
    libjack2
    libkrb5
    libnotify
    libpulseaudio
    libva
    lyx
    mesa
    nspr
    nss
    opensc
    pango
    pciutils
    pipewire
    plasma5Packages.plasma-browser-integration
    sndio
    speechd
    tridactyl-native
    udev
    uget-integrator
    vulkan-loader
    xdg-utils
    xorg.libxcb
    xorg.libX11
    xorg.libXcursor
    xorg.libXcomposite
    xorg.libXdamage
    xorg.libXext
    xorg.libXfixes
    xorg.libXi
    xorg.libXrandr
    xorg.libXrender
    xorg.libXtst
    xorg.libXxf86vm
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out
    cp -r usr/* $out

    substituteInPlace $out/share/applications/mercury-browser.desktop \
      --replace Exec=mercury-browser Exec=$out/bin/mercury-browser \
      --replace StartupWMClass=mercury StartupWMClass=mercury-default \
      --replace Icon=mercury Icon=$out/share/icons/hicolor/512x512/apps/mercury.png
    addAutoPatchelfSearchPath $out/lib/mercury
    substituteInPlace $out/bin/mercury-browser \
      --replace 'export LD_LIBRARY_PATH' "export LD_LIBRARY_PATH=\$LD_LIBRARY_PATH:${ lib.makeLibraryPath buildInputs }:$out/lib/mercury" \
      --replace /usr $out

    runHook postInstall
  '';

  meta = with lib; {
    description = "Compiler-optimized private Firefox fork";
    homepage = "https://thorium.rocks/mercury";
    sourceProvenance = with sourceTypes; [ binaryNativeCode ];
    license = licenses.unfree;
    platforms = [ "x86_64-linux" ];
    mainProgram = "mercury-browser";
  };
}
