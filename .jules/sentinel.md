## 2024-08-04 - Command Injection in Sandbox Launcher
**Vulnerability:** The sandbox.sh script interpolated shell arguments directly into a bash -c string, allowing command injection.
**Learning:** Even internal tooling scripts passing arguments to docker containers can be vulnerable if they use string interpolation instead of positional arguments for subshells.
**Prevention:** Always pass arguments securely out-of-band using positional parameters (e.g., bash -c 'cmd "$@"' dummy "$@") instead of `$*` or `$@` directly within the string.
