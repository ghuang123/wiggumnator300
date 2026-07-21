## 2026-07-21 - Prevent Command Injection and Secret Leakage in Sandbox Launcher
**Vulnerability:** Shell arguments were interpolated directly into a subshell (`bash -c "./loop.sh $*"`) allowing command injection. Also, API keys were passed via `-e "VAR=$VAR"`, exposing secrets in host process listings (`ps`).
**Learning:** These issues exist because native Bash features (like out-of-band positional parameter passthrough and implicit Docker `-e` env propagation) were not used.
**Prevention:** Use out-of-band arguments `bash -c 'cmd "$@"' dummy "$@"` to prevent command injection. Use implicit propagation `-e "VAR_NAME"` for sensitive Docker environment variables.
