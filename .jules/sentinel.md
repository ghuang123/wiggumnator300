## 2024-10-24 - Command Injection in nested bash via string interpolation
**Vulnerability:** Command injection vulnerability in sandbox runner due to passing arguments to `bash -c` via `$*` string interpolation.
**Learning:** Embedding `$*` inside double-quoted `bash -c` strings allows malicious arguments to be evaluated by the inner shell.
**Prevention:** Always pass arguments explicitly using `bash -c 'cmd "$@"' -- "$@"`.