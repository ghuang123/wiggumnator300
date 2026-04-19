## 2024-05-18 - Prevent Command Injection in `bash -c`
**Vulnerability:** Command injection was possible in `sandbox.sh` due to string interpolation of arguments into `bash -c` (`bash -c "./loop.sh $*"`).
**Learning:** Shell arguments must be passed securely when using `bash -c` to prevent execution of arbitrary commands embedded in user input. String interpolation allows attackers to break out of the command string.
**Prevention:** Use `"$@"` securely passed after `--` in `bash -c` like this: `bash -c 'cmd "$@"' -- "$@"`.
