## 2024-09-14 - Prevent Secret Exposure in Process List
**Vulnerability:** API keys were being passed to Docker containers using `-e "VAR=${VAR}"`, exposing the plaintext secrets on the command line where they are visible to any user via `ps aux`.
**Learning:** In bash scripts launching containers, explicit variable interpolation in arguments leaks secrets to the host's process table.
**Prevention:** Use Docker's environment variable inheritance by passing just the variable name (`-e "VAR"`) so the value is securely read directly from the environment without command-line exposure.
