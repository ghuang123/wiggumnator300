I have discovered a critical security vulnerability in `scripts/sandbox.sh`.

**Vulnerability:**
The `sandbox.sh` script currently interpolates the unvalidated environment variable `CLAUDE_CONFIG_DIR` (and `$HOME`) directly into standard string substitutions:

```bash
CLAUDE_DIR="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
```

But the more severe issue is the variable interpolation happening during the docker container execution:
```bash
DOCKER_ARGS+=(
  wiggumnator-sandbox
  bash -c "./loop.sh $*"
)

docker "${DOCKER_ARGS[@]}"
```
Here, `$*` is directly injected into the `bash -c` command string via interpolation. `bash -c "./loop.sh $*"` will evaluate the arguments as part of the command string before passing them to the container. This is a classic **Command Injection** vulnerability. If an attacker passes malicious arguments to `sandbox.sh`, they can break out of the intended command structure and execute arbitrary shell commands within the docker container context (or potentially escape if misconfigured).

**Impact:**
Command injection allows arbitrary execution of commands within the docker container running as the `wiggum` user. Since `docker run` also mounts the host project directory and potentially credentials (`$PROJECT_DIR`, `$CRED_FILE`, `$SETTINGS_FILE`), this allows a malicious user or automated system calling `sandbox.sh` with untrusted arguments to compromise the mounted files and steal Claude API keys.

**Fix:**
We need to avoid string interpolation of `$*` in `bash -c`. Instead, we should pass arguments as standard arguments to `bash -c`.

```bash
<<<<<<< SEARCH
DOCKER_ARGS+=(
  wiggumnator-sandbox
  bash -c "./loop.sh $*"
)
=======
DOCKER_ARGS+=(
  wiggumnator-sandbox
  bash -c './loop.sh "$@"' -- "$@"
)
>>>>>>> REPLACE
```
This correctly passes the arguments `$@` to the `bash -c` process as positional parameters instead of interpolating them directly into the script string.

I will also update the journal `sentinel.md`.

Plan:
1. Fix the Command Injection in `scripts/sandbox.sh`.
2. Add an entry to `.jules/sentinel.md` noting the command injection vulnerability via `bash -c` and `$*`.
3. Verify the scripts using `bash -n` and `shellcheck`.
4. Complete pre-commit steps.
5. Submit PR.
