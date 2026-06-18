## 2024-06-18 - Prevent Secret Leakage in `docker run` and Command Injection in Subshells
**Vulnerability:** API keys were exposed to the host process list via environment flags and user input was unsafely expanded inside shell subcommands.
**Learning:** Container runtimes support native env passthrough without exposing values to host process listings, and shell subcommands require out-of-band positional arguments to safely forward parameters.
**Prevention:** Always use native variable passthrough for secrets, and securely pass out-of-band parameters to subshells rather than command-line string interpolation.
