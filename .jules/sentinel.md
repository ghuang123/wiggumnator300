
## 2024-11-06 - Prevent API key exposure in Docker process list
**Vulnerability:** Docker sandbox script exposed sensitive API keys via command-line arguments, making them visible in the host's process list.
**Learning:** Passing variables as `-e "VAR=VAL"` to `docker run` exposes the value to the host process table.
**Prevention:** Use `-e "VAR"` without the value to tell Docker to inherit the variable directly from the host environment, hiding the secret from process lists.
