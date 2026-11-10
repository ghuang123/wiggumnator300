
## 2024-11-10 - Secure Environment Variable Passing to Docker
**Vulnerability:** API keys were passed to Docker containers using `-e "VAR=${VAR}"`, which exposes the plaintext secret in the host's process list (`ps aux`) since the value is evaluated and passed as a command-line argument to the `docker run` executable.
**Learning:** Shell evaluation of secrets into command line arguments makes them globally readable on the host machine.
**Prevention:** When passing environment variables to Docker, use `-e "VAR"` (without the value) so Docker reads it directly from the host's environment variables rather than the process arguments.
