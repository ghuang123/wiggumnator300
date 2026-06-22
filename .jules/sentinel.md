## 2026-06-22 - Docker Secret Passthrough Exposure
**Vulnerability:** Passing API keys to Docker via `-e "VAR=$VAR"` exposes the secret value in the host's process list (`ps aux`).
**Learning:** Command-line arguments in shell scripts are visible to all users on the host system during process execution, making string interpolation of secrets a significant credential leak risk.
**Prevention:** Use Docker's native environment variable passthrough (`-e "VAR_NAME"`) instead of interpolation, ensuring the variable is exported first if necessary.
