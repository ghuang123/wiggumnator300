## 2026-07-26 - Secure Docker execution in bash scripts
**Vulnerability:** API keys exposed to host process listing via direct interpolation in `-e`, and command injection via `bash -c "cmd $*"`.
**Learning:** Directly interpolating sensitive environment variables in `docker run -e VAR=$VAR` exposes them in `ps aux`. Using unquoted `$*` inside `bash -c` allows arbitrary command execution if arguments contain shell metacharacters.
**Prevention:** Always use Docker's native environment variable passthrough (`-e VAR`) to read secrets from the environment without exposing them in process arguments. Always pass arguments to `bash -c` out-of-band using positional parameters (e.g., `bash -c 'cmd "$@"' dummy "$@"`).
