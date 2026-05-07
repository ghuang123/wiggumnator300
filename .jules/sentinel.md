## 2026-05-07 - Secure Docker Arguments Passing
**Vulnerability:** API keys passed to Docker via '-e VAR=$VAR' were visible in the system process list (ps). Command arguments were passed via unquoted '$*' interpolation to bash -c, risking command injection.
**Learning:** Shell evaluation makes sensitive command line arguments visible system-wide, and naive string interpolation into subshells circumvents bash's argument parsing protections.
**Prevention:** Always use native Docker environment passthrough ('-e VAR') and explicitly pass positional parameters to subshells ('bash -c '\''cmd "$@"'\'' -- "$@"').
