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

(unless (package-installed-p 'corfu)
  (package-refresh-contents)
  (package-install 'corfu))
(require 'corfu)
(global-corfu-mode)
(setq corfu-auto t
      corfu-quit-no-match 'separator)

(unless (package-installed-p 'projectile)
  (package-refresh-contents)
  (package-install 'projectile))
(require 'projectile)

(unless (package-installed-p 'ivy)
  (package-refresh-contents)
  (package-install 'ivy))
(require 'ivy)

(unless (package-installed-p 'counsel)
  (package-refresh-contents)
  (package-install 'counsel))
(require 'counsel)

(unless (package-installed-p 'evil)
  (package-install 'evil))
(require 'evil)
(evil-mode 1)

;; Prevent Evil pasting from overwriting the clipboard
(setq-default evil-kill-on-visual-paste nil)

;; Keybinds
(evil-set-leader 'normal (kbd "SPC"))

;; Standard
(evil-define-key 'normal 'global (kbd "<leader>fj") 'dired-jump)
(evil-define-key 'normal 'global (kbd "<leader>ff") 'find-file)
(evil-define-key 'normal 'global (kbd "<leader>cc") 'compile)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Counsel
(evil-define-key 'normal 'global (kbd "<leader>if") 'counsel-find-file)
(evil-define-key 'normal 'global (kbd "<leader>ik") 'counsel-describe-function)
(evil-define-key 'normal 'global (kbd "<leader>iv") 'counsel-describe-variable)
(evil-define-key 'normal 'global (kbd "<leader>is") 'counsel-describe-symbol)

;; Projectile
;;(evil-define-key 'normal 'global (kbd "<leader>pf") 'projectile-)
  
;; Corfu 
(evil-define-key 'normal 'global (kbd "<leader>cd") 'corfu-mode)
(define-key corfu-map (kbd "RET") nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company counsel evil ido-completing-read+ ivy projectile smex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
