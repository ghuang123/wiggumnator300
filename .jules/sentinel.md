## 2026-04-29 - Prevent Command Injection and Secret Exposure in Docker Arguments
**Vulnerability:** API keys were exposed in `ps` output via Docker `-e` arguments, and arguments passed to Docker via `bash -c` used insecure `$*` interpolation, allowing command injection.
**Learning:** Native Docker environment passthrough (`-e "VAR_NAME"`) prevents secrets from appearing in process listings. Using `bash -c 'cmd "$@"' -- "$@"` safely passes arguments without shell interpolation.
**Prevention:** Always use native `-e` for Docker secret passthrough and explicitly array-pass arguments to nested shells.
