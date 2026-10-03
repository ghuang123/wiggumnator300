## 2024-10-03 - API Key Exposure in Docker Run
**Vulnerability:** API keys were passed to docker run using -e VAR=${!VAR}, exposing the plaintext secrets in the host's process table (visible via ps aux).
**Learning:** Shell parameter expansion interpolates secrets into the command arguments before execution, making them globally visible to any user or monitoring daemon on the host system.
**Prevention:** Always use -e VAR (without the assignment) to inherit environment variables into Docker containers, keeping the values safely in the environment block instead of command arguments.
