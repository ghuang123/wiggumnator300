
## 2024-11-05 - Docker Process List Credential Leak
**Vulnerability:** Passing API keys to Docker via `-e "$var=${!var}"` exposed the raw values on the command line, making them visible in the host's process list.
**Learning:** Shell scripts dynamically building `docker run` arguments often inject environment values directly into the command string, unintentionally exposing them.
**Prevention:** Always use `-e "$var"` without the value assignment to allow Docker to inherit the variable directly from the host environment.
