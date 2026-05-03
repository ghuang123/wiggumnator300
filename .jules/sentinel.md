## 2026-05-03 - Prevent Command Injection in Bash Subshells
**Vulnerability:** Shell script arguments were interpolated into a bash -c string (`bash -c "./loop.sh $*"`), allowing potential command injection if arguments contained shell metacharacters.
**Learning:** String interpolation of user input into shell execution context inherently bypasses shell tokenization protections, creating command injection vectors.
**Prevention:** Always pass shell arguments securely to subshells using positional parameters (e.g., `bash -c 'cmd "$@"' -- "$@"`).
