## 2024-05-24 - [Avoid full directory context upload for Docker builds]
**Learning:** Sending the full directory context during a `docker build` can be a huge performance bottleneck. If a script creates a Dockerfile dynamically and uses `COPY` or `ADD` from the host context, Docker needs that full context upload. However, if the Dockerfile doesn't copy local files, it's better to bypass this context upload completely by piping the Dockerfile to `docker build` via stdin (using `docker build - < Dockerfile`).
**Action:** Always check if a Dockerfile uses host context via `COPY` or `ADD`. If it doesn't, pipe the Dockerfile directly to stdin to save a significant amount of build time, especially in large directories.

## 2024-10-18 - [Avoid useless cat pipes in loops]
**Learning:** Using a `cat file | cmd` pipe inside a loop spawns unnecessary subshells and processes for `cat` in every iteration, causing measurable overhead.
**Action:** Always use input redirection (`cmd < file`) instead of piping `cat` output, especially inside loops, to optimize shell script execution.
## 2026-06-12 - [Optimistic fallback checks avoid Node.js startup overhead]
**Learning:** Shelling out to Node.js CLIs (like `claude`) for simple checks (like authentication verification) inside shell scripts incurs a significant process startup overhead (often 200-500ms). While robust, this slows down the script's critical path.
**Action:** Use a hybrid approach for such checks: perform a fast, optimistic check for expected files or environment variables first. If the fast path fails, fallback to the robust, slower CLI check. This provides the best of both speed and correctness.
