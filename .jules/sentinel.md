
## 2024-10-27 - Prevent API Key Exposure in Process List
**Vulnerability:** Passing API keys directly in the command line (`-e "$var=${!var}"`) to `docker run` exposed them to anyone on the host system via `ps aux`.
**Learning:** Shell expansion of secrets into command arguments is a common source of accidental secrets exposure because process lists are often visible to all users.
**Prevention:** Always use Docker's environment variable inheritance (`-e "$var"`) without assigning the value on the command line when dynamically passing sensitive environment variables.
