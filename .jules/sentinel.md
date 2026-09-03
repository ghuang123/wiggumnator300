## 2024-05-24 - Fix Command Injection in Sandbox Argument Passing
**Vulnerability:** Command injection when passing user arguments via `./sandbox.sh "some; malicious"`.
**Learning:** In `scripts/sandbox.sh`, passing arguments to `bash -c` inside Docker via unquoted string interpolation (`bash -c "./loop.sh $*"`) allows attackers to execute arbitrary shell commands inside the container since the variables are expanded on the host and evaluated as code by bash.
**Prevention:** When passing arbitrary arguments to `bash -c`, always use the `bash -c 'command "$@"' -- "$@"` pattern to pass arguments safely as distinct variables, ensuring they are not evaluated as shell commands.
