## 2026-06-01 - [Command Injection in Subshells]
**Vulnerability:** Command injection risk using string interpolation inside bash -c.
**Learning:** When passing shell arguments to a subshell via bash -c, using string interpolation evaluates variables prematurely and allows command injection if arguments contain shell metacharacters.
**Prevention:** Always use out-of-band positional arguments with a dummy $0 to securely pass arguments to subshells.
