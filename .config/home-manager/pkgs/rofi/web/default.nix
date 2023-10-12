{ pkgs ? import <nixpkgs> { }, lib ? pkgs.lib
, writeShellApplication ? pkgs.writeShellApplication, useWayland ? false }:

with pkgs;
with lib;
writeShellApplication {
  name = "rofi-web";
  runtimeInputs = [ coreutils rofi xdg-utils ];

  text = ''
    declare -A ENGINES
    ENGINES=(
      ["kagi"]="https://kagi.com/search?q="
      ["searx"]="https://search.super.fish/search?q="
      ["google"]="https://www.google.com/search?q="
      ["bing"]="https://www.bing.com/search?q="
      ["yahoo"]="https://search.yahoo.com/search?p="
      ["duckduckgo"]="https://www.duckduckgo.com/?q="
      ["yandex"]="https://yandex.ru/yandsearch?text="
      ["github"]="https://github.com/search?q="
      ["goodreads"]="https://www.goodreads.com/search?q="
      ["stackoverflow"]="http://stackoverflow.com/search?q="
      ["symbolhound"]="http://symbolhound.com/?q="
      ["searchcode"]="https://searchcode.com/?q="
      ["openhub"]="https://www.openhub.net/p?ref=homepage&query="
      ["superuser"]="http://superuser.com/search?q="
      ["askubuntu"]="http://askubuntu.com/search?q="
      ["imdb"]="http://www.imdb.com/find?ref_=nv_sr_fn&q="
      ["rottentomatoes"]="https://www.rottentomatoes.com/search/?search="
      ["piratebay"]="https://thepiratebay.org/search/"
      ["youtube"]="https://www.youtube.com/results?search_query="
      ["vimawesome"]="http://vimawesome.com/?q="
    )

    gen_list() {
      echo "kagi"
      echo "searx"
      echo "duckduckgo"
      echo "google"
      echo "youtube"
      echo "github"
      echo "stackoverflow"
    }

    main() {
      if test "''${1:-}" = "default"; then
        platform="kagi"
      else
        platform=$( (gen_list) | rofi -dmenu -matching fuzzy -p "Search Engine 󰄾")
      fi

      if [[ -n "$platform" ]]; then
        query=$( (echo) | rofi -dmenu -no-sort -matching fuzzy -l 0 -p "Query 󰄾")

        if [[ -n "$query" ]]; then
          url=''${ENGINES[$platform]}$query
          xdg-open "$url"
        else
          exit
        fi
      else
        exit
      fi
    }

    main "$@"
  '';

  meta = with lib; {
    description = "A rofi menu to search the web";
    platforms = with platforms; linux;
  };
}
