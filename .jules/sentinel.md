## 2026-06-11 - [Command Injection via String Interpolation in bash -c]
**Vulnerability:** Found $* being directly interpolated into a bash -c command string, allowing arbitrary command execution.
**Learning:** Interpolating variables directly into -c strings treats the expanded text as code rather than data, creating a command injection vector.
**Prevention:** Always pass shell arguments securely to subshells using out-of-band positional arguments (e.g., bash -c 'cmd "$@"' dummy "$@").
