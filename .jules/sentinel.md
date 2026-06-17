## 2024-06-17 - Command Injection via Unsafe Shell Argument Expansion
**Vulnerability:** Shell arguments passed to `bash -c` using `$*` string interpolation allow execution of arbitrary commands if an argument contains shell metacharacters (e.g., `;` or `&&`).
**Learning:** Using `$*` inside quotes in `bash -c` evaluates variables dynamically and injects the raw values directly into the command string before the subshell parses it.
**Prevention:** Always pass shell arguments securely out-of-band to `bash -c` subshells as positional arguments (e.g., `bash -c 'cmd "$@"' dummy "$@"').
