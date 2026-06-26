## 2026-06-26 - Secure Docker Arguments and Subshell Execution
**Vulnerability:** API keys were exposed to host process listings via explicit `-e "VAR=$VAR"` Docker arguments, and shell arguments were vulnerable to command injection via string interpolation in `bash -c "cmd $*"`.
**Learning:** Docker native passthrough (`-e "VAR"`) hides secrets from `ps`. Furthermore, `bash -c` drops the first positional argument into `$0`, requiring a dummy argument to securely pass `$@` out-of-band and avoid injection risks.
**Prevention:** Always use native Docker environment variable passthrough for secrets. When executing commands in subshells via `bash -c`, always pass variables as out-of-band positional parameters (e.g., `bash -c 'cmd "$@"' dummy "$@"`) instead of interpolating them directly.
