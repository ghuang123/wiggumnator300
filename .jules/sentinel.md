## 2024-09-27 - Docker Env Var Process Exposure
**Vulnerability:** API keys passed to Docker via `-e "$var=${!var}"` expand the secret into the command line, making it visible to all users on the host via process list (e.g., `ps aux`).
**Learning:** Shell expansion of secrets into command arguments is a common pitfall. Docker allows inheriting the host's environment variable by passing `-e "$var"` without explicitly expanding its value.
**Prevention:** Always use implicit value passing (`-e VAR_NAME`) for Docker when passing secrets from the host environment to avoid command line argument exposure.
