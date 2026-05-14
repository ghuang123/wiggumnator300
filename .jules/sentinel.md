## 2026-05-14 - Prevent API Key Exposure in Docker Run Commands
**Vulnerability:** API keys passed to Docker via `-e "VAR=$VAR"` were exposed in process listings (`ps`).
**Learning:** Command-line interpolation of sensitive environment variables exposes them to all users on the system via process tables.
**Prevention:** Use Docker's native variable passthrough (`-e "VAR_NAME"`) to securely pass environment variables into containers without exposing their values in command arguments.
