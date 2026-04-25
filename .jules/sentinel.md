## 2026-04-25 - Secure Shell Argument Passing and Secret Passthrough
**Vulnerability:** Shell arguments were interpolated using $* which allows command injection, and API keys were passed using -e "VAR=${VAR}" which exposes them to ps listings.
**Learning:** bash -c with string interpolation and Docker -e with explicit values are common but insecure patterns in shell scripts that can lead to code execution and secret leakage.
**Prevention:** Always use bash -c 'cmd "$@"' -- "$@" for forwarding arguments, and use Docker's native -e "VAR_NAME" for passing environment variables securely.
