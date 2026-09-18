## 2024-05-24 - Prevent Secret Exposure in Docker Arguments
**Vulnerability:** Passing API keys to Docker via `-e "$var=${!var}"` exposes the raw secret on the command line, visible to any user on the host via process list (e.g. `ps aux`).
**Learning:** Even within scripts, passing secrets as explicit command-line argument values risks exposing them to the process table. Docker's `-e` flag allows inheriting environment variables by name without exposing the value.
**Prevention:** Always use `docker run -e "$VAR_NAME"` to inherit sensitive environment variables from the host, rather than explicitly passing the value like `-e "$VAR_NAME=$VALUE"`.
