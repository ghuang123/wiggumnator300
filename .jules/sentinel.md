## 2026-06-19 - [Secure Docker Argument Passing]
**Vulnerability:** API keys exposed to `ps` via `-e VAR=$VAR` and command injection in `bash -c "cmd $*"`.
**Learning:** Shell interpolation in Docker arguments makes secrets visible to host process lists. Using `$*` inside `bash -c` strings allows arbitrary command injection.
**Prevention:** Use Docker's native environment passthrough (`-e "VAR_NAME"`) and pass arguments to `bash -c` securely out-of-band with a dummy `$0` (`bash -c 'cmd "$@"' dummy "$@"`).
