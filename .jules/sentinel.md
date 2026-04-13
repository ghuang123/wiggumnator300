
## 2024-04-13 - [Command Injection in bash -c]
**Vulnerability:** [Command injection risk due to string interpolation ($*) in `bash -c "./loop.sh $*"` within sandbox.sh]
**Learning:** [Using `$*` inside `bash -c "..."` concatenates all arguments into a single string which is then evaluated. This allows command injection if arguments contain shell metacharacters.]
**Prevention:** [Pass arguments safely to `bash -c` by referencing them via `"$@"` internally and supplying them externally as positional arguments separated by `--`, like `bash -c 'cmd "$@"' -- "$@"`.]
