
## 2024-11-04 - Secure Docker Environment Variable Passing
**Vulnerability:** API keys passed to Docker via `-e "VAR=${VAR}"` are exposed on the host's command line and process list.
**Learning:** Shell expansion of secrets into command arguments makes them visible to any user running `ps aux` on the host.
**Prevention:** Use Docker's environment variable inheritance `-e "VAR"` without the assignment to securely pass values from the host environment.
