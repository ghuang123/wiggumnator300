## 2024-05-24 - [Avoid full directory context upload for Docker builds]
**Learning:** Sending the full directory context during a `docker build` can be a huge performance bottleneck. If a script creates a Dockerfile dynamically and uses `COPY` or `ADD` from the host context, Docker needs that full context upload. However, if the Dockerfile doesn't copy local files, it's better to bypass this context upload completely by piping the Dockerfile to `docker build` via stdin (using `docker build - < Dockerfile`).
**Action:** Always check if a Dockerfile uses host context via `COPY` or `ADD`. If it doesn't, pipe the Dockerfile directly to stdin to save a significant amount of build time, especially in large directories.

## 2024-10-18 - [Avoid useless cat pipes in loops]
**Learning:** Using a `cat file | cmd` pipe inside a loop spawns unnecessary subshells and processes for `cat` in every iteration, causing measurable overhead.
**Action:** Always use input redirection (`cmd < file`) instead of piping `cat` output, especially inside loops, to optimize shell script execution.
## 2026-06-15 - [Optimizing CLI authentication checks in shell scripts]
**Learning:** Shelling out to Node.js CLI tools (like `claude`) for authentication checks in shell scripts introduces a significant performance penalty (~300-500ms overhead) due to Node.js process startup time. Completely replacing the CLI check with a simple file check trades correctness for speed.
**Action:** Use a hybrid approach: perform a fast optimistic file/environment check first, but fallback to the robust CLI check if the fast path fails. This avoids the Node.js startup penalty when the user is already authenticated without losing the robustness of the CLI check when necessary.
