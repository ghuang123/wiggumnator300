## 2025-04-04 - Command Injection via $* in bash -c
**Vulnerability:** Found a command injection vulnerability in `scripts/sandbox.sh` where user inputs were interpolated directly into a shell string `bash -c "./loop.sh $*"`.
**Learning:** Shell array stringification (`$*`) should never be injected directly into a `bash -c` evaluated string. It allows attackers to break out of the script context by injecting shell metacharacters like `;`, `|`, or `&`.
**Prevention:** Always pass shell variables to `bash -c` securely using arguments `bash -c 'cmd "$@"' -- "$@"` instead of string interpolation.
