## 2024-05-24 - Prevent API Key Exposure in Docker Run
**Vulnerability:** API keys were passed to Docker using `-e "$var=${!var}"`, making them visible in the host's process list via `ps aux`.
**Learning:** Inheriting environment variables from the host using `-e "$var"` prevents sensitive values from being exposed on the command line.
**Prevention:** Always use `-e "VAR"` syntax without the value when passing secrets to containers.
