## 2024-09-16 - Prevent API Key Exposure in Docker Process List
**Vulnerability:** Passing API keys to Docker using `-e "VAR=${!VAR}"` exposes the secret in the host's process list (visible via `ps aux`).
**Learning:** Shell evaluation interpolates the secret directly into the command arguments, making it visible to anyone who can view processes on the host.
**Prevention:** Inherit environment variables implicitly using `-e "$VAR"` without assigning the value on the command line, which passes the secret securely through the environment.
