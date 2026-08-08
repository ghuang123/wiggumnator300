## 2024-08-08 - Sandbox Launcher Argument Evaluation
**Vulnerability:** Command injection risk in scripts/sandbox.sh when passing arguments via bash -c with unquoted variables ($*).
**Learning:** Evaluating arguments via string interpolation inside bash -c exposes the script to command injection if malicious arguments are provided.
**Prevention:** Always pass arguments directly using "$@" instead of evaluating them through bash -c string interpolation.
