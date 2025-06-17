(load-file "~/.emacs.custom/require.el")
(load-file "~/.emacs.custom/style.el")
(load-file "~/.emacs.custom/utils.el")

;;1, package config
;; treesitter
(use-package tree-sitter
  :config
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

;; LSP mode
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook ((c-mode c++-mode python-mode rust-mode) . lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l"
        lsp-enable-snippet nil
	lsp-semantic-tokens-enable nil
        lsp-prefer-flymake nil))

(setq lsp-headerline-breadcrumb-enable nil)
(setq lsp-modeline-code-actions-enable nil)
(add-hook 'lsp-managed-mode-hook (lambda () (flymake-mode -1)))

;; yasnippet
(use-package yasnippet
  :config (yas-global-mode 1))

;; Vertico
(use-package vertico
  :init (vertico-mode)
  :config
  ;; Swap the directory navigation keys
  (define-key vertico-map (kbd "RET")
	      (lambda ()
		(interactive)
		(if (and (>= vertico--index 0)
			 (< vertico--index (length vertico--candidates))
			 (file-directory-p (vertico--candidate)))
		    (vertico-insert) ; Enter navigates into directory
		  (vertico-exit))))  ; Enter selects file

  (define-key vertico-map (kbd "TAB")
	      (lambda ()
		(interactive)
		(if (and (>= vertico--index 0)
			 (< vertico--index (length vertico--candidates))
			 (file-directory-p (vertico--candidate)))
		    (progn
		      (vertico-exit)
		      (dired (vertico--candidate))) ; Tab opens directory in Dired
		  (vertico-insert)))))              ; Tab completes non-directories

;; Orderless
(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

;; Marginalia
(use-package marginalia
  :after vertico
  :init (marginalia-mode))

;; projectile
(use-package projectile
  :init
  (setq projectile-project-search-path '("~/personal/")
        projectile-globally-ignored-directories '(".venv")
        projectile-globally-ignored-files '(".venv"))
  :config
  (projectile-mode +1)
  (projectile-discover-projects-in-search-path))

;; Consult
(use-package consult
  :ensure t)

(use-package consult-projectile
  :ensure t
  :after (consult projectile)
  :config
  (setq consult-projectile-display-info t))

;; evil
(use-package evil
  :init
  (setq evil-want-C-u-scroll t
        evil-kill-on-visual-paste nil)
  :config (evil-mode 1))

;; which-key
(use-package which-key
  :config (which-key-mode))

;; company
(use-package company
  :after lsp-mode
  :hook (lsp-mode . company-mode))

;; other
(use-package delight)
(use-package magit)
(use-package harpoon)
(use-package drag-stuff)

;;2, general config
;;(add-hook 'before-save-hook 'auto-indent-on-save)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq gc-cons-threshold (* 50 1000 1000))

(delight '((lsp-mode nil "lsp-mode")
           (lsp-ui-mode nil "lsp-ui")
           (company-mode nil "company")
           (yas-minor-mode nil "yasnippet")
           (abbrev-mode nil "abbrev")
           (eldoc-mode nil "eldoc")
           (tree-sitter-mode nil "tree-sitter")
           (projectile-mode nil "projectile")
	   (abbrev-mode nil "abbrev")
           (which-key-mode nil "which-key")
           (eglot-mode nil "eglot")))

;; keybinds
(evil-set-leader 'normal (kbd "SPC"))

;; standard
(evil-define-key 'normal 'global (kbd "<leader>fj") 'dired-jump)
(evil-define-key 'normal 'global (kbd "<leader>ff") 'find-file)
(evil-define-key 'normal 'global (kbd "<leader>fa") 'auto-indent-on-save)
(evil-define-key 'normal 'global (kbd "<leader>cc") 'compile)
(evil-define-key 'normal 'global (kbd "<leader>bn") 'next-buffer)
(evil-define-key 'normal 'global (kbd "<leader>bp") 'previous-buffer)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "C-<backspace>") 'alt/backward-kill-word)

;; drag-stuff
(evil-define-key 'visual 'global (kbd "J") 'drag-stuff-down)
(evil-define-key 'visual 'global (kbd "K") 'drag-stuff-up)

;; smex
(global-set-key (kbd "s-x") 'execute-extended-command)

;; consult
(evil-define-key 'normal 'global (kbd "<leader>cl") 'consult-line)
(evil-define-key 'normal 'global (kbd "<leader>cy") 'consult-yank-pop)
(evil-define-key 'normal 'global (kbd "<leader>fb") 'consult-buffer)

;; consult + projectile
(evil-define-key 'normal 'global (kbd "<leader>pf") 'consult-projectile-find-file)
(evil-define-key 'normal 'global (kbd "<leader>pg") 'consult-projectile-ripgrep)
(evil-define-key 'normal 'global (kbd "<leader>pb") 'consult-projectile-switch-to-buffer)
(evil-define-key 'normal 'global (kbd "<leader>pd") 'projectile-dired)
(evil-define-key 'normal 'global (kbd "<leader>pw") 'consult-projectile-switch-project)

;; lsp
(evil-define-key 'normal 'global (kbd "<leader>ld") 'lsp-find-definition)
(evil-define-key 'normal 'global (kbd "<leader>lr") 'lsp-find-references)
(evil-define-key 'normal 'global (kbd "<leader>lh") 'lsp-describe-thing-at-point)
(evil-define-key 'normal 'global (kbd "<leader>ls") 'consult-lsp-symbols)
(evil-define-key 'normal 'global (kbd "<leader>le") 'consult-lsp-diagnostics)
(evil-define-key 'normal 'global (kbd "C-c l") 'lsp-disconnect)

(evil-define-key 'normal 'global (kbd "<leader>fd") 'lsp-format-buffer)
(evil-define-key 'normal 'global (kbd "K") 'lsp-ui-doc-glance)

;; harpoon
(global-set-key (kbd "C-1") 'harpoon-go-to-1)
(global-set-key (kbd "C-2") 'harpoon-go-to-2)
(global-set-key (kbd "C-3") 'harpoon-go-to-3)
(global-set-key (kbd "C-4") 'harpoon-go-to-4)
(global-set-key (kbd "C-5") 'harpoon-go-to-5)
(global-set-key (kbd "C-l") 'harpoon-toggle-file)
(global-set-key (kbd "C-a") 'harpoon-add-file)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company consult-projectile counsel-projectile delight drag-stuff
	     evil harpoon ido-completing-read+ lsp-ui magit marginalia
	     orderless smex tree-sitter-langs vertico yasnippet)))
