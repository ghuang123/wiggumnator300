## 2026-07-30 - Prevent Secrets Exposure in Docker Process Listings
**Vulnerability:** API keys (ANTHROPIC_API_KEY, CLAUDE_API_KEY) were passed to Docker containers using explicit command-line interpolation (-e VAR=value), exposing them to host process listings (ps).
**Learning:** Shell interpolation of secrets into Docker command arguments makes them visible to any user on the host system who can run ps.
**Prevention:** Use native passthrough (-e VAR) to securely inject environment variables without exposing them in the command line.
