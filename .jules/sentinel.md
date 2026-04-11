## 2026-04-11 - Preventing Command Injection in Docker Exec
**Vulnerability:** Shell arguments passed to `bash -c` via `$*` inside double quotes allowed command injection and broke argument splitting.
**Learning:** `bash -c "cmd $*"` is unsafe. When `bash -c` evaluates its string, it will interpret any shell metacharacters in the arguments.
**Prevention:** Always pass arguments as trailing arguments to `bash -c` and reference them with `"$@"` inside the command string: `bash -c 'cmd "$@"' -- "$@"`.
