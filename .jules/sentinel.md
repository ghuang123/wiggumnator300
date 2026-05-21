## 2026-05-21 - Prevent API Key Exposure to Process Listings
**Vulnerability:** API keys passed to Docker via `-e "VAR_NAME=$VAR_NAME"` expose plaintext secrets in the host's process listing (`ps aux`).
**Learning:** Command-line arguments for running processes are globally readable on many Unix systems. Interpolating secrets into command-line arguments leaks them to anyone with access to the host.
**Prevention:** Use native passthrough (e.g., `-e "VAR_NAME"`) which tells Docker to read the variable securely from the parent environment without exposing its value in the command-line arguments.
