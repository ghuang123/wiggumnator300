## 2024-05-24 - Prevent API Key Leakage in Process List
**Vulnerability:** API keys (ANTHROPIC_API_KEY, CLAUDE_API_KEY) were passed to docker run using `-e "$var=${!var}"`, exposing them in the host's process table (visible via ps aux).
**Learning:** Shell scripts that dynamically construct Docker arguments must be careful not to interpolate sensitive environment variable values into the command line array.
**Prevention:** Use Docker's environment variable inheritance `-e "$var"` without assigning the value explicitly to prevent command-line exposure of secrets.
