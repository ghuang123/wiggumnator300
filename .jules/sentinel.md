## 2026-06-30 - Prevent API Key Exposure in Docker Process Listing
**Vulnerability:** Explicit command-line interpolation for environment variables in Docker arguments (e.g., `-e "VAR=$VAR"`) exposes sensitive API keys in the host's process listing (`ps`).
**Learning:** Always use native passthrough (e.g., `-e "VAR"`) to pass environment variables to Docker securely.
**Prevention:** Ensure any shell scripts launching Docker containers natively pass sensitive environment variables rather than interpolating them directly on the command line.
