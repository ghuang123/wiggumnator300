## 2026-08-07 - Improper Argument Handling in Sandbox Launcher
**Vulnerability:** The `scripts/sandbox.sh` script used `bash -c "./loop.sh $*"` to pass arguments to the container, which evaluates the arguments as a single string, leading to unintended argument parsing.
**Learning:** Using `$*` inside a `bash -c` string concatenates all arguments into a single string that the subshell then parses. If an argument contains special characters, it will parse them improperly inside the container.
**Prevention:** Always pass arguments to `bash -c` as positional parameters by using `bash -c './loop.sh "$@"' _ "$@"`, which treats them as arguments rather than evaluating them as part of the string.
