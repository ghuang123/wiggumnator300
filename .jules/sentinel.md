## 2026-04-26 - Secure Docker Invocation in Sandbox
**Vulnerability:** API keys passed to Docker via `-e VAR=VAL` leaked to process listings (`ps`), and `$*` used inside `bash -c` allowed command injection.
**Learning:** Shell script wrappers for Docker must pass secrets via native passthrough (`-e VAR`) and arguments securely (`bash -c 'cmd "$@"' -- "$@"`) to avoid environment leakage and command injection.
**Prevention:** Always use `-e VAR_NAME` without values for secrets and pass array arguments with `"$@"` after `--` for `bash -c`.
