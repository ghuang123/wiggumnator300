## 2024-05-24 - Prevent Command Injection in bash -c
**Vulnerability:** Command injection risk via string interpolation ($*) in a bash -c command within scripts/sandbox.sh.
**Learning:** Interpolating arguments directly into the command string executed by bash -c allows malicious arguments to execute arbitrary commands.
**Prevention:** Always pass shell arguments securely by keeping them outside the command string and passing them as arguments to the bash execution context (e.g., `bash -c 'cmd "$@"' -- "$@"`).
