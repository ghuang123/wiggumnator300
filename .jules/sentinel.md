
## 2024-11-11 - Secure Docker Environment Variable Passing
**Vulnerability:** Sensitive API keys were exposed to the host process list because they were passed to docker run using the -e VAR=value syntax.
**Learning:** In bash scripts that wrap Docker commands, interpolating sensitive variable values directly into the -e flag arguments exposes them on the command line.
**Prevention:** When dynamically passing environment variables to a Docker container, use the -e "$var" syntax to inherit the value securely from the host environment without exposing it in the command arguments.
