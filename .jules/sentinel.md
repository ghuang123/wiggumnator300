## 2026-05-26 - Prevent Command Injection in bash -c

**Vulnerability:** Command injection via unsanitized $* string interpolation inside bash -c in a script wrapping a Docker execution.
**Learning:** Using bash -c "cmd $*" allows shell metacharacters in arguments to be evaluated as code by the subshell, enabling arbitrary command execution.
**Prevention:** Always pass arguments securely to subshells using the format bash -c 'cmd "$@"' -- "$@" to prevent premature expansion and evaluation.
