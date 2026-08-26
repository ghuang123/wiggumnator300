## 2023-10-24 - Command Injection in Docker Launch Scripts
**Vulnerability:** Found `bash -c "./loop.sh $*"` in `scripts/sandbox.sh` which allows arbitrary command execution if an attacker passes arguments containing command separators.
**Learning:** Using `bash -c` with unquoted `$*` evaluates the expanded string, exposing the host or container to injection via malicious arguments.
**Prevention:** Pass arguments securely by calling the script directly (e.g., `./loop.sh "$@"`) so the shell expansion is handled safely by the execve system call rather than interpreted by a subshell.
