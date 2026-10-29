# Palette's Journal

## 2024-10-29 - Consistent Emoji Visual Hierarchy in CLI Output
**Learning:** The wiggumnator300 CLI uses a specific emoji convention for output messages to maintain a clear visual hierarchy ('❌' for errors, '⚠️' for warnings, '💡' for actionable steps, and '✅' for success messages), but some existing echo statements (e.g., `echo "ERROR:"`) do not follow this standard. This lack of visual cues makes error states harder to parse at a glance and creates an inconsistent user experience across the tool.
**Action:** Enhance terminal UX by standardizing error messages. Replace plain text `"ERROR:"` prefixes with the designated '❌' emoji to visually anchor failure states according to the repository's documented visual hierarchy convention.
