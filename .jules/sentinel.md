## 2026-06-27 - Secure Docker Environment Variable Passthrough
**Vulnerability:** Passing API keys to Docker using explicit command-line assignment (e.g., -e VAR_NAME=$VAR_NAME) exposes the secret values to anyone running ps on the host system.
**Learning:** Process listing commands like ps show the full command-line arguments of running processes, making any secrets passed as arguments globally readable on the host.
**Prevention:** Use native Docker environment passthrough (e.g., -e VAR_NAME) for sensitive variables to securely inherit them from the host environment without exposing them in the command arguments.
