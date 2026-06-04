## 2026-06-04 - [Command Injection via String Interpolation in subshell]
**Vulnerability:** Shell arguments were unsafely passed into a subshell.
**Learning:** String interpolation evaluates arguments within the current shell's context before the subshell executes, allowing attackers to inject commands.
**Prevention:** Always pass shell arguments securely to subshells using out-of-band positional arguments, explicitly including a dummy $0 argument.
