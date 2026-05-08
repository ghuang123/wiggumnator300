## 2026-05-08 - [Prevent exposing secrets in process listings]
**Vulnerability:** API keys passed to Docker via `-e "VAR=$VAR"` are exposed to any user running `ps` on the host.
**Learning:** Command-line interpolation of environment variables makes them visible in the process table.
**Prevention:** Always use Docker's native environment passthrough (`-e "VAR"`) which securely passes the variable from the host to the container without exposing its value in process listings.
