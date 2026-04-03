## 2024-04-03 - Prevent Command Injection in Bash Execute Strings
**Vulnerability:** Shell arguments interpolated directly into `bash -c` strings using `$*` can lead to command injection if arguments contain shell metacharacters or command substitutions.
**Learning:** Using `$*` within a double-quoted `bash -c` execution string prematurely evaluates the variables in the parent shell, exposing the command execution to injection.
**Prevention:** Always pass arguments securely to `bash -c` by using single quotes for the script string and passing arguments positionally with `-- "$@"`.
