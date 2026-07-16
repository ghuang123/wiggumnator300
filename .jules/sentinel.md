## 2026-07-16 - Secure Docker Arguments and Subshell Invocation
**Vulnerability:** API keys exposed to host process listings (`ps`) due to explicit command-line interpolation (`-e VAR=VAL`), and command injection risks from direct interpolation of shell arguments (`bash -c "cmd $*"`).
**Learning:** Process lists are globally readable. Environment variables must be passed using native passthrough (`-e VAR`) to prevent secrets from appearing in `ps` output. Subshells must use positional parameters (`bash -c 'cmd "$@"' dummy "$@"`) to prevent injection and handle spaces securely.
**Prevention:** Always use out-of-band methods for passing secrets to containers and arguments to subshells.
