
## 2026-10-29 - Docker Process List Secret Exposure
**Vulnerability:** API keys exposed in process list via docker run -e
**Learning:** Passing explicit values to docker -e exposes them to the host's process list via ps aux.
**Prevention:** Use -e "var" to inherit environment variables directly from the host environment without exposing values on the command line.
