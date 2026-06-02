## 2026-06-02 - Prevent Command Injection in bash -c
**Vulnerability:** Unsanitized command-line arguments were interpolated directly into a bash -c command string using $*, allowing arbitrary command execution.
**Learning:** Passing arguments by expanding them directly into the command string via $* breaks out of the command context if the input contains shell metacharacters.
**Prevention:** Always pass shell arguments securely to subshells using out-of-band positional arguments. When using bash -c, explicitly include a dummy $0 argument (e.g., bash -c 'cmd "$@"' dummy "$@").
