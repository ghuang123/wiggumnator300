## 2024-05-24 - Fix Command Injection in Sandbox Script
**Vulnerability:** `bash -c "./loop.sh $*"` was used in `scripts/sandbox.sh`, allowing arbitrary shell commands to be injected and run in the container if malicious arguments are passed.
**Learning:** Using `$*` inside a `bash -c` string interpolates the arguments into a single string that the shell then parses, making it trivial to inject commands via metacharacters like `;`.
**Prevention:** Always pass arguments explicitly as a list (e.g. `"$@"`) rather than interpolating them into a shell command string.
