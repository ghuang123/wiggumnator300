## 2024-05-30 - Prevent process-level secret leakage in Docker args
**Vulnerability:** Passing API keys via `-e "VAR_NAME=$VAR_NAME"` exposed sensitive data in host process listings (`ps aux`).
**Learning:** Process arguments can be read by other processes on the same host, so secrets should never be explicitly expanded on the command line.
**Prevention:** Use native passthrough (e.g., `-e "VAR_NAME"`) instead of command-line interpolation to pass secrets from the environment to Docker containers without exposing them to host process listings.
