## 2024-03-28 - [Command Injection via String Interpolation in `bash -c`]
**Vulnerability:** Command injection in `scripts/sandbox.sh` due to using `$*` string interpolation inside `bash -c`. User input could inject arbitrary shell commands.
**Learning:** Shell arguments passed to `bash -c` should never use string interpolation (`$*` or `$@` directly inside the string). It allows attackers to break out of the command string.
**Prevention:** Always pass arguments securely using `bash -c 'cmd "$@"' -- "$@"`. This passes the arguments as positional parameters to the subshell rather than interpolating them into the script string.
