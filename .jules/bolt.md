## 2024-05-24 - [Avoid full directory context upload for Docker builds]
**Learning:** Sending the full directory context during a `docker build` can be a huge performance bottleneck. If a script creates a Dockerfile dynamically and uses `COPY` or `ADD` from the host context, Docker needs that full context upload. However, if the Dockerfile doesn't copy local files, it's better to bypass this context upload completely by piping the Dockerfile to `docker build` via stdin (using `docker build - < Dockerfile`).
**Action:** Always check if a Dockerfile uses host context via `COPY` or `ADD`. If it doesn't, pipe the Dockerfile directly to stdin to save a significant amount of build time, especially in large directories.

## 2024-10-18 - [Avoid useless cat pipes in loops]
**Learning:** Using a `cat file | cmd` pipe inside a loop spawns unnecessary subshells and processes for `cat` in every iteration, causing measurable overhead.
**Action:** Always use input redirection (`cmd < file`) instead of piping `cat` output, especially inside loops, to optimize shell script execution.
## 2024-10-25 - [Fast credential file checks instead of CLI invocations]
**Learning:** Using a CLI command (like `claude -p`) just to verify authentication status before starting a loop incurs a measurable startup penalty (~2s) every time the script runs. The authentication state can be instantly verified by checking for the existence of the credentials file.
**Action:** Always prefer direct filesystem checks for configuration or credentials over invoking a slow CLI tool just for pre-flight validation.
