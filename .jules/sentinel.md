## 2026-05-25 - Secure argument passing to subshells
**Vulnerability:** Shell arguments were passed into a subshell via string interpolation, allowing potential command injection.
**Learning:** Using interpolation for shell arguments in subshells creates command injection vulnerabilities.
**Prevention:** Always use secure array pass-through to subshells by invoking with '--' and '"$@"' (e.g., bash -c 'cmd "$@"' -- "$@").
