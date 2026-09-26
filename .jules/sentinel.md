## 2024-05-24 - API Key Exposure in Docker Process List
**Vulnerability:** API keys were passed to Docker using `-e "VAR=VALUE"`, making them visible in the host process list via `ps aux`.
**Learning:** Shell scripts passing secrets to `docker run` via command-line arguments expose those secrets system-wide to any user who can list processes.
**Prevention:** Inherit environment variables in Docker using `-e "VAR"` without the value, keeping secrets securely out of command-line arguments.
