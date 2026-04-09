## 2026-04-09 - Command Injection in Sandbox Launcher
**Vulnerability:** Shell arguments were unsafely interpolated into a bash string `bash -c "./loop.sh $*"` in `scripts/sandbox.sh`.
**Learning:** String interpolation of `$*` into a `bash -c` string allows command injection if arguments contain shell metacharacters.
**Prevention:** Pass shell arguments securely to `bash -c` using `bash -c 'cmd "$@"' -- "$@"`.
