## 2026-05-30 - Command Injection in Docker Arguments
**Vulnerability:** Shell arguments were unsafely interpolated into a `bash -c` string using `$*`, leading to potential command injection.
**Learning:** When passing user arguments into a subshell string, direct interpolation allows shell operators to be evaluated prematurely.
**Prevention:** Always use out-of-band positional parameters like `bash -c 'cmd "$@"' dummy "$@"` to ensure arguments remain literal strings.
