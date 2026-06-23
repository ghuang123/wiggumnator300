## 2026-06-23 - Prevent API key leak in docker arguments
**Vulnerability:** API keys passed to Docker via `-e "VAR_NAME=$VAR_NAME"` interpolation exposed the raw secret to host process listings (`ps`).
**Learning:** Shell command interpolation of secrets makes them visible system-wide during execution.
**Prevention:** Use native passthrough (e.g., `-e "VAR_NAME"`) to inherit environment variables securely without exposing them in command arguments.
