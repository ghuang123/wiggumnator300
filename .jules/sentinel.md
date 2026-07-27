## 2026-07-27 - Secure Docker Args and Subshell Invocation
**Vulnerability:** API keys were exposed to the host process list via `-e "VAR=$VAR"`, and command injection was possible via `bash -c "./loop.sh $*"`.
**Learning:** In wiggumnator300's CLI context, dynamically constructed Docker commands must use native environment passthrough (`-e VAR`) and out-of-band bash subshell arguments (`bash -c '...' dummy "$@"`) to prevent secrets leakage and command injection.
**Prevention:** Always use Docker's native `-e VAR` for secrets and pass bash arguments positionally using `"$@"` with a dummy `$0`.
