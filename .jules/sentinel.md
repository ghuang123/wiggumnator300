## 2026-05-31 - [Prevent command injection in subshells]
**Vulnerability:** Shell scripts passing arguments to a subshell using string interpolation are vulnerable to command injection if the input contains unescaped shell characters.
**Learning:** String interpolation expands arguments directly into the command string before the subshell parses them, allowing malicious shell operators to be executed.
**Prevention:** Always pass shell arguments securely to subshells using out-of-band positional arguments. Provide a dummy `$0` argument explicitly (e.g., `bash -c 'cmd "$@"' dummy "$@"`) instead of interpolating strings directly.
