
## 2024-09-06 - Prevent command injection in bash -c
**Vulnerability:** Command injection in `scripts/sandbox.sh` via `bash -c "./loop.sh $*"`.
**Learning:** Using `$*` directly inside the string for `bash -c` allows arbitrary command execution if an argument contains shell metacharacters like semicolons.
**Prevention:** Use `bash -c 'command "$@"' -- "$@"` to pass arguments securely without them being evaluated by the inner shell.
