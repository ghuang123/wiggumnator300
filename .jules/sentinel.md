
## 2024-11-02 - Docker Command Line Secret Leak
**Vulnerability:** API keys passed to Docker using `-e "$var=${!var}"` are exposed in the host's process list.
**Learning:** Interpolating secrets directly into command arguments exposes them to anyone on the host who can view the process table (e.g., via `ps aux`).
**Prevention:** Pass variables to Docker using `-e "$var"` to securely inherit them from the host environment without exposing their values in the process arguments.
