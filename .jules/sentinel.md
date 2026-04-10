## 2024-10-24 - Command Injection in sandbox arguments
**Vulnerability:** The sandbox launcher passed arguments to the container via `bash -c "./loop.sh $*"`, allowing command injection.
**Learning:** Using `$*` inside a double-quoted string for `bash -c` interpolates the arguments into the command string directly, allowing malicious input to break out and execute arbitrary commands.
**Prevention:** Always pass shell arguments securely as separate parameters, e.g., using `bash -c 'cmd "$@"' -- "$@"`.
