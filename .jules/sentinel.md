
## 2024-11-20 - [Fix Command Injection in Docker Launch]
**Vulnerability:** Command injection in `sandbox.sh` via `bash -c "./loop.sh $*"`.
**Learning:** Using `$*` inside a `bash -c` string interpolates arguments directly into the command string, allowing attackers to break out of the script and execute arbitrary commands by passing shell metacharacters.
**Prevention:** Always pass script arguments as an array (`"$@"`) directly to the executable or interpreter, avoiding `bash -c` evaluation.
