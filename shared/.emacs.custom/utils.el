(defun alt/backward-kill-word ()
  "Remove all whitespace if the character behind the cursor is whitespace, otherwise remove a word."
  (interactive)
  (if (looking-back "[ \n]")
      ;; delete horizontal space before us and then check to see if we
      ;; are looking at a newline
      (progn (delete-horizontal-space 't)
             (while (looking-back "[ \n]")
               (backward-delete-char 1)))
    ;; otherwise, just do the normal kill word.
    (backward-kill-word 1)))

(defun auto-indent-on-save ()
  "Auto-indent the entire buffer before saving."
  (interactive)
  (when (derived-mode-p 'prog-mode)
    (indent-region (point-min) (point-max))))

