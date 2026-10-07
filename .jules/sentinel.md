## 2024-10-25 - API Key Exposure in Docker Process List
**Vulnerability:** API keys were passed to `docker run` using `-e "$var=${!var}"` syntax in `scripts/sandbox.sh`.
**Learning:** Passing environment variables with explicit values on the command line makes them visible to all users on the host machine via the process table (`ps aux`). Docker supports inheriting variables directly using `-e "$var"`.
**Prevention:** Always use `-e "$var"` without assigning the value when passing existing host environment variables to Docker containers.
