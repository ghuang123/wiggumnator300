## 2024-05-24 - [Avoid full directory context upload for Docker builds]
**Learning:** Sending the full directory context during a `docker build` can be a huge performance bottleneck. If a script creates a Dockerfile dynamically and uses `COPY` or `ADD` from the host context, Docker needs that full context upload. However, if the Dockerfile doesn't copy local files, it's better to bypass this context upload completely by piping the Dockerfile to `docker build` via stdin (using `docker build - < Dockerfile`).
**Action:** Always check if a Dockerfile uses host context via `COPY` or `ADD`. If it doesn't, pipe the Dockerfile directly to stdin to save a significant amount of build time, especially in large directories.

## 2024-10-18 - [Avoid useless cat pipes in loops]
**Learning:** Using a `cat file | cmd` pipe inside a loop spawns unnecessary subshells and processes for `cat` in every iteration, causing measurable overhead.
**Action:** Always use input redirection (`cmd < file`) instead of piping `cat` output, especially inside loops, to optimize shell script execution.
## 2024-10-25 - [Use --init in long-running Docker containers]
**Learning:** Running long-running scripts or loops inside Docker containers without an init process can lead to zombie processes accumulating and causing process table exhaustion, which negatively impacts performance and resource utilization.
**Action:** Always include the `--init` flag when configuring `docker run` for long-running scripts or loops to ensure an init process (like tini) properly reaps zombie processes.
