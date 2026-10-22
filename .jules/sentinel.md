## 2024-10-22 - Prevent API Key Leakage in Process List
**Vulnerability:** API keys were passed to `docker run` using `-e VAR=value` syntax.
**Learning:** This exposes sensitive environment variables on the command line, making them visible to anyone running `ps aux` on the host machine.
**Prevention:** Always use `-e VAR` when passing sensitive environment variables to Docker so they are inherited securely from the host environment.
