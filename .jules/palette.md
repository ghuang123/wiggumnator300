## 2024-06-07 - Add visual emojis to shell script errors

**Learning:** Shell script errors can easily blend into the terminal text, leading users to miss them or misunderstand the problem. Adding visual cues, such as emojis (e.g. ❌ for errors, 💡 for hints), significantly improves the scannability of terminal output, reducing cognitive load when dealing with environment or setup issues. Splitting long error messages into multiple lines also helps with readability.
**Action:** Always consider the visual impact of CLI output. When outputting errors or warnings from a script, prepend them with visually distinct emojis and explicitly format actionable resolution steps separately to enhance scannability and user experience.
