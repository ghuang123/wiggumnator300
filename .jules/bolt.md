## 2024-05-24 - [Avoid useless cat pipes in shell loops]
**Learning:** Using 'cat file | cmd' inside a shell script loop spawns an unnecessary subshell and process on every iteration, which degrades performance.
**Action:** Always use input redirection ('cmd < file') instead of a useless cat pipe, especially inside tight loops.

## 2024-05-24 - [Avoid full directory context upload for Docker builds]
**Learning:** Sending the full directory context during a `docker build` can be a huge performance bottleneck. If a script creates a Dockerfile dynamically and uses `COPY` or `ADD` from the host context, Docker needs that full context upload. However, if the Dockerfile doesn't copy local files, it's better to bypass this context upload completely by piping the Dockerfile to `docker build` via stdin (using `docker build - < Dockerfile`).
**Action:** Always check if a Dockerfile uses host context via `COPY` or `ADD`. If it doesn't, pipe the Dockerfile directly to stdin to save a significant amount of build time, especially in large directories.