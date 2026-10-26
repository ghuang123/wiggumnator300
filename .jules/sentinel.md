
## 2024-10-26 - Prevent API key exposure in Docker run
**Vulnerability:** Passing API keys to Docker via `-e "$var=${!var}"` exposes their literal values in the host process list (`ps aux`).
**Learning:** Shell scripts spawning long-running processes or containers can inadvertently leak secrets to other users on the host if environment variables are evaluated on the command line.
**Prevention:** Use `-e "$var"` to allow Docker to inherit the variable directly from the host environment without exposing the value in the command arguments.
