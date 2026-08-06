## 2026-08-06 - Prevent Command Injection in Docker Arguments
**Vulnerability:** The sandbox launcher passed arguments to the Docker container via `bash -c "./loop.sh $*"`. This string interpolation allows command injection if an argument contains a semicolon or other shell metacharacters (e.g., `./sandbox.sh "hello; malicious_cmd"`).
**Learning:** Using `$*` inside a string passed to `bash -c` unsafely expands all arguments as part of the executed string, bypassing normal argument boundaries.
**Prevention:** Always pass arguments to `bash -c` by using `"$@"` and providing the arguments after `--` (e.g., `bash -c './script.sh "$@"' -- "$@"`). This ensures arguments are passed as separate, safely escaped parameters rather than being interpolated into the command string.
