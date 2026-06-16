## 2026-06-16 - [Command Injection via Shell Argument Handling]
**Vulnerability:** Shell arguments were interpolated directly into a bash command string, allowing arbitrary command execution.
**Learning:** Using string interpolation in bash commands makes scripts vulnerable to injection even if passed safely to the parent script.
**Prevention:** Always pass shell arguments securely out-of-band using positional parameters.
