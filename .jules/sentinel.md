## 2024-03-25 - Prevent Command Injection in Bash

**Vulnerability:** Found a command injection vulnerability in `scripts/sandbox.sh` where user inputs (arguments passed to script) were interpolated directly into a `bash -c` command string using `$*`. An attacker could pass crafted arguments to execute arbitrary commands inside the container.
**Learning:** Interpolating arguments like `$*` directly into the string evaluated by `bash -c` means that any special characters in those arguments will be parsed by the shell executing the command, rather than treated strictly as positional parameters.
**Prevention:** When passing arguments to `bash -c`, always use `"$@"` securely by passing it outside the command string: `bash -c 'command "$@"' -- "$@"`. This passes the arguments as positional parameters `$1`, `$2`, etc. to the inner bash invocation, safely handling spaces and special characters.
