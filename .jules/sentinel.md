## 2026-07-09 - Bash Subshell Command Injection via Interpolation
**Vulnerability:** Shell arguments were unsafely interpolated into a subshell command string (`bash -c "cmd $*"`), creating a command injection vector if arguments contained shell metacharacters.
**Learning:** Even internal helper scripts like sandboxes can introduce command injection if they wrap commands without properly preserving argument boundaries.
**Prevention:** Always pass positional parameters to subshells out-of-band using `bash -c 'cmd "$@"' dummy "$@"`.

## 2026-07-09 - Secret Exposure via Docker CLI Interpolation
**Vulnerability:** API keys were passed to Docker containers using explicit command-line interpolation (`-e "VAR_NAME=$VAR_NAME"`), making the secret value visible in the host process list (`ps`).
**Learning:** Command-line arguments of running processes are often globally readable on Linux systems, making explicit secret interpolation highly dangerous for CLI tools.
**Prevention:** Utilize native environment variable passthrough features of tools (e.g., Docker's `-e "VAR_NAME"` without a value) to securely propagate secrets without exposing them in arguments.
