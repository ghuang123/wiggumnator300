## 2024-05-30 - Prevent API Key Leakage in Process List
**Vulnerability:** API keys (`ANTHROPIC_API_KEY`, `CLAUDE_API_KEY`) passed to `docker run` using `-e "VAR=$VALUE"` were visible in the host's process list via commands like `ps aux`.
**Learning:** Shell scripts dynamically forwarding environment variables to Docker often mistakenly expand the secret value on the command line, exposing it to any user on the host.
**Prevention:** Use `-e "$var"` to inherit variables from the host environment securely without exposing their values on the command line.
