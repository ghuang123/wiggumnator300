## 2024-05-24 - Fix Command Injection and API Key Exposure in Docker Sandbox
**Vulnerability:** API keys were passed to Docker using `-e "$var=${!var}"`, exposing them in host `ps` listings. Shell arguments were unsafely interpolated into `bash -c "./loop.sh $*"`, allowing command injection.
**Learning:** Shell arguments passed to `bash -c` should always use secure positional parameters (`"$@"`) with a dummy `$0`. Docker supports secure env passthrough via `-e VAR` without explicit assignment.
**Prevention:** Always use Docker's native passthrough for sensitive variables and out-of-band argument passing to subshells.
