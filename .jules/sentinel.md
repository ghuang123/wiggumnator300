
## 2024-11-08 - [Secure Environment Variable Passing to Docker]
**Vulnerability:** Sensitive API keys were passed to Docker using `-e "$var=${!var}"`, exposing them in the host's process list via `ps aux`.
**Learning:** Passing variables with values on the command line exposes them to any user who can list processes. Docker allows secure inheritance from the host environment by using `-e "$var"` without assigning the value.
**Prevention:** Always use `-e "$var"` to inherit sensitive environment variables securely when running Docker containers via scripts.
