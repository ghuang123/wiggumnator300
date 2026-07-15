## 2026-07-15 - Prevent API Key Exposure and Command Injection in Docker
**Vulnerability:** API keys were explicitly passed to Docker (exposing them in host process listings via `ps`), and shell arguments were directly interpolated into a `bash -c` subshell, creating a command injection risk.
**Learning:** Hardcoded interpolations of sensitive variables or unescaped user inputs into subshells bypass built-in security protections and risk execution of arbitrary code or secret leakage.
**Prevention:** Use native Docker environment variable passthrough (`-e "VAR_NAME"`) to hide secrets from process listings, and pass shell arguments securely out-of-band using positional parameters (`bash -c 'cmd "$@"' dummy "$@"`).
