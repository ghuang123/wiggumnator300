## 2026-07-22 - Secure Docker Argument and Environment Passthrough
**Vulnerability:** The sandbox launcher interpolated CLI arguments directly into `bash -c` strings and passed API keys as explicit `--env` assignments, allowing command injection and exposing secrets to host process listings.
**Learning:** Due to how the launcher scripts integrate the host environment with container execution, shell arguments and environment variables passed to Docker must use positional out-of-band parameters and native passthrough respectively.
**Prevention:** Always use `bash -c 'cmd "$@"' dummy "$@"` when passing arguments to subshells, and use `-e "VAR_NAME"` for secrets to ensure they are hidden from `ps` and safe from injection.
