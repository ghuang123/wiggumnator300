## 2026-10-21 - Prevent API Key Exposure in Docker Run
**Vulnerability:** API keys passed to Docker via `-e "VAR=${!VAR}"` expose the secret in the host's process list (e.g., visible via `ps aux`).
**Learning:** Shell expansion of secrets directly into command arguments creates an immediate leakage risk on multi-user systems.
**Prevention:** Always use `-e "VAR"` without the assignment when passing environment variables to `docker run`, which securely inherits the value from the host environment.
