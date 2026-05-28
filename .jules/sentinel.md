## 2026-05-28 - [Command Injection via String Interpolation & Subshell Arguments]
**Vulnerability:** Shell arguments were unsafely interpolated into a subshell command string.
**Learning:** Using $* inside a `bash -c` string allows arbitrary command execution. Also, when using `bash -c 'cmd "$@"' -- arg1 arg2`, the first argument (arg1) is assigned to $0 and dropped from $@. A dummy $0 argument is required.
**Prevention:** Always pass arguments to subshells out-of-band using `bash -c 'cmd "$@"' -- dummy "$@"` rather than string concatenation.
