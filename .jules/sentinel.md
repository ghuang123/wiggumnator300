## 2026-07-14 - Prevent secret leakage in process listing and shell argument injection
**Vulnerability:** Sensitive API keys were passed to Docker using explicit command-line interpolation (-e "VAR=value"), exposing them via ps. Shell arguments were interpolated directly into a bash -c string, risking command injection.
**Learning:** Hardcoding variable evaluation on the command line leaks secrets to the process list. Subshells should use out-of-band parameters instead of direct string interpolation.
**Prevention:** Use Docker's native environment passthrough (-e "VAR_NAME") and pass arguments out-of-band using positional parameters (bash -c 'cmd "$@"' dummy "$@").
