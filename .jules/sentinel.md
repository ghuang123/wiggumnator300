
## 2024-10-19 - Docker Environment Variable Exposure
**Vulnerability:** API keys (like `ANTHROPIC_API_KEY`) passed to `docker run` using `-e VAR=VALUE` expose the secret value on the host's command line, visible to any user via `ps aux`.
**Learning:** Shell scripts orchestrating Docker containers often naively interpolate secret values into the `docker run` command string, failing to realize the command string itself is public system state.
**Prevention:** Always use Docker's environment variable inheritance by passing just the variable name `-e VAR` to securely map host secrets into the container without exposing their values in the process list.
