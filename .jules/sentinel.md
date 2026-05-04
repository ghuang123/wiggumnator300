
## 2026-05-04 - Command Injection in Docker args
**Vulnerability:** Command injection via insecure interpolation of $* into a bash -c string literal in sandbox.sh.
**Learning:** Using string interpolation like bash -c "cmd $*" allows malicious input to execute arbitrary shell commands inside the container since the string is evaluated by the outer shell before being executed by bash -c.
**Prevention:** Always pass shell arguments securely to subshells using single quotes around the command string and explicitly passing args via -- "$@" (e.g. bash -c 'cmd "$@"' -- "$@").
