## 2026-04-18 - Command Injection in Docker Wrapper Scripts
**Vulnerability:** The sandbox launcher script passed arguments to an inner bash -c execution using unsafe string interpolation ($*), exposing it to command injection.
**Learning:** Using $* inside a double-quoted command string evaluated by bash -c allows passed quotes or commands to be executed directly.
**Prevention:** Always use the positional arguments feature of bash -c by passing arguments as 'cmd "$@"' -- "$@" to ensure safe execution.
