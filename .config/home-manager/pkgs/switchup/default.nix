{ pkgs ? import <nixpkgs> { }, stdenv ? pkgs.stdenv
, fetchFromGitHub ? pkgs.fetchFromGitHub, lib ? pkgs.lib }:

stdenv.mkDerivation rec {
  pname = "switchup";
  version = "v0.0.1";
  src = fetchFromGitHub {
    owner = "redxtech";
    repo = "switchup";
    rev = "80096cae493f1ce713602ccc1b2479045384869d";
    hash = "sha256-o1hkufkn/QYPx62L+Zl6WZFp5fJECe/qZiUGd2T9jzE=";
  };

  propagatedBuildInputs = with pkgs; [ curl gh unzip p7zip ];

  installPhase = ''
    install -dm 755 $out/bin
    install -dm 755 $out/share

    cp --no-preserve='ownership' ${src}/bin/switchup $out/bin
    cp -r --no-preserve='ownership' ${src}/share/switchup $out/share
  '';
}
