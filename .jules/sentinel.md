## 2026-08-01 - Command Injection in sandbox launcher
**Vulnerability:** Command injection in `scripts/sandbox.sh` caused by directly interpolating `$*` into a `bash -c` command string.
**Learning:** Shell arguments passed to a wrapper script can be exploited if they are unescaped and directly evaluated in a subshell without using positional parameters.
**Prevention:** Always pass arguments out-of-band to `bash -c` using positional parameters like `bash -c 'cmd "$@"' dummy "$@"` instead of direct string interpolation.
