## 2024-08-12 - Fix command injection in sandbox launcher
**Vulnerability:** Command injection in scripts/sandbox.sh when passing arguments to docker via bash -c "./loop.sh $*".
**Learning:** Using $* inside an evaluated string without quotes allows attackers to execute arbitrary shell commands.
**Prevention:** Pass arguments securely as separate array elements instead of using string evaluation.
