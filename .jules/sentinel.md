## 2026-06-08 - Secure Subshell Argument Passing
**Vulnerability:** Command injection vulnerability via unsafe shell argument interpolation.
**Learning:** Using string interpolation to pass arguments to a subshell allows arbitrary command execution.
**Prevention:** Always pass shell arguments securely to subshells using out-of-band positional arguments with a dummy variable.
