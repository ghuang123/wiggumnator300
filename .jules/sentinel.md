
## $(date +%Y-%m-%d) - Fix Command Injection in Sandbox Script
**Vulnerability:** The sandbox launcher script directly interpolated all arguments (`$*`) into a string passed to `bash -c`, enabling arbitrary command injection if malicious arguments were appended.
**Learning:** Shell argument interpolation inside `bash -c "..."` is unsafe because the shell interprets metacharacters (e.g. `;`, `&`, `|`) before the string executes.
**Prevention:** Always pass variables securely out-of-band using positional parameters (e.g., `bash -c 'command "$@"' dummy "$@"`).
