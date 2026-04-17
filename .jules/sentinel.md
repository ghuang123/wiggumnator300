## 2026-04-17 - Command Injection in Bash Interpolation
**Vulnerability:** Command injection risk in scripts/sandbox.sh due to string interpolation of $* directly into a bash -c string argument.
**Learning:** Interpolating arguments directly into an evaluated command string allows execution of arbitrary commands if the arguments contain shell metacharacters.
**Prevention:** Always pass user arguments as positional parameters and reference them securely via "$@" inside the bash -c command.
