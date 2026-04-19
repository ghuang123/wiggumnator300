## 2026-04-19 - Secret Exposure and Command Injection in Docker Launch Scripts
**Vulnerability:** API keys passed to Docker via `-e "VAR=$VAR"` exposed secrets in process listings. Unquoted `$*` in `bash -c` allowed command injection.
**Learning:** Command-line interpolation of secrets exposes them to `ps`. Unquoted arguments passed to shell interpreters break execution boundaries.
**Prevention:** Use native Docker environment variable passthrough (`-e "VAR"`) and securely pass shell arguments using `"$@"`.
