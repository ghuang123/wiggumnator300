## 2026-05-10 - [API Key Exposure in Docker Run]
**Vulnerability:** API keys passed to Docker via command-line interpolation (`-e "VAR=$VAR"`) are visible in process listings (`ps`).
**Learning:** Command-line arguments are readable by other users on the system.
**Prevention:** Use native Docker environment variable passthrough (`-e "VAR"`) to securely pass environment variables.
