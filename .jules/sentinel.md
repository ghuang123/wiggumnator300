## 2026-06-03 - [Fix Command Injection in Subshells]
**Vulnerability:** Shell argument interpolation in bash -c strings
**Learning:** Interpolating arguments directly into a shell string allows command injection vulnerabilities.
**Prevention:** Always use out-of-band arguments "$@" with a dummy $0 when using bash -c.
