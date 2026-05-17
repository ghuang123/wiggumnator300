## 2026-05-17 - Secure Environment Variable Passthrough
**Vulnerability:** API keys exposed in process listings via command-line arguments.
**Learning:** Passing environment variables with explicit value assignments to Docker exposes the values to any user who runs ps on the host system.
**Prevention:** Always use native Docker environment passthrough (passing just the variable name) for sensitive data to keep secrets out of process arguments.
