## 2026-06-09 - Command Injection in bash -c
**Vulnerability:** Shell arguments were unsafely interpolated into a bash -c command string, creating a command injection vulnerability.
**Learning:** Interpolating variables into bash -c commands exposes scripts to command injection.
**Prevention:** Always pass shell arguments securely as out-of-band positional arguments using a dummy argument (e.g., bash -c 'cmd "$@"' dummy "$@").
