## 2024-09-20 - Prevent Command Line Exposure of Docker Secrets
**Vulnerability:** API keys passed dynamically via `-e "$var=${!var}"` to `docker run` expose the sensitive value on the host process list (e.g., via `ps aux`).
**Learning:** Shell expansion interpolates the actual secret value into the Docker command string before execution.
**Prevention:** Use `-e "$var"` syntax to instruct Docker to inherit the variable from the host environment without explicitly passing the value in the command line arguments.
