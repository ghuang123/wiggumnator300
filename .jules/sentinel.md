## 2024-05-24 - Initial Setup
**Vulnerability:** None
**Learning:** Initialize sentinel tracking file.
**Prevention:** N/A
## 2026-07-19 - Fix command injection and secret exposure in sandbox script
**Vulnerability:** API keys were exposed to host process listings via explicit interpolation, and command injection was possible via $* in bash -c.
**Learning:** Using -e "VAR=$VAR" exposes secrets to `ps`. Interpolating $* inside bash -c allows command injection.
**Prevention:** Use native passthrough -e "VAR" for Docker, and pass arguments out-of-band via bash -c '...' dummy "$@".
