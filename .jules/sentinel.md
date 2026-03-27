## 2025-03-27 - Command Injection via $* in bash -c
**Vulnerability:** Command injection vulnerability in sandbox launcher (`scripts/sandbox.sh`) due to string interpolation of arguments using `$*` inside a `bash -c` command string (`bash -c "./loop.sh $*"`).
**Learning:** Shell arguments passed to `bash -c` must be passed securely as positional arguments instead of interpolating them directly into the script string. This is a common pattern in wrapper scripts that pass arguments down to inner scripts or containers.
**Prevention:** Use `bash -c 'cmd "$@"' -- "$@"` instead of `bash -c "cmd $*"` to prevent command injection vulnerabilities in the repository's bash scripts.
