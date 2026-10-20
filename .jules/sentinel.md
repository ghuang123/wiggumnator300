## 2024-10-20 - Prevent API Keys Leakage in docker run Command
**Vulnerability:** The script passed API keys to Docker using `DOCKER_ARGS+=(-e "$var=${!var}")`. This exposed the API keys on the command line, making them visible to other users on the host system via `ps aux`.
**Learning:** In bash scripts wrapping `docker run`, explicitly assigning values to `-e` flags exposes those values to the process table. Docker's `-e` flag supports omitting the value to inherit securely from the host environment without command-line exposure.
**Prevention:** Always use `-e "$var"` rather than `-e "$var=${!var}"` when dynamically passing environment variables containing secrets to Docker containers from bash scripts.
