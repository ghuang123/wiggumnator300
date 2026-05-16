## 2026-05-16 - Prevent command injection in Docker bash execution
**Vulnerability:** Command injection risk via string interpolation of shell arguments (`$*`) in `bash -c` commands.
**Learning:** Passing unquoted or interpolated arguments directly into `bash -c "cmd $*"` allows attackers to break out of the command and execute arbitrary code.
**Prevention:** Always pass shell arguments securely to subshells using `bash -c 'cmd "$@"' -- "$@"` instead of string interpolation.
