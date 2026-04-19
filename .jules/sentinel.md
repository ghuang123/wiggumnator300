## 2024-04-05 - Insecure shell string interpolation vulnerability
**Vulnerability:** Command injection risk found in scripts/sandbox.sh where arguments were passed via string interpolation (`bash -c "./loop.sh $*"`).
**Learning:** Using `$*` within a `bash -c` string allows arbitrary command execution if the arguments contain shell metacharacters.
**Prevention:** Always pass shell arguments securely to `bash -c` using the exact format `bash -c 'cmd "$@"' -- "$@"` instead of interpolating strings directly.
