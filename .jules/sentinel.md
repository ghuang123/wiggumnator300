## 2026-07-06 - Secure Argument Passing in Docker Scripts
**Vulnerability:** API keys exposed in process listings (`ps`) and command injection risk via interpolated arguments.
**Learning:** Interpolating secrets in Docker `-e` flags (`-e "VAR=$VAR"`) or arguments in subshells (`bash -c "cmd $*"`) exposes data to process lists and allows arbitrary command execution.
**Prevention:** Use Docker's native environment variable passthrough (`-e "VAR"`) and pass subshell arguments out-of-band using positional parameters (`bash -c 'cmd "$@"' dummy "$@"`).
