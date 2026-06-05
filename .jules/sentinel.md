## 2026-06-05 - [Command Injection via bash -c interpolation]
**Vulnerability:** Command injection risk from interpolating shell arguments directly into `bash -c` command strings.
**Learning:** Using string interpolation like `$*` inside `bash -c` evaluates arguments as code, creating a command injection vulnerability if inputs contain shell metacharacters.
**Prevention:** Always use out-of-band positional arguments (e.g., `bash -c 'cmd "$@"' dummy "$@"`), explicitly providing a dummy `$0` argument to prevent improper shifting of variables.
