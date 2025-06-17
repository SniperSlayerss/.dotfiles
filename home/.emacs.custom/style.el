(add-to-list 'custom-theme-load-path "~/.emacs.custom/themes")
(load-theme 'rose-pine t)

(add-to-list 'default-frame-alist
             '(font . "IosevkaNerdFontMono-18"))

;; Emacs standard config changes
(setq vc-follow-symlinks t)
(set-default 'truncate-lines t)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode 1)
(show-paren-mode 1)
(setq make-backup-files nil)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

(set-frame-parameter nil 'alpha-background 95)
(add-to-list 'default-frame-alist '(alpha-background . 95))
