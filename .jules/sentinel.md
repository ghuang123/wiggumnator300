## 2024-04-14 - [Command Injection via String Interpolation in Bash -c]
**Vulnerability:** Shell arguments were unsafely interpolated into a `bash -c` execute string using `$*` (`bash -c "./loop.sh $*"`), allowing potential command injection.
**Learning:** String interpolation of user input directly into execute strings bypasses shell argument parsing and exposes scripts to injection attacks.
**Prevention:** Always pass shell arguments securely to `bash -c` by keeping them out of the string and using `"$@"` (e.g., `bash -c 'cmd "$@"' -- "$@"`).
