;; Add MELPA repository
(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Initialize package system
(package-initialize)

;; Ensure the package list is updated
(unless package-archive-contents
  (package-refresh-contents))

(add-to-list 'custom-theme-load-path "~/.emacs.custom/themes")
(load-theme 'rose-pine t)

(add-to-list 'default-frame-alist
             '(font . "FiraCode Nerd Font-20"))

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

(unless (package-installed-p 'smex)
  (package-refresh-contents)
  (package-install 'smex))
(require 'smex)

(unless (package-installed-p 'ido-completing-read+)
  (package-refresh-contents)
  (package-install 'ido-completing-read+))
(require 'ido-completing-read+)

(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


(unless (package-installed-p 'which-key)
  (package-refresh-contents)
  (package-install 'which-key))
(require 'which-key)
(which-key-mode)

(unless (package-installed-p 'evil)
  (package-install 'evil))
(require 'evil)

(evil-mode 1)

(evil-set-leader 'normal (kbd "SPC"))
(evil-define-key 'normal 'global (kbd "<leader>fj") 'dired-jump)
(evil-define-key 'normal 'global (kbd "<leader>ff") 'find-file)

;;(unless (package-installed-p 'spaceline)
;;  (package-refresh-contents)
;;  (package-install 'spaceline))
;;(require 'spaceline-config)

;;(setq evil-normal-state-tag "NORMAL")
;;(setq evil-insert-state-tag "INSERT")
;;(setq evil-visual-state-tag "VISUAL")

;;(setq-default mode-line-format nil)
;;(use-package spaceline
;;             :ensure t
;;             :config
;;(setq powerline-default-seperator "")
;;(setq powerline-height 20)
;;(spaceline-compile
  ;; Left side: Display buffer name, major mode, and modified state
;;  '(buffer-id
;;     major-mode
;;     buffer-modified)

  ;; Right side: Display line-column and encoding
;;  '((line-column :separator " | " :priority 3)
;;    (coding :separator " | " :priority 2)
;;    ))

;;(setq-default mode-line-format '("%e" (:eval (spaceline-ml-main)))))
