## 2026-07-05 - Prevent Secret Exposure in Process Listings and Command Injection
**Vulnerability:** API keys were passed to Docker using explicit interpolation, exposing them in process listings (`ps`). Additionally, shell arguments were directly interpolated into a subshell (`bash -c "./loop.sh $*"`), allowing command injection.
**Learning:** Interpolating environment variables directly into command line arguments exposes them to the system. Direct interpolation in `bash -c` strings is unsafe and allows injected commands to run.
**Prevention:** Use native passthrough (`-e "VAR_NAME"`) to pass environment variables securely, and pass arguments to subshells out-of-band using positional parameters (`bash -c 'cmd "$@"' dummy "$@"`).
