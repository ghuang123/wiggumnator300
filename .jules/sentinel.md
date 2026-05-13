## 2026-05-13 - [API Key Process Leak via Docker Args]
**Vulnerability:** Interpolating API keys directly into docker run arguments (`-e "VAR=$VAR"`) exposes them to process listings (`ps aux`).
**Learning:** The command line arguments of a process are globally visible to all local users on Unix systems.
**Prevention:** Always use Docker's native environment variable passthrough (`-e "VAR_NAME"`) to keep the value out of the command line arguments.
