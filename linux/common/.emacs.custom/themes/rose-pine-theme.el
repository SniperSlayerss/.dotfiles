(unless (>= emacs-major-version 24)
  (error "rose-pine requires Emacs 24 or later."))

(deftheme rose-pine
  "Rose Pine By: Jack Baker - github.com/sniperslayerss")

(let (( base     "#191724")
      ( surface  "#1f1d2e")
      ( overlay  "#26233a")
      ( muted    "#6e6a86")
      ( subtle   "#908caa")
      ( text     "#e0def4")
      ( love     "#eb6f92")
      ( gold     "#f6c177")
      ( rose     "#ebbcba")
      ( pine     "#31748f")
      ( foam     "#9ccfd8")
      ( iris     "#c4a7e7")
      ( highlight_low  "#21202e")
      ( highlight_med  "#403d52")
      ( highlight_high "#524f67"))

  (custom-theme-set-variables
   'rose-pine
   '(fringe-mode 6 nil (fringe))
   '(linum-format 'dynamic))

  (custom-theme-set-faces
   'rose-pine

   ;; font-lock
   `(font-lock-builtin-face ((t (:foreground ,pine))))
   `(font-lock-comment-face ((t (:foreground ,subtle))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,subtle))))
   `(font-lock-constant-face ((t (:foreground ,pine))))
   `(font-lock-doc-face ((t (:foreground ,gold))))
   `(font-lock-function-name-face ((t (:foreground ,rose))))
   `(font-lock-keyword-face ((t (:foreground ,pine))))
   `(font-lock-preprocessor-face ((t (:foreground ,pine))))
   `(font-lock-string-face ((t (:foreground ,gold))))
   `(font-lock-type-face ((t (:foreground ,foam))))
   `(font-lock-variable-name-face ((t (:foreground ,text))))
   `(font-lock-warning-face ((t (:foreground ,gold))))
   `(font-lock-negation-char-face ((t (:foreground ,subtle))))



   ;; general
   `(cursor ((t (:foreground ,base :background ,subtle))))
   `(default ((t (:foreground ,text :background ,base))))
   `(fringe ((t (:foreground ,text :background ,base))))
   `(minibuffer-prompt ((t (:foreground ,text ))))
   `(region ((t (:background ,overlay))))
   `(link ((t (:foreground ,gold :underline t))))
   `(link-visited ((t (:foreground ,gold :underline t))))
   `(show-paren-match ((t (:foreground ,pine :italic t :underline t))))
   `(show-paren-mismatch ((t (:foreground ,iris :underline t))))


   ;; highlight-numbers
   `(highlight-numbers-number ((t (:foreground ,gold))))

   ;; highlight current line
   `(hl-line ((t (:background ,overlay :foreground nil))))

    ;; line-numbers
   `(line-number ((t (:inherit default :foreground ,subtle :background ,base))))
   `(line-number-current-line ((t (:inherit line-number :foreground ,text :background ,base))))

   ;; mode-line
   `(mode-line ((t (:foreground ,text :background ,base :box (:line-width (1 . 1) :color ,subtle)))))
   `(mode-line-active ((t (:foreground ,text :background ,base :box (:line-width (1 . 1) :color ,subtle)))))
   `(mode-line-inactive ((t (:foreground ,text :background ,base :box (:line-width (1 . 1) :color ,subtle)))))
   `(mode-line-buffer-id ((t (:background ,base :foreground ,text ))))
   `(mode-line-emphasis ((t (:background  ,base :foreground ,text))))
   `(mode-line-highlight ((t (:background ,base :foreground ,text :box nil))))

   ))

;; Add to custom-theme-load-path
;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))


(provide-theme 'rose-pine)
