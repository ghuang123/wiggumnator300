
## 2024-03-24 - Prevent Secret Exposure in Docker Arguments
**Vulnerability:** Passing API keys directly in `docker run` arguments using `-e "VAR=VAL"`.
**Learning:** Command line arguments are visible to all users on the host system via `ps aux`, exposing sensitive secrets.
**Prevention:** Use `-e "VAR"` to inherit the environment variable securely from the host without exposing its value on the command line.
