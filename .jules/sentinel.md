## 2024-10-18 - [Prevent Command Injection in Bash Subshells]
**Vulnerability:** Shell arguments were unsafely interpolated into a subshell execution using `bash -c "./loop.sh $*"`, allowing command injection if malicious arguments were passed.
**Learning:** Directly interpolating `$*` into a command string passed to `bash -c` breaks the separation of code and data, executing any embedded shell metacharacters.
**Prevention:** Pass arguments as positional parameters using the syntax `bash -c 'command "$@"' -- "$@"` to ensure they are treated strictly as data.
