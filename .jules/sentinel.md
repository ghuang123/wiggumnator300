## 2024-10-24 - Prevent command injection in sub-shells
**Vulnerability:** Command injection risk via `$*` interpolation in `bash -c`
**Learning:** Directly interpolating `$*` into a `bash -c` command string allows argument shell metacharacters to be executed. This is a common pattern in our bash wrapper scripts.
**Prevention:** Securely pass arguments as positional parameters using `bash -c 'command "$@"' -- "$@"` instead of string interpolation.
