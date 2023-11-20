{ pkgs ? import <nixpkgs> { }, lib ? pkgs.lib
, writeShellApplication ? pkgs.writeShellApplication }:

with pkgs;
with lib;
writeShellApplication {
  name = "rofi-youtube";
  runtimeInputs = [ choose coreutils curl dunst jq mpv rofi urlencode yt-dlp ];

  text = ''
    _rofi() {
      rofi -theme red -theme-str 'listview {columns: 1;}' -dmenu -i "$@"
    }

    main() {
      # dtermine the mode
      mode="''${1:-stream}"

      prompt="Stream YT"

      if test "$mode" = "download"; then
        prompt="Download YT"
      fi

      query="$(_rofi -l 0 -p "$prompt 󰄾")"

      # turn the query into a url
      YT_API_KEY="$(cat ~/.config/rofi/youtube.txt)"
      query="$(printf "%s" "$query" | urlencode)"
      urlstring="https://www.googleapis.com/youtube/v3/search?part=snippet&q=''${query}&type=video&maxResults=20&key=''${YT_API_KEY}"

      # fetch and parse the result
      search_selection="$(curl -s "$urlstring" \
        | jq -r '.items[] | "\(.snippet.channelTitle) => \(.snippet.title) => youtu.be/\(.id.videoId)"' \
        | _rofi -p 'Choose Video 󰄾')"

      # selected result
      search_result="$(echo "$search_selection" | awk '{print $NF}')"

      # url of the youtube video
      url="https://$search_result"

      # grab the name of the video
      selection_name="$(echo "$search_selection" | choose -f " => " 1)"

      echo "$mode"

      if test "$mode" = "download"; then
        if test "$(pwd)" = "$HOME"; then
          dl_path="$XDG_VIDEOS_DIR/YT/%(uploader)s/%(upload_date>%Y-%m-%d)s - %(title)s (%(id)s).%(ext)s"
        else
          dl_path="[%(uploader)s] - %(upload_date>%Y-%m-%d)s - %(title)s (%(id)s).%(ext)s"
        fi

        yt-dlp \
          --output "$dl_path" \
          --audio-quality 0 \
          --embed-sub \
          --embed-thumbnail \
          --embed-chapters \
          --embed-info-json \
          --sponsorblock-mark all \
          "$url"
        dunstify \
          --appname=YT-DLP \
          --icon=download \
          "YouTube video downloaded" \
          "The YouTube video ($selection_name) has been downloaded."
      else
        mpv "$url"
      fi
    }

    main "$@"
  '';

  meta = with lib; {
    description = "A rofi youtube client using mpv and yt-dlp";
    platforms = with platforms; linux;
  };
}
