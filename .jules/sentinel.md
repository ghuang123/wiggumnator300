## 2025-03-31 - [Command Injection via String Interpolation in Bash Scripts]
**Vulnerability:** Command injection vulnerability identified in `scripts/sandbox.sh` due to passing arguments to a subshell using `$*` string interpolation: `bash -c "./loop.sh $*"`.
**Learning:** Shell arguments must be passed securely to prevent command injection, especially when using `bash -c`. Relying on string interpolation like `$*` allows an attacker to inject arbitrary commands if the arguments contain shell metacharacters.
**Prevention:** Always pass arguments explicitly using `"$@"` after a `--` separator instead of embedding them directly in the command string. E.g. use `bash -c 'cmd "$@"' -- "$@"` instead of `bash -c "cmd $*"`.
