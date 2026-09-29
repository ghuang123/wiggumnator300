## 2024-10-24 - Securely passing environment variables to Docker
**Vulnerability:** API keys were exposed in command line arguments via docker run -e.
**Learning:** Shell scripts building dynamic Docker commands often mistakenly interpolate secret values into the command string itself, exposing them on the host.
**Prevention:** Use `-e "$var"` without assigning a value to inherit securely from the host environment without exposing it in the process table.
