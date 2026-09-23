## 2024-09-23 - Exposed Secrets on Command Line
**Vulnerability:** Passing API keys to Docker using `-e "VAR=${!var}"` exposes the raw secret values in the process arguments.
**Learning:** Process arguments can be viewed by any user on the host system via commands like `ps aux`, meaning sensitive API keys were inadvertently exposed to the entire host environment during container execution.
**Prevention:** Inherit environment variables dynamically using `-e "VAR"` without the value assignment, which securely passes them from the host environment to the container without exposing them in the command line string.
