## 2026-05-24 - Prevent Command Injection in bash -c
**Vulnerability:** String interpolation of $* within a bash -c execution string creates a command injection vulnerability where script arguments containing shell characters could be executed inadvertently.
**Learning:** Shell arguments should not be injected directly into a subshell's execution string. This bypasses proper shell parsing.
**Prevention:** Always pass shell arguments securely to subshells by passing them as arguments to the subshell via -- "$@", ensuring they are assigned securely within the subshell context.
