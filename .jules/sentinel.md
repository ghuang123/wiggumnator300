## 2026-05-11 - Prevent Command Injection in Shell Scripts
**Vulnerability:** `bash -c "./loop.sh $*"` allows command injection if arguments contain shell metacharacters.
**Learning:** The `$*` interpolation in subshells is unsafe for user input.
**Prevention:** Always use `bash -c 'cmd "$@"' -- "$@"` to safely pass arguments to subshells.
