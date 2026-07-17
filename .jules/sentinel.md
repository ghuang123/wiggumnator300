## 2026-07-17 - Prevent command injection and secret exposure in Docker args
**Vulnerability:** Command injection risk via unsanitized input (`bash -c "./loop.sh $*"`) and exposing API keys to host process listings via `-e "VAR_NAME=$VAR_NAME"` in `scripts/sandbox.sh`.
**Learning:** Interpolating shell arguments directly into a command string allows for command injection. Explicitly passing environment variable values in CLI arguments exposes them to `ps`.
**Prevention:** Pass arguments securely out-of-band using positional parameters (e.g., `bash -c './loop.sh "$@"' dummy "$@"`) and use native Docker passthrough (e.g., `-e "VAR_NAME"`).
