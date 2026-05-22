## 2026-05-22 - Command Injection via String Interpolation in bash -c
**Vulnerability:** A script passed user-supplied arguments to a Docker container via a string-interpolated `bash -c "cmd $*"` command.
**Learning:** Passing parameters inside double-quotes to `bash -c` allows the inner shell to interpret shell metacharacters present in the variables, leading to arbitrary command execution.
**Prevention:** Always pass shell arguments securely to subshells using `bash -c 'cmd "$@"' -- "$@"` to prevent the inner shell from interpreting them as code.
