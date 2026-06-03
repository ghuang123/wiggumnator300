## 2024-05-24 - [Avoid full directory context upload for Docker builds]
**Learning:** Sending the full directory context during a `docker build` can be a huge performance bottleneck. If a script creates a Dockerfile dynamically and uses `COPY` or `ADD` from the host context, Docker needs that full context upload. However, if the Dockerfile doesn't copy local files, it's better to bypass this context upload completely by piping the Dockerfile to `docker build` via stdin (using `docker build - < Dockerfile`).
**Action:** Always check if a Dockerfile uses host context via `COPY` or `ADD`. If it doesn't, pipe the Dockerfile directly to stdin to save a significant amount of build time, especially in large directories.

## 2024-10-18 - [Avoid useless cat pipes in loops]
**Learning:** Using a `cat file | cmd` pipe inside a loop spawns unnecessary subshells and processes for `cat` in every iteration, causing measurable overhead.
**Action:** Always use input redirection (`cmd < file`) instead of piping `cat` output, especially inside loops, to optimize shell script execution.
## 2026-06-03 - [Direct file check for CLI auth]
**Learning:** For shell scripts or CLI wrappers, avoid shelling out to a slow Node.js process merely to check authentication status. It introduces significant startup latency.
**Action:** Perform a direct file check for credentials or test for environment variables to eliminate startup latency.

## 2026-06-03 - [Hybrid fast-path authentication check]
**Learning:** Completely replacing a CLI shell-out auth check with a direct file check trades correctness for speed, as it cannot validate the token and may miss alternative config paths.
**Action:** Use a hybrid approach: perform a fast optimistic file/environment check first to skip the slow shell-out in the happy path, but fallback to the robust CLI check if the fast path fails to prevent false negatives.
