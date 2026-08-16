## 2024-08-16 - Command Injection via bash -c "$*"
**Vulnerability:** Passing unquoted `$*` arguments to `bash -c` allows for arbitrary command execution (e.g. `; echo pwned`).
**Learning:** Using `bash -c "script $*"` creates an injection point where user input is evaluated by the shell rather than passed as arguments.
**Prevention:** Use `bash script "$@"` to pass arguments securely without evaluation.
