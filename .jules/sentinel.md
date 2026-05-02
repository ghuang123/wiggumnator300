## 2026-05-02 - Docker Secret Exposure and Command Injection
**Vulnerability:** API keys passed to Docker via string interpolation (`-e "$var=${!var}"`) and shell arguments passed via `$*` string interpolation.
**Learning:** Environment variable values specified on the command line are visible in system process listings (`ps`), exposing secrets. Using `$*` inside `bash -c` string interpolation allows command injection if arguments contain shell metacharacters.
**Prevention:** Always use native Docker environment variable passthrough (`-e "VAR_NAME"`) and pass shell arguments securely to `bash -c` using `"$@"` with a `--` delimiter.
