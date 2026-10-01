## 2024-05-24 - Prevent API Key Leakage in Docker Process List
**Vulnerability:** Shell scripts passing sensitive environment variables (API keys) to `docker run` using `-e "$var=${!var}"`, exposing the plaintext secrets in the host's process list (`ps aux`).
**Learning:** Shell wrappers around Docker need to be careful with environment variable passing. The `-e VAR=VALUE` format makes the value visible in command-line arguments, which are globally readable on most Unix systems.
**Prevention:** Use `-e "$var"` to instruct Docker to inherit the variable directly from the host environment without exposing its value in the command-line arguments.
