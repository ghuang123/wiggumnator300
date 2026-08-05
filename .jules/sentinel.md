## 2026-08-05 - Prevent Command Injection in Docker Arguments
**Vulnerability:** The script `scripts/sandbox.sh` used `bash -c "./loop.sh $*"` to execute the loop script inside the container. This allowed command injection if arguments contained shell metacharacters (e.g., quotes, semicolons), as they were evaluated by the shell inside the container.
**Learning:** Shell evaluation of concatenated strings (like `$*` inside `bash -c`) introduces command injection risks, even in containerized environments. Direct command execution without an intermediate shell avoids this entirely.
**Prevention:** Always pass arguments as direct list elements/positional parameters (`./loop.sh "$@"`) rather than interpolating them into a shell command string.
