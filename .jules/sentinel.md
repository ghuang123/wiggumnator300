## 2024-09-19 - Environment Variable Secret Exposure in Process List
**Vulnerability:** Sensitive API keys were passed to `docker run` using `-e "$var=${!var}"`, exposing the plaintext values in the host's process list.
**Learning:** Shell expansion inside process arguments makes them visible to anyone running `ps` on the host, breaking isolation and leaking secrets.
**Prevention:** Pass environment variables to Docker by name only (e.g., `-e "$var"`) to securely inherit them from the host environment without command-line exposure.
