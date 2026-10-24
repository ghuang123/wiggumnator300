
## 2024-10-24 - Prevent API Key Exposure in Process Lists
**Vulnerability:** API keys were passed to Docker containers by evaluating them in the command line argument (`-e VAR=VALUE`), exposing them to anyone who can view the host's process list.
**Learning:** Interpolating sensitive environment variables into shell command arguments makes them visible to host system process monitoring.
**Prevention:** Use Docker's environment variable inheritance feature by passing just the variable name (`-e VAR`), which securely inherits the value directly from the host environment without command-line exposure.
