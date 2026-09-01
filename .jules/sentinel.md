## 2024-09-01 - Command Injection in bash -c
**Vulnerability:** The script interpolated unvalidated user input (`$*`) directly into a string executed by `bash -c`, allowing arbitrary command execution (e.g., passing `"; id; echo "` as an argument).
**Learning:** Using `$*` or `$@` inside double quotes for `bash -c` is unsafe because the shell expands it before `bash -c` parses it.
**Prevention:** Pass user input as positional parameters to `bash -c` using the syntax `bash -c '...' -- "$@"`.
