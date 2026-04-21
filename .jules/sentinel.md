## 2026-04-21 - Command Injection via Unsanitized Shell Arguments
**Vulnerability:** Command injection vulnerability in `scripts/sandbox.sh` caused by passing arguments via string interpolation (`bash -c "./loop.sh $*"`).
**Learning:** String interpolation of user arguments directly into `bash -c` strings allows arbitrary command execution if an argument contains shell metacharacters (e.g., `;`, `&`).
**Prevention:** Always use secure argument passing with `bash -c 'cmd "$@"' -- "$@"` to ensure arguments are handled as safe parameters rather than parsed as executable code.
