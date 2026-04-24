## 2026-04-24 - Secure Docker Environment Variable Passthrough
**Vulnerability:** API keys passed to Docker via command-line interpolation (e.g., `-e VAR=VALUE`) are exposed to process listings (like `ps`) on the host system.
**Learning:** Shell scripts spawning long-running processes or containers can inadvertently leak secrets to any user with process listing visibility if variables are interpolated into the command line arguments.
**Prevention:** Use native passthrough mechanisms where the tool reads the variable from the environment directly (e.g., `-e VAR_NAME` for Docker) instead of passing the value explicitly.
