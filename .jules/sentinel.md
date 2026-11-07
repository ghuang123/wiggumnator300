
## 2024-11-07 - Prevent API Key Leakage in Process List
**Vulnerability:** API keys passed to Docker via `-e "$var=${!var}"` are exposed on the host's process list.
**Learning:** Passing explicit environment variable values on the command line makes them visible to commands like `ps aux`.
**Prevention:** Inherit environment variables securely by omitting the value and just passing the variable name with `-e "$var"`.
