## 2024-05-24 - Command Injection in bash -c
**Vulnerability:** Command injection risk when interpolating user arguments directly into a `bash -c` string in scripts/sandbox.sh.
**Learning:** Shell parameters like `$*` expanded directly inside the `bash -c` command string allow malicious input containing shell metacharacters to execute arbitrary commands within that subshell context.
**Prevention:** Always pass arguments to `bash -c` as secure positional parameters using the syntax `bash -c 'command "$@"' -- "$@"`.
