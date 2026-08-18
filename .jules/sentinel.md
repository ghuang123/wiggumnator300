## 2024-08-18 - Command Injection via bash -c and $*
**Vulnerability:** The sandbox launcher passed unquoted arguments to `bash -c` using `$*`, allowing arbitrary command execution if a malicious payload was passed to the launcher.
**Learning:** Using `bash -c` with string concatenation or unquoted `$*` evaluates the expanded string as code rather than passing arguments to a script, opening up command injection vectors.
**Prevention:** Always pass arguments to the script directly (e.g., `bash ./script.sh "$@"`) and use quoted array expansion `"$@"` to preserve argument boundaries.
