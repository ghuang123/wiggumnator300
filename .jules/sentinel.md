## 2026-04-16 - Prevent Command Injection in Sandbox Script
**Vulnerability:** The sandbox script `scripts/sandbox.sh` uses `bash -c "./loop.sh $*"` to pass arguments to `loop.sh`, which is susceptible to command injection if malicious arguments containing unescaped bash commands are provided.
**Learning:** Using `$*` string interpolation inside a `bash -c` command string evaluates the arguments as part of the bash command itself, bypassing standard argument parsing and exposing a command injection vector.
**Prevention:** Shell arguments should be passed securely to `bash -c` using `bash -c 'cmd "$@"' -- "$@"` to ensure arguments are treated as separate inputs to the executed command rather than parsed as bash syntax.
