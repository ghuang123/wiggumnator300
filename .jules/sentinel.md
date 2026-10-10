## 2024-10-10 - Secure Environment Variable Passing in Docker
**Vulnerability:** API keys were passed to Docker using `-e "$var=${!var}"`, exposing them on the command line and in the host's process list (e.g., via `ps aux`).
**Learning:** Shell expansion of sensitive variables in command arguments makes them visible to anyone on the host system who can list processes.
**Prevention:** Always use `-e "$var"` to instruct Docker to inherit the variable directly from the host environment without exposing its value in the command string.
