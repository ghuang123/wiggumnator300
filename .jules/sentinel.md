## 2026-04-30 - Secure argument passing and secret handling in Docker run
**Vulnerability:** Shell arguments to Docker were passed via unquoted string interpolation ($*) causing command injection risks, and sensitive API keys were passed directly on the CLI (-e VAR=value) exposing them to process lists.
**Learning:** Bash word splitting can alter arguments and allow arbitrary commands if $* is used inside double quotes. Docker's -e flag allows native variable passthrough without value assignment to hide secrets from ps.
**Prevention:** Always use bash -c 'cmd "$@"' -- "$@" to forward arguments securely and rely on Docker's native -e VAR for secrets.
