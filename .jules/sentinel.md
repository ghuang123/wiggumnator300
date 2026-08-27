## 2024-08-27 - Command Injection in Docker Arguments
**Vulnerability:** Command injection in `scripts/sandbox.sh` where arguments were passed to `bash -c` using `$*`.
**Learning:** Using `$*` inside a string argument to `bash -c` allows injected shell commands to be interpreted because it flattens arguments into a single string evaluated by the shell.
**Prevention:** Always pass arguments to scripts using `"$@"` directly without `bash -c`, or if `bash -c` is necessary, pass arguments as positionals after `--` (e.g., `bash -c '...' -- "$@"`).
