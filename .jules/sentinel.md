## 2024-05-15 - Unsafe Shell Variable Interpolation
**Vulnerability:** Command injection risk via string interpolation (`$*`) in `bash -c` executions inside sandbox launcher.
**Learning:** Using `$*` inside double quotes for `bash -c` evaluates arguments in the parent shell before passing them, allowing malicious arguments to be executed as separate commands.
**Prevention:** Always use `"$@"` to pass arguments safely and bind them via `-- "$@"` when using `bash -c 'cmd "$@"'`.
