## 2026-05-23 - Prevent Command Injection in Shell Arguments
**Vulnerability:** Shell arguments passed using string interpolation in a subshell execution allow for command injection.
**Learning:** Interpolating arguments directly into a string executed by a subshell means special characters are not properly escaped, which can lead to arbitrary code execution.
**Prevention:** Always pass shell arguments securely to subshells using explicit argument passing instead of string interpolation.
