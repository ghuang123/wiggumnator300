## 2026-07-12 - Prevent API key exposure and command injection in sandbox
**Vulnerability:** API keys were exposed to host process lists via explicit `-e "VAR=$VAR"` and command injection was possible via `bash -c "cmd $*"`.
**Learning:** Explicitly interpolating environment variables exposes secrets to `ps`. Interpolating shell arguments directly to bash subshells allows command injection.
**Prevention:** Use native docker `-e "VAR_NAME"` for secrets and pass arguments securely via out-of-band positional parameters `bash -c 'cmd "$@"' dummy "$@"`.
