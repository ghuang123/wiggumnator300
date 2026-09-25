## 2024-05-24 - API Key Exposure in Docker Process List
**Vulnerability:** Passing API keys to Docker using `-e "$var=${!var}"` exposes the raw secret in the host's process list via `ps aux`.
**Learning:** Shell command arguments are globally visible to all users on the host system, making it unsafe to pass secrets this way.
**Prevention:** Use `-e "$var"` to let Docker inherit the variable directly from the environment without exposing its value on the command line.
