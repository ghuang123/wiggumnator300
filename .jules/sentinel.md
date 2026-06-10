## 2026-06-10 - Command Injection in Subshell Arguments
**Vulnerability:** Command injection vulnerability due to string interpolation of shell arguments (`$*`) when passing them to a subshell (`bash -c`).
**Learning:** Passing arguments directly via string interpolation inside `bash -c` allows arbitrary commands to be executed if the arguments contain shell metacharacters (e.g. `;`).
**Prevention:** Always pass arguments securely to subshells using out-of-band positional arguments (e.g., `bash -c 'cmd "$@"' dummy "$@"`).
