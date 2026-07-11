## 2026-07-11 - Secure Environment Variables and Subshell Arguments
**Vulnerability:** Explicit command-line interpolation of API keys in Docker arguments exposed them to host process listings, and direct string interpolation of shell arguments into 'bash -c' created command injection risks.
**Learning:** Shell evaluation happens before command execution, causing interpolated variables like $var=${!var} to appear in 'ps' output. Similarly, $* inside a string for a subshell executes its contents blindly instead of treating them as positional arguments.
**Prevention:** Use native Docker passthrough (e.g., -e "VAR_NAME") to keep secrets out of command-line arguments, and pass arguments to subshells securely out-of-band using positional parameters (e.g., bash -c 'cmd "$@"' dummy "$@").
