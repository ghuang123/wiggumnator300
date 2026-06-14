## 2026-06-14 - [Command Injection in bash -c]
**Vulnerability:** Shell arguments were interpolated directly into a `bash -c` string using `$*` in `scripts/sandbox.sh`, creating a command injection vulnerability.
**Learning:** Expanding `$*` inside double quotes for `bash -c` creates a single string that the subshell parses, allowing malicious inputs to execute arbitrary commands.
**Prevention:** Pass shell arguments securely to subshells using out-of-band positional arguments, explicitly including a dummy `$0` argument (e.g., `bash -c 'cmd "$@"' dummy "$@"`).
