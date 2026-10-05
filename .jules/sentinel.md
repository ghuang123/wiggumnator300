## 2024-10-05 - Prevent Command Line Exposure of API Keys
**Vulnerability:** API keys were being passed to a Docker container via explicit environment variable assignment, exposing them in the host process list.
**Learning:** When passing secrets to containers dynamically in shell scripts, expanding their values makes them visible to anyone who can run `ps aux` on the host.
**Prevention:** Use Docker's environment variable inheritance (`-e "VAR"`) to pass values without expanding them on the command line.
