## 2026-05-20 - Prevent Command Injection in Subshells
**Vulnerability:** Arbitrary arguments passed to `sandbox.sh` were unsafely interpolated into a subshell via `bash -c "./loop.sh $*"`, allowing command injection inside the docker container.
**Learning:** String interpolation of user input directly into shell execution commands allows users to break out of intended commands.
**Prevention:** Always pass shell arguments securely to subshells using positional parameters, e.g., `bash -c 'cmd "$@"' -- "$@"` instead of string interpolation.
