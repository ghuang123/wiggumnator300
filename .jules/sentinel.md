## 2026-06-12 - [Command Injection via bash -c String Interpolation]
**Vulnerability:** Shell arguments were unsafely interpolated into a subshell string execution, leading to command injection risks.
**Learning:** When using bash -c, string interpolation of arguments is unsafe. Additionally, the first argument following the command string is assigned to $0 and dropped from $@.
**Prevention:** Always pass shell arguments securely to subshells using out-of-band positional arguments, and explicitly include a dummy $0 argument (e.g., bash -c 'cmd "$@"' dummy "$@").
