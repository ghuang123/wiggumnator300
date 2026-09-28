## 2024-10-24 - Prevent API Key Leakage in Process List
**Vulnerability:** The sandbox script passed sensitive API keys to Docker using `docker run -e "VAR=${!VAR}"`, which exposes the plaintext keys in the host's process list (visible via `ps aux`).
**Learning:** Expanding environment variables directly into Docker run commands makes them visible to anyone with access to view processes on the host.
**Prevention:** Always use `docker run -e VAR` to inherit environment variables directly from the host environment without passing their values as command-line arguments.
