## 2026-05-12 - Prevent API Key Exposure in Docker Process Listing
**Vulnerability:** Interpolating API keys in Docker run commands (`-e "VAR=$VAR"`) exposed the plaintext secrets in the system's process listing (`ps`).
**Learning:** When passing secrets to containers, command-line interpolation leaks them to any user on the host system via `ps` or `/proc`.
**Prevention:** Use native Docker passthrough (`-e "VAR_NAME"`) without interpolation to pass secrets securely via the environment.
