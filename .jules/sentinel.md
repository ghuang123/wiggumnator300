## 2026-05-27 - Command Injection in Shell Wrappers
**Vulnerability:** Found unsanitized input passed to a subshell via string interpolation (`$*`) in a CLI wrapper script.
**Learning:** Passing user arguments using `$*` into `bash -c` allows arbitrary shell characters to be evaluated, leading to command injection vulnerabilities.
**Prevention:** Always pass shell arguments securely to subshells using positional parameters (e.g., `bash -c 'cmd "$@"' -- "$@"`).
