
## 2026-05-15 - Prevent Secret Exposure via Command Line
**Vulnerability:** API keys were passed to Docker using command-line interpolation, exposing them in process listings (ps).
**Learning:** Command-line interpolation of secrets makes them visible to anyone on the system viewing the process list.
**Prevention:** Always use native passthrough (e.g., -e "VAR_NAME") to safely pass environment variables to Docker without exposing their values in process arguments.
