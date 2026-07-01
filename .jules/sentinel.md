## 2026-07-01 - Command Injection and Secret Leak in Sandbox
**Vulnerability:** API keys were exposed in process lists via `-e "VAR=$VAR"` and sandbox arguments were interpolated into a string via `bash -c "...$*"` creating a command injection risk.
**Learning:** Docker's `-e` flag supports native passthrough to avoid exposing secrets in `ps` listings. Furthermore, string interpolation with `$*` inside `bash -c` is unsafe and drops the dummy `$0` argument if not passed explicitly.
**Prevention:** Always use `-e "VAR"` for passing sensitive environment variables and explicitly pass out-of-band arguments to subshells using `bash -c 'cmd "$@"' dummy "$@"`.
