## 2024-05-15 - Prevent command injection in bash -c
**Vulnerability:** The sandbox launcher interpolated raw arguments (`$*`) directly into a `bash -c` string, creating a command injection vulnerability if arguments contained shell metacharacters.
**Learning:** Shell scripts frequently pass arguments into inner contexts (like Docker). Using string interpolation for `bash -c` bypasses argument tokenization and executes untrusted input.
**Prevention:** Always securely pass arguments as positional parameters using the syntax `bash -c 'command "$@"' -- "$@"` to ensure arguments are treated as data, not code.
