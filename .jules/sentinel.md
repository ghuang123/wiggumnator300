## 2026-07-18 - Secure Docker Environment Variable Passthrough and Command Execution
**Vulnerability:** API keys were exposed in `ps` output via explicit Docker `-e` assignments, and arguments passed to `bash -c` were vulnerable to command injection via `$*` interpolation.
**Learning:** Shell expansion interpolates environment variables directly into command arguments, making them visible to all users. Additionally, string interpolation in `bash -c` allows arbitrary shell execution if arguments contain shell metacharacters.
**Prevention:** Use native passthrough (e.g., `-e "VAR_NAME"`) for Docker secrets, and pass positional parameters securely out-of-band to subshells (e.g., `bash -c 'cmd "$@"' dummy "$@"`).
