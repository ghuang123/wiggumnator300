## 2024-05-24 - [Avoid full directory context upload for Docker builds]
**Learning:** Sending the full directory context during a `docker build` can be a huge performance bottleneck. If a script creates a Dockerfile dynamically and uses `COPY` or `ADD` from the host context, Docker needs that full context upload. However, if the Dockerfile doesn't copy local files, it's better to bypass this context upload completely by piping the Dockerfile to `docker build` via stdin (using `docker build - < Dockerfile`).
**Action:** Always check if a Dockerfile uses host context via `COPY` or `ADD`. If it doesn't, pipe the Dockerfile directly to stdin to save a significant amount of build time, especially in large directories.

## 2025-01-09 - [Avoid unnecessary subshells in shell loops with `cat` pipes]
**Learning:** Using `cat file | command` within loops (like a `while` loop) continuously spawns extra subshells and process instances of `cat`. This constitutes a measurable performance penalty in shell scripts.
**Action:** Always use input redirection (`command < file`) instead of piping `cat` output whenever reading files in shell loops to save process allocation and overhead.