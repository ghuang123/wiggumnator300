## 2024-08-11 - Command Injection in Docker Exec
**Vulnerability:** Command injection risk in scripts/sandbox.sh via bash -c "./loop.sh $*".
**Learning:** Using $* inside a bash -c string evaluation allows shell metacharacters in arguments to be executed as arbitrary commands.
**Prevention:** Always use -- "$@" to pass arguments securely to bash -c instead of interpolating them directly into the script string.
