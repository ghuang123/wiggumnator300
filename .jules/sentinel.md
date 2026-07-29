## 2026-07-29 - Prevent API key exposure in Docker process listings
**Vulnerability:** Sensitive API keys were passed to Docker containers using explicit command-line interpolation, exposing them to the host's process listing.
**Learning:** Shell expansion during array assignment places the literal secret value into the argument list, making it visible to all users on the host system.
**Prevention:** Always use Docker's native environment variable passthrough which reads the value securely from the host environment without exposing it in command arguments.
