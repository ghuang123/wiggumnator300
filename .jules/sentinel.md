## 2026-06-06 - Command Injection via bash -c interpolation
**Vulnerability:** Shell arguments were unsafely interpolated into a bash command string.
**Learning:** String interpolation of user arguments into bash -c allows trivial command injection.
**Prevention:** Always pass shell arguments securely as out-of-band positional parameters (e.g., bash -c 'cmd "$@"' dummy "$@").
