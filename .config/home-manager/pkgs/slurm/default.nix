{ pkgs ? import <nixpkgs> {}
, stdenv ? pkgs.stdenv
, fetchFromGitHub ? pkgs.fetchFromGitHub
, lib ? pkgs.lib
}:

stdenv.mkDerivation rec {
  pname = "slurm";
  version = "0.4.4";
  src = fetchFromGitHub {
    owner = "mattthias";
    repo = "slurm";
    rev = "upstream/${version}";
    hash = "sha256-w77SIXFctMwwNw9cQm0HQaEaMs/5NXQjn1LpvkpCCB8=";
  };

  buildInputs = with pkgs; [meson ncurses6 ninja];

  buildPhase = ''
    meson setup
    meson compile
  '';

  installPhase = ''
    meson install
  '';
}
