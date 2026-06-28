## 2026-06-28 - Secure Docker Arguments and Subshell Execution
**Vulnerability:** API keys were exposed in process listings (ps) due to explicit environment variable interpolation, and user arguments were vulnerable to command injection via $* interpolation in bash -c.
**Learning:** Docker supports native environment variable passthrough using just the variable name. Furthermore, bash -c requires explicit out-of-band arguments with a dummy $0 to safely pass user input without command injection.
**Prevention:** Always use -e VAR_NAME for passing sensitive variables to Docker. Use out-of-band positional arguments (e.g., bash -c 'cmd "$@"' dummy "$@") instead of directly injecting $* into the command string.
