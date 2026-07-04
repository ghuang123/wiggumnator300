## 2026-07-04 - Secure Docker and Subshell Argument Passthrough
**Vulnerability:** API keys were exposed in host process lists due to explicit environment variable interpolation (`-e VAR=VAL`) and arguments were vulnerable to command injection via direct interpolation in subshells (`bash -c "cmd $*"`).
**Learning:** Explicitly interpolating variables and arguments into strings when passing to Docker or `bash -c` exposes them to host inspection tools (like `ps`) and allows arbitrary command execution if the input contains spaces or shell metacharacters.
**Prevention:** Use native passthrough for Docker environment variables (e.g., `-e VAR`) and pass shell arguments out-of-band using positional parameters (e.g., `bash -c 'cmd "$@"' dummy "$@"`).
