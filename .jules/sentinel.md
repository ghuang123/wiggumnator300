## 2026-06-13 - Command Injection via String Interpolation in bash -c
**Vulnerability:** Unsafe interpolation of script arguments (`$*`) directly into a `bash -c` command string in `scripts/sandbox.sh`.
**Learning:** Using string interpolation like `bash -c "cmd $*"` allows attackers to inject arbitrary shell commands if the arguments contain shell metacharacters.
**Prevention:** Always pass shell arguments securely out-of-band to subshells using positional arguments, taking care to provide a dummy `$0` argument (e.g., `bash -c 'cmd "$@"' dummy "$@"`).
