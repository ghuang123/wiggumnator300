## 2026-06-07 - Command Injection in bash -c Subshells
**Vulnerability:** Shell arguments were unsafely interpolated into a subshell command string, leading to command injection risks.
**Learning:** When passing arguments to a `bash -c` command string, using string interpolation is insecure.
**Prevention:** Pass shell arguments out-of-band to subshells using positional arguments, and explicitly provide a dummy $0 argument.
