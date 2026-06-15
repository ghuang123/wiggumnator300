## 2026-06-15 - [Command Injection via Argument Interpolation]
**Vulnerability:** Passing shell arguments via string interpolation (e.g., $*) allows command injection.
**Learning:** Shell arguments must not be interpolated into strings evaluated as commands.
**Prevention:** Pass shell arguments securely to subshells using out-of-band positional arguments.
