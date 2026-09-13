## 2024-05-24 - API Key Exposure in Docker Run
**Vulnerability:** API keys passed to `docker run` as `-e "$var=${!var}"` are exposed in the host system's process list (e.g., via `ps aux`).
**Learning:** Shell command line arguments are globally visible to all users on Unix-like systems.
**Prevention:** Inherit environment variables securely by passing just the variable name with `-e "$var"`.
