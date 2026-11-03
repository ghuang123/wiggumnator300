
## 2024-11-03 - Prevent API Key Exposure in Docker Process List
**Vulnerability:** Passing API keys to Docker via `-e "$var=${!var}"` exposes the secret value in the host's process list.
**Learning:** Shell expansion interpolates the sensitive value directly into the command arguments, making it visible to anyone who can view running processes.
**Prevention:** Use `-e "$var"` without the value assignment to instruct Docker to securely inherit the value from the host environment.
