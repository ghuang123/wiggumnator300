
## 2026-05-19 - Prevent API Key Leakage via ps
**Vulnerability:** Passing secrets via docker command line arguments exposes them to `ps`.
**Learning:** Using `-e "VAR=$VAR"` exposes the secret to the process list, while native passthrough `-e "VAR"` safely bridges host environment to container.
**Prevention:** Always use Docker's native environment variable passthrough for secrets.
