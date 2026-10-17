
## 2024-10-24 - Process List API Key Exposure in Docker Run
**Vulnerability:** API keys (ANTHROPIC_API_KEY, CLAUDE_API_KEY) were dynamically passed to a Docker container via `docker run` using `-e "$var=${!var}"`. This exposed the plain text values of the API keys on the command line.
**Learning:** Any arguments passed to a command (like `docker run`) are visible to all users on the host system via the process list (e.g., `ps aux`). Including secrets directly in the command line arguments creates a significant exposure risk.
**Prevention:** When passing environment variables to a Docker container, use the `-e "$var"` syntax to inherit the variable directly from the host environment, rather than interpolating its value into the command line arguments.
