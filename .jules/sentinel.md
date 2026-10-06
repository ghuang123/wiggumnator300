## 2024-10-06 - API Key Exposure in Docker Run
**Vulnerability:** Passing API keys to `docker run` using `-e VAR=VALUE` exposes the plaintext keys in the host's process list via `ps aux`.
**Learning:** Shell expansion (`${!var}`) evaluates the secret and places it directly into the command arguments, making it visible to anyone who can view processes.
**Prevention:** Always use the `-e VAR` syntax without the `=VALUE` part when passing sensitive environment variables to Docker, so it inherits them from the environment safely.
