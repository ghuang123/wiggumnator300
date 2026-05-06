## 2026-05-06 - Prevent Command Injection & Secret Exposure in Bash
**Vulnerability:** Shell arguments were interpolated via $* inside a bash -c string, leading to command injection risks. Additionally, API keys were passed to Docker using -e VAR=$VAR, exposing them to process listings (ps).
**Learning:** String interpolation of variables into bash subshells breaks parameter separation, allowing injected commands. Process listings expose command-line arguments to all users on the host.
**Prevention:** Always pass shell arguments securely to subshells using bash -c 'cmd "$@"' -- "$@". Pass sensitive environment variables natively (e.g., -e VAR) instead of as variable assignments to prevent exposure in process lists.
