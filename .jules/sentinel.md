## 2024-05-24 - API Key Exposure in Docker Run Command
**Vulnerability:** API keys were passed to `docker run` using `-e "$var=${!var}"`, which exposes the plaintext secrets in the command-line arguments visible via `ps aux` on the host.
**Learning:** Shell scripts launching Docker containers must not interpolate secrets into the command arguments, as the process list is globally readable.
**Prevention:** Use `-e "$var"` without an explicit value to inherit the environment variable securely from the host without exposing it in the process arguments.
