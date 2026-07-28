
## 2026-07-28 - [Preventing Secret Exposure and Command Injection in Docker Run]
**Vulnerability:** API keys were passed to Docker using `-e "VAR=$VAR"`, exposing them in `ps` output. Arguments were passed to a bash subshell using `bash -c "./loop.sh $*"`, allowing command injection.
**Learning:** Docker provides native environment variable passthrough (`-e "VAR"`) which hides the value from process listings. Shell subshells should receive arguments out-of-band via `"$@"` instead of string interpolation to prevent injection.
**Prevention:** Use `-e "VAR_NAME"` for secrets in Docker commands, and `bash -c 'cmd "$@"' dummy "$@"` when passing arguments to subshells.
