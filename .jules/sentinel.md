## 2026-06-20 - [Docker Env Secret Exposure & Command Injection]
**Vulnerability:** Passing API keys to Docker via string interpolation (`-e VAR=$VAR`) exposes them in `ps` output, and passing arguments to `bash -c` via `$*` string interpolation allows command injection.
**Learning:** Native docker env passthrough (`-e VAR`) is secure, and `bash -c './loop.sh "$@"' dummy "$@"` passes arguments securely out-of-band.
**Prevention:** Always use `-e VAR` for sensitive env vars and out-of-band arguments "$@" for subshells in shell scripts.
