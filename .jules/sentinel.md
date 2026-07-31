## 2026-07-31 - Secure argument passing to subshells
**Vulnerability:** Shell arguments passed to a Docker container via `bash -c "cmd $*"` were interpolated directly into the command string.
**Learning:** Even when passing arguments to an isolated environment like Docker, injecting user input directly into a `bash -c` string evaluation creates an injection vector.
**Prevention:** Pass shell arguments securely out-of-band using positional parameters (e.g., `bash -c 'cmd "$@"' dummy "$@"`) to prevent dynamic evaluation.
