
## 2024-10-16 - API Keys Exposed in Docker Process List
**Vulnerability:** API keys were dynamically passed to the Docker sandbox container using `-e "$var=${!var}"`, exposing the raw secrets in the host's process list (e.g., via `ps aux`).
**Learning:** Even short-lived containers can expose sensitive environment variables if they are passed as explicit key-value pairs on the `docker run` command line.
**Prevention:** Always use `-e "$var"` when passing environment variables to `docker run` to inherit them securely from the host environment without exposing their values in the process arguments.
