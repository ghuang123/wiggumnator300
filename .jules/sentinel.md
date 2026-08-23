## 2024-08-23 - Command Injection in Docker Arguments
**Vulnerability:** Command injection vulnerability via `bash -c "./loop.sh $*"` in sandbox launcher arguments.
**Learning:** Shell metacharacters passed to the sandbox launcher could be executed by `bash -c` inside the container because `$*` expands into a single string evaluated by the shell.
**Prevention:** Always pass arguments to scripts using `"$@"` as direct array elements rather than string interpolation in `bash -c`.
