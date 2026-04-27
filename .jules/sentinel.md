## 2026-04-27 - Secure Docker arguments passing
**Vulnerability:** Process argument credential leak and command injection risk.
**Learning:** Using command-line string interpolation for passing API keys exposes them to `ps` listings. Unquoted string expansion in `bash -c` allows command injection.
**Prevention:** Always use Docker's native environment variable passthrough (`-e VAR_NAME`) and secure argument passing (`bash -c 'cmd "$@"' -- "$@"`).
