## 2024-05-24 - Process List API Key Exposure
**Vulnerability:** Docker run command exposes API keys in process list by passing `-e "VAR=value"`.
**Learning:** Shell evaluation in script arguments allows other local users to read secrets via `ps aux`.
**Prevention:** Use Docker's `-e "VAR"` syntax to inherit environment variables implicitly without command line evaluation.
