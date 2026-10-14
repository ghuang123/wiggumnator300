## 2026-10-14 - Docker Environment Variable Command Line Exposure
**Vulnerability:** Passing API keys to Docker using `-e "$var=${!var}"` exposes the raw secret on the command line arguments, which is visible in the host's process list via `ps aux`.
**Learning:** Shell expansion of secrets into command arguments bypasses process isolation. Docker's `-e "$var"` syntax securely inherits the value from the host environment without exposing it in the command string.
**Prevention:** Always use `-e "VAR_NAME"` instead of `-e "VAR_NAME=value"` when passing sensitive environment variables to Docker containers in shell scripts.
