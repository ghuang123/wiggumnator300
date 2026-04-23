
## 2026-04-23 - Secure Docker Environment Variable Passthrough
**Vulnerability:** API keys passed to Docker via `-e "VAR=$VAR"` exposed the secret values in the process tree (`ps ax`).
**Learning:** Command line arguments are visible to other users on the system. Docker provides native support for this.
**Prevention:** Use `-e "VAR"` without the value assignment to let Docker seamlessly and securely pass the value from the host environment without exposing it on the command line.
