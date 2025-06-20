(load-file "~/.emacs.custom/require.el")
(load-file "~/.emacs.custom/style.el")
(load-file "~/.emacs.custom/utils.el")

;;1, package config
;; treesitter
(use-package tree-sitter
  :config
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

;; Eglot mode (built-in LSP client in Emacs 30)
(use-package eglot
  :ensure nil
  :hook ((c-mode c++-mode python-mode rust-mode emacs-lisp-mode) . eglot-ensure)
  :config

;; Disable hover highlights and inlay hints
  (setq eldoc-echo-area-use-multiline-p nil
        eldoc-echo-area-display-truncation-message nil
        eglot-auto-display-help-buffer nil)

  ;; Disable inlay hints globally
  (setq eglot-ignored-server-capabilities '(:inlayHintProvider))

  ;; Disable document highlights (hover highlighting)
  (add-to-list 'eglot-ignored-server-capabilities :documentHighlightProvider)

  ;; Disable breadcrumb (headerline)
  (setq eglot-report-progress nil)

  ;; Disable code actions in modeline
  (setq eglot-extend-to-xref t)

  ;; Disable flymake when eglot is active (equivalent to your lsp-managed-mode-hook)
  (add-hook 'eglot-managed-mode-hook (lambda () (flymake-mode -1)))

  ;; Optional: Configure completion behavior
  (setq completion-category-overrides '((eglot (styles orderless)))))

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
        evil-kill-on-visual-paste nil
        evil-want-keybinding nil)
  :config (evil-mode 1))

;; evil-collection
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; general
(use-package general
  :ensure t)

;; which-key
(use-package which-key
  :config (which-key-mode))

;; company
(use-package company
  :after eglot
  :hook (eglot-managed-mode . company-mode))

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
(setq dired-dwim-target t)

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

(general-create-definer my/leader
  :states '(normal visual motion operator)
  :keymaps 'override
  :prefix "SPC"
  :non-normal-prefix "C-SPC")

(my/leader
  ;; Files & buffers
  "fj"  '(dired-jump                     :which-key "dired jump")
  "ff"  '(find-file                      :which-key "find file")
  "fa"  '(auto-indent-on-save            :which-key "auto-indent on save")
  "fb"  '(consult-buffer                 :which-key "switch buffer")
  "bn"  '(next-buffer                    :which-key "next buffer")
  "bp"  '(previous-buffer                :which-key "previous buffer")

  ;; Compilation
  "cc"  '(compile                        :which-key "compile")

  ;; Consult
  "cl"  '(consult-line                   :which-key "consult line")
  "cy"  '(consult-yank-pop               :which-key "yank history")

  ;; Projectile + Consult
  "pp"  '(projectile-switch-project      :which-key "switch project")
  "pf"  '(consult-projectile-find-file   :which-key "find in project")
  "pg"  '(consult-projectile-ripgrep     :which-key "project grep")
  "pb"  '(consult-projectile-switch-to-buffer :which-key "project buffer")
  "pd"  '(projectile-dired               :which-key "project dired")
  "pw"  '(consult-projectile-switch-project :which-key "switch project")

  ;; Eglot / LSP
  "ld"  '(xref-find-definitions          :which-key "go to def")
  "lr"  '(xref-find-references           :which-key "find refs")
  "lh"  '(eldoc-doc-buffer               :which-key "help hover")
  "ls"  '(eglot-find-references          :which-key "find refs (eglot)")
  "le"  '(flymake-show-buffer-diagnostics :which-key "show diagnostics")
  "la"  '(eglot-code-actions             :which-key "code actions")
  "ln"  '(eglot-rename                   :which-key "rename")
  "lf"  '(eglot-format                   :which-key "format")
  "li"  '(eglot-find-implementation      :which-key "go to impl")
  "lt"  '(eglot-find-typeDefinition      :which-key "go to type")
  ;; special shutdown
  "C-c l" '(eglot-shutdown               :which-key "shutdown LSP")
  ;; duplicate format
  "fd"  '(eglot-format                   :which-key "format")

  ;; Harpoon quick nav - fix should be C-l...
  "h1"  '(harpoon-go-to-1                :which-key "harpoon 1")
  "h2"  '(harpoon-go-to-2                :which-key "harpoon 2")
  "h3"  '(harpoon-go-to-3                :which-key "harpoon 3")
  "h4"  '(harpoon-go-to-4                :which-key "harpoon 4")
  "h5"  '(harpoon-go-to-5                :which-key "harpoon 5")
  "hl"  '(harpoon-toggle-file            :which-key "toggle harpoon list")
  "ha"  '(harpoon-add-file               :which-key "harpoon add")
  )

;; Visual-mode only
(general-define-key
 :states 'visual
 :keymaps 'override
 "J" 'drag-stuff-down
 "K" 'drag-stuff-up)

;; Non-leader / direct-key bindings via general
(general-define-key
 :keymaps 'override

 "C-<backspace>"  'alt/backward-kill-word
 "s-x"            'execute-extended-command)

;; Insert mode
(general-define-key
  :states '(insert)
  :keymaps 'override
  "C-c" 'evil-normal-state)

;; Everywhere but insert mode
(general-define-key
  :states '(normal visual motion operator emacs)
  :keymaps 'override
  "<escape>" 'keyboard-escape-quit)



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
 '(custom-safe-themes
   '("018226323614a09b36e730b961c048ae1c8747156537cfc2a9997a6bdee7ad17"
     "3a721cdbf1a79d6032bac37a6554216103521e7f717dd4b385fd584d56020f98"
     default))
 '(package-selected-packages nil))
