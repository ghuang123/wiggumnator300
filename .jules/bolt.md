## 2024-05-24 - [Avoid full directory context upload for Docker builds]
**Learning:** Sending the full directory context during a `docker build` can be a huge performance bottleneck. If a script creates a Dockerfile dynamically and uses `COPY` or `ADD` from the host context, Docker needs that full context upload. However, if the Dockerfile doesn't copy local files, it's better to bypass this context upload completely by piping the Dockerfile to `docker build` via stdin (using `docker build - < Dockerfile`).
**Action:** Always check if a Dockerfile uses host context via `COPY` or `ADD`. If it doesn't, pipe the Dockerfile directly to stdin to save a significant amount of build time, especially in large directories.

## 2024-05-24 - [Avoid slow clone times by using shallow clones]
**Learning:** git clone without --depth=1 will download the entire git history, which uses more disk space and can be significantly slower. For scripts like install scripts that just want the latest code, a shallow clone is much faster.
**Action:** Always use git clone --depth=1 when you just need the latest state of the files and not the entire version history.
