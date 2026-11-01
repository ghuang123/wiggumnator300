
## 2024-10-25 - Prevent API Key Leakage in Docker Process Arguments
**Vulnerability:** API keys (ANTHROPIC_API_KEY, CLAUDE_API_KEY) passed to `docker run` using `-e "VAR=VALUE"` are visible in the host's process list (e.g., via `ps aux`).
**Learning:** Shell scripts dynamically constructing Docker arguments can inadvertently expose sensitive environment variables if the value is explicitly interpolated into the command line array.
**Prevention:** Use `-e "VAR"` without the `=VALUE` assignment to inherit the variable from the host environment, keeping the secret out of the process arguments.
