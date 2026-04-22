
## 2026-04-22 - Prevent Command Injection with Safe Argument Passthrough
**Vulnerability:** Command injection vulnerability in sandbox execution due to unsafe string interpolation of arguments (`$*`) directly into a shell command string.
**Learning:** Interpolating `$*` into a `bash -c` command allows malicious arguments to execute arbitrary shell commands inside the container sandbox.
**Prevention:** Pass shell arguments securely using the `"$@"` array parameter expansion with `bash -c 'cmd "$@"' -- "$@"` to ensure robust bounds, preventing injection.
