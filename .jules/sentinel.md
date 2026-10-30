
## 2024-10-30 - Docker Environment Variable Leakage
**Vulnerability:** API keys were passed to `docker run` using `-e "VAR=${!VAR}"`, which exposed the literal secret values in the host's process list.
**Learning:** Passing variable values directly in command arguments makes them visible to anyone running `ps aux` on the host machine.
**Prevention:** Always use `-e "$VAR"` to let Docker inherit the environment variable without exposing its value in the command line string.
