## 2026-07-02 - Command Injection and Secret Exposure in Shell Scripting
**Vulnerability:** API keys were exposed in process listings (ps) due to explicit command-line interpolation in docker run, and arguments passed to a subshell used unsafe string interpolation, risking command injection.
**Learning:** Shell scripts must use native Docker environment variable passthrough (-e VAR) to protect secrets from ps, and arguments to bash -c must be passed via out-of-band positional parameters (e.g., bash -c 'cmd "$@"' dummy "$@") rather than string interpolation.
**Prevention:** Always use docker run -e VAR without a value for secrets, and securely pass variables to subshells using positional arguments with a dummy $0.
