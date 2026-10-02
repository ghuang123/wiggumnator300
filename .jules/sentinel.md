## 2024-05-24 - Prevent API Key Exposure in Docker Process Table
**Vulnerability:** API keys passed to Docker via `-e "$var=${!var}"` were visible in the host's process list (e.g., via `ps aux`).
**Learning:** Passing environment variables dynamically by expanding their values on the command line exposes them to all users on the host system.
**Prevention:** Inherit environment variables from the host safely by using `-e "$var"` without assigning the value explicitly.
