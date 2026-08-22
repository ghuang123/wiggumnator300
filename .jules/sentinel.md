## 2024-08-22 - Command Injection in Docker Argument Passing
**Vulnerability:** User arguments (`$*`) were directly interpolated into a `bash -c` string for docker execution (`bash -c "./loop.sh $*"`), allowing arbitrary command execution within the sandbox via injection (e.g. `sandbox.sh "plan; malicious_command"`).
**Learning:** Using `bash -c "command $*"` evaluates the arguments as part of the shell string, exposing the script to injection attacks if the arguments contain shell metacharacters like `;`, `&`, or `|`.
**Prevention:** Pass arguments securely by calling the script directly (e.g., `"./loop.sh" "$@"`) so the shell treats them strictly as arguments rather than executable code.
