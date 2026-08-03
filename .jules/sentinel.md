## 2026-08-03 - Improve argument handling in subshell invocation
**Vulnerability:** Shell arguments directly interpolated into a `bash -c` string (`bash -c "cmd $*"`) can lead to unexpected execution.
**Learning:** Shell expansion inside double quotes in `bash -c` evaluates variables before execution, potentially causing unintended effects.
**Prevention:** Pass shell arguments securely out-of-band using positional parameters (e.g., `bash -c 'cmd "$@"' dummy "$@"`).
