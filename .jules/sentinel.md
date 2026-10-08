## 2024-10-08 - Prevent API Key Exposure in Process List
**Vulnerability:** Passing API keys to Docker via `-e "$var=${!var}"` exposes the raw secret on the command line.
**Learning:** Any value passed on the command line in a shell script becomes visible in the host system's process table (e.g., via `ps aux`), allowing other users to steal credentials.
**Prevention:** Use `-e "$var"` to implicitly inherit the environment variable without exposing its value in the command line arguments.
