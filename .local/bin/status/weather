#!/usr/bin/env sh

# shell script to show the weather

# give an icon for each weather status
weather_icon () {
    case "$1" in
        "113") # Sunny
            echo ""
            ;;
        "116") # Partly cloudy
            echo ""
            ;;
        "119"|"122") # Cloudy
            echo ""
            ;;
        "143"|"248"|"260") # Fog
            echo ""
            ;;
        "176"|"263"|"353" | "266"|"293"|"296") # Light Showers and Light Rain
            echo ""
            ;;
        "179"|"362"|"365"|"374" | "182"|"185"|"281"|"284"|"311"|"314"|"317"|"350"|"377") # Light Sleet (and Showers)
            echo ""
            ;;
        "200"|"386" | "392") # Thundery Showers and Thundery Snow Showers
            echo ""
            ;;
        "227"|"320" | "323"|"326"|"368") # Light snow (and Showers)
            echo ""
            ;;
        "230"|"329"|"332"|"338" | "335"|"371"|"395") # Heavy Snow (and Showers)
            echo ""
            ;;
        "299"|"305"|"356" | "302"|"308"|"359") # Heavy Showers and Heavy Rain
            echo ""
            ;;
        "389") # Thundery Heavy Rain
            echo ""
            ;;
        *)
            echo "?"
            ;;
    esac
}

main () {
    # set initial variables
    location="YYJ"

    # test if jq is installed
    if ! type jq >/dev/null; then
        echo "error: jq isn't installed"
        return 1
    fi

    # test if there's internet connection
    if ! ping -c 1 1.1.1.1 >/dev/null; then
        echo "error: no internet connection"
        return 1
    fi

    # save weather info to a variable
    weather="$(curl -s "wttr.in/$location?format=j1" | jq '.current_condition')"

    # set specific values
    temperature="$(echo "$weather" | jq '.[0].temp_C' | sed -E 's/^"//; s/"$//')"
    uv_index="$(echo "$weather" | jq '.[0].uvIndex' | sed -E 's/^"//; s/"$//')"
    weather_code="$(echo "$weather" | jq '.[0].weatherCode' | sed -E 's/^"//; s/"$//')"

    echo "$(weather_icon "$weather_code")  $temperature°C | $uv_index  "
}

main

