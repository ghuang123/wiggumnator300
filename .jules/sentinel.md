## 2024-08-14 - Fix command injection in bash -c
**Vulnerability:** Command injection in bash -c due to unsafe string interpolation with $*
**Learning:** When passing script arguments to bash -c, using "$*" inside double quotes expands them as a string, allowing shell command injection if arguments contain shell characters (like ; or &&).
**Prevention:** Always pass arguments securely to bash -c using single quotes for the script string and passing "$@" as positional arguments: bash -c './script "$@"' -- "$@"
