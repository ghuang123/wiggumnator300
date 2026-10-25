
## 2024-10-25 - Secure Environment Variables in Docker
**Vulnerability:** API keys passed to Docker via `-e "$var=${!var}"` expose secrets on the command line.
**Learning:** Command-line arguments in scripts are visible in the host's process list (e.g., via `ps aux`).
**Prevention:** Use `-e "$var"` to securely inherit environment variables from the host environment.
