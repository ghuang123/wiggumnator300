
## 2024-10-28 - Process List API Key Exposure via Docker Run
**Vulnerability:** API keys passed to Docker via explicit `-e "VAR=value"` assignments are visible in the host's process list.
**Learning:** The host's process list exposes all command-line arguments to local users. Using `-e "$var=${!var}"` puts the sensitive value directly on the command line.
**Prevention:** Use `-e "$var"` to inherit the environment variable securely from the host without exposing its value on the command line.
