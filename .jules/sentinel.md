## 2026-05-01 - Command Injection in Docker Sandboxing
**Vulnerability:** Shell argument string interpolation (`$*`) in `bash -c` allows command injection within the Docker container.
**Learning:** Even when wrapping commands for a sandbox, concatenating arguments directly into a string evaluated by `bash -c` is unsafe if arguments contain shell metacharacters.
**Prevention:** Always use `"$@"` to securely pass arguments to `bash -c`, e.g., `bash -c 'cmd "$@"' -- "$@"`.
