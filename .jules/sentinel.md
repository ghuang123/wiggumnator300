## 2026-06-29 - Prevent Secret Exposure in Process Listings
**Vulnerability:** Passing sensitive environment variables (like ANTHROPIC_API_KEY) to Docker containers using explicit string interpolation (-e "VAR_NAME=$VAR_NAME") exposes the secret's actual value in the host machine's process listing (ps), where it can be read by other users or processes.
**Learning:** The explicit interpolation was used to construct the -e argument, likely unaware that Docker natively supports fetching the variable's value from the host environment if only the variable name is provided.
**Prevention:** Always use Docker's native passthrough syntax (-e "VAR_NAME") for passing environment variables to prevent their values from appearing in the command-line arguments visible to process monitoring tools.
