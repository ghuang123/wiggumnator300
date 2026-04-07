
## 2026-04-07 - [Command Injection Risk]
**Vulnerability:** [Command injection vulnerability in shell script execution where string interpolation (`$*`) was used to pass arguments to `bash -c` instead of secure argument passing.]
**Learning:** [Using `$*` inside a string passed to `bash -c` evaluates the arguments as part of the command string, which can allow an attacker to inject arbitrary commands if the arguments contain shell metacharacters.]
**Prevention:** [Always pass shell arguments securely by using `bash -c 'cmd "$@"' -- "$@"` instead of `$*` string interpolation.]
