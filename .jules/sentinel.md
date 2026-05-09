## 2026-05-09 - Prevent API Key Exposure in Docker Process Listings
**Vulnerability:** Interpolating API keys into Docker command line arguments (e.g., `-e VAR=$VAR`) exposed them in process listings (`ps`).
**Learning:** Docker supports native environment variable passthrough (e.g., `-e VAR`) which securely passes the value from the host environment without exposing it in the command string.
**Prevention:** Always use native environment variable passthrough when passing secrets to Docker containers in shell scripts.
