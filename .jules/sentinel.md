## 2026-04-28 - Secure argument passing and secret handling in bash
**Vulnerability:** API keys were passed to Docker using command-line interpolation, exposing them to process listings. Shell arguments were passed using insecure string interpolation.
**Learning:** Command-line interpolation of secrets exposes them to ps output. Unquoted shell array expansions allow command injection.
**Prevention:** Pass environment variables natively and pass shell arguments securely using bash argument arrays.
