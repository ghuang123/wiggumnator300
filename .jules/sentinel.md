## 2026-05-05 - Secure Docker Arguments and Subshell Execution
**Vulnerability:** API keys were exposed in process listings via command-line interpolation (`-e VAR=$VAR`), and `$*` was used in `bash -c`, which allows for command injection.
**Learning:** Docker provides native environment variable passthrough using just `-e VAR`, and shell arguments should be passed securely to subshells using `"$@"` with `-- "$@"`.
**Prevention:** Always use Docker's native environment variable passthrough for secrets and use `"$@"` to forward arguments to subshells safely.
