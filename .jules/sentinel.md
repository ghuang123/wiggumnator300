## 2024-11-20 - [Fix Command Injection in Sandbox Launcher]
**Vulnerability:** The sandbox launcher script (`scripts/sandbox.sh`) was vulnerable to command injection because it passed user arguments (`$*`) into a string executed by `bash -c` (`bash -c "./loop.sh $*"`). An attacker could pass arguments containing semicolons (e.g., `5; malicious_cmd`) to execute arbitrary commands inside the container context.
**Learning:** Using `bash -c "cmd $*"` improperly interpolates variables into a single string executed by the subshell, re-evaluating the shell meta-characters.
**Prevention:** Avoid wrapping user inputs in `bash -c` string interpolation. Pass arguments explicitly as an array directly to the underlying script or entrypoint (`"./loop.sh" "$@"`).
