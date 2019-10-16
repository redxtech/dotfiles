# completions for ws function
complete -c ws -d "show nginx webserver status"
complete -c ws -f -a "start" -d "start nginx webserver"
complete -c ws -f -a "restart" -d "restart nginx webserver"
complete -c ws -f -a "stop" -d "stop nginx webserver"
complete -c ws -f -a "status" -d "show nginx webserver status"
complete -c ws -f -a "enable" -d "enable and start nginx webserver"
complete -c ws -f -a "disable" -d "disable and stop nginx webserver"

