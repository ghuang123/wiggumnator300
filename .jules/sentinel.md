## 2024-05-30 - Preventing Secret Leakage in Docker Arguments
**Vulnerability:** API keys passed to docker run using `-e VAR=VALUE` were visible in the host's process list.
**Learning:** Shell expansion of secrets directly into command arguments exposes them globally to any user on the host system who can list processes.
**Prevention:** Pass environment variables to Docker by name only (`-e VAR`), allowing Docker to inherit the value directly from the host environment without exposing it in the process arguments.
