
## 2024-10-28 - Command Injection in bash -c
**Vulnerability:** Arguments were passed unsafely via `bash -c "./loop.sh $*"`.
**Learning:** Shell metacharacters in arguments passed this way are interpolated directly into the command string, allowing command injection.
**Prevention:** Securely pass arguments as positional parameters using the syntax `bash -c 'command "$@"' -- "$@"`.
