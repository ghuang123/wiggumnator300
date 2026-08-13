## 2024-08-13 - Command Injection in Docker Arguments
**Vulnerability:** Command injection in sandbox.sh via bash -c "./loop.sh \$*".
**Learning:** Shell expansion inside a string passed to bash -c allows arbitrary commands from arguments to be evaluated by the inner shell.
**Prevention:** Pass arguments as discrete array elements directly to the interpreter (e.g., bash ./script.sh "\$@") rather than interpolating them into a shell command string.
