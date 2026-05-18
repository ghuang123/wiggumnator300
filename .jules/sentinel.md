
## 2026-05-18 - Prevent Command Injection via Subshell Interpolation
**Vulnerability:** Command injection risk found when passing unescaped shell arguments directly into a subshell evaluation string.
**Learning:** Using raw string interpolation for arguments passed to a subshell executes those arguments as commands if they contain shell metacharacters.
**Prevention:** Always pass shell arguments securely to subshells using the explicit array syntax with the double dash separator instead of raw string interpolation.
