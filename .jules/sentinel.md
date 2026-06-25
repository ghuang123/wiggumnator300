## 2026-06-25 - Prevent API Key Exposure in Process Listings
**Vulnerability:** API keys passed to Docker via explicit command-line interpolation (`-e VAR=$VAR`) can be exposed to other users on the host system via process listings (`ps -ef`).
**Learning:** Shell command interpolation of secrets makes them part of the command line arguments visible to the OS process monitor, rather than securely inherited environment variables.
**Prevention:** Always use Docker's native environment variable passthrough (`-e VAR`) which securely propagates the variable from the host environment to the container without exposing its value in the command execution arguments.
