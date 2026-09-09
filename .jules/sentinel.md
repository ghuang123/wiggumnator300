## 2024-05-24 - Prevent API Key Exposure in Docker Process List
**Vulnerability:** API keys passed to docker run using -e "VAR=${!VAR}" format are exposed in the host system's process list (e.g., via ps aux), allowing any local user to steal sensitive credentials like ANTHROPIC_API_KEY.
**Learning:** Shell expansion interpolates the actual secret value into the command line arguments before the process is spawned, making it visible to the OS process manager.
**Prevention:** Always use Docker's environment variable inheritance by passing -e "VAR" without the value, which securely passes the variable from the host environment to the container without exposing it in the command arguments.
