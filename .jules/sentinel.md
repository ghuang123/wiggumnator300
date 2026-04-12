## 2026-04-12 - Command Injection in Docker Arguments
**Vulnerability:** Shell arguments passed to `bash -c` using `$*` string interpolation in `scripts/sandbox.sh` allow command injection.
**Learning:** Using `$*` inside double quotes for `bash -c` evaluates the variables before passing them to the shell, merging them into a single string that the subshell executes, bypassing argument boundaries.
**Prevention:** Always use single quotes for the command string and pass arguments using `"$@"` securely, e.g., `bash -c 'cmd "$@"' -- "$@"`.
