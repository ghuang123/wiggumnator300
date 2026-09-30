## 2024-10-25 - Process List Secret Exposure in Docker Env Vars
**Vulnerability:** API keys were passed to Docker using `-e "VAR=${!VAR}"`, which exposes the plaintext secret in the host's process list.
**Learning:** Shell expansion of secrets into command line arguments makes them globally readable to other users on the same machine via tools like `ps aux`.
**Prevention:** Use Docker's environment variable inheritance `-e "VAR"` without the assignment, which safely passes the value directly from the host environment to the container without exposing it in the command invocation.
