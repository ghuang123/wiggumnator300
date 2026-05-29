## 2026-05-29 - [Prevent Command Injection in Subshells]
**Vulnerability:** [Command injection in Docker sandbox scripts]
**Learning:** [Using string interpolation of arguments in bash -c allows arbitrary execution if input is unescaped]
**Prevention:** [Use out-of-band positional arguments passed to the subshell (e.g., bash -c 'cmd "$@"' -- dummy "$@")]
