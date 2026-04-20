## 2026-04-20 - Secure shell argument and environment variable passing
**Vulnerability:** API keys exposed to process listings via `-e VAR=$VAR` and command injection risk via `bash -c "cmd $*"`.
**Learning:** Shell scripts spawning sub-processes (like docker run) can expose sensitive environment variables if interpolated in command arguments, and can allow command injection if arguments are poorly expanded.
**Prevention:** Use native passthrough `-e VAR` for Docker and secure argument passthrough `bash -c 'cmd "$@"' -- "$@"` for shell commands.
