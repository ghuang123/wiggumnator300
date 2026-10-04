## 2024-10-04 - Prevent API Key Process Exposure in Docker Run
**Vulnerability:** API keys passed to Docker via `docker run -e "VAR=VALUE"` expose the plaintext value in the host machine's process list (`ps aux`).
**Learning:** Shell parameter expansion (`${!var}`) in the command arguments leaks sensitive environment variables to the process arguments.
**Prevention:** Pass the variable name without the value (`-e "VAR"`) so Docker inherits it directly from the host environment without exposing it in the command arguments.
