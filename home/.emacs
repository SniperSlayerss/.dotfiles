(load-file "~/.emacs.custom/require.el")
(load-file "~/.emacs.custom/style.el")
(load-file "~/.emacs.custom/utils.el")

;;1, package config
;; treesitter
(use-package tree-sitter
  :config (global-tree-sitter-mode))

(use-package tree-sitter-langs
  :after tree-sitter
  :hook (tree-sitter-after-on . tree-sitter-hl-mode))

;; yasnippet
(use-package yasnippet
  :config (yas-global-mode 1))

;; ido-completing-read+
(use-package ido-completing-read+
  :init
  (ido-mode 1)
  (ido-everywhere 1)
  (ido-ubiquitous-mode 1))

;; evil
(use-package evil
  :init
  (setq evil-want-C-u-scroll t
        evil-kill-on-visual-paste nil)
  :config (evil-mode 1))

;; which-key
(use-package which-key
  :config (which-key-mode))

;; projectile
(use-package projectile
  :init
  (setq projectile-project-search-path '("~/personal/")
        projectile-globally-ignored-directories '(".venv")
        projectile-globally-ignored-files '(".venv"))
  :config
  (projectile-mode +1)
  (projectile-discover-projects-in-search-path))

;; company
(use-package company
  :hook (after-init . global-company-mode))

;; other
(use-package delight)
(use-package magit)
(use-package harpoon)
(use-package smex)
(use-package drag-stuff)

;;2, general config
;;(add-hook 'before-save-hook 'auto-indent-on-save)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq gc-cons-threshold (* 50 1000 1000))

(delight '((flycheck-mode nil "flycheck")
           (lsp-mode nil "lsp-mode")
           (which-key-mode nil "which-key")
           (abbrev-mode nil "abbrev")
           (eldoc-mode nil "eldoc")
           (tree-sitter-mode nil "tree-sitter")
           (projectile-mode nil "projectile")
           (eglot-mode nil "eglot")))

;; keybinds
(evil-set-leader 'normal (kbd "SPC"))

;; standard
(evil-define-key 'normal 'global (kbd "<leader>fj") 'dired-jump)
(evil-define-key 'normal 'global (kbd "<leader>ff") 'find-file)
(evil-define-key 'normal 'global (kbd "<leader>fd") 'auto-indent-on-save)
(evil-define-key 'normal 'global (kbd "<leader>cc") 'compile)
(evil-define-key 'normal 'global (kbd "<leader>bn") 'next-buffer)
(evil-define-key 'normal 'global (kbd "<leader>bp") 'previous-buffer)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "C-<backspace>") 'alt/backward-kill-word)

;; drag-stuff
(evil-define-key 'visual 'global (kbd "J") 'drag-stuff-down)
(evil-define-key 'visual 'global (kbd "K") 'drag-stuff-up)

;; smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; projectile
(evil-define-key 'normal 'global (kbd "<leader>pf") 'projectile-find-file)
(evil-define-key 'normal 'global (kbd "<leader>pg") 'projectile-grep)
(evil-define-key 'normal 'global (kbd "<leader>pd") 'projectile-dired)
(evil-define-key 'normal 'global (kbd "<leader>pc") 'projectile-compile-project)
(evil-define-key 'normal 'global (kbd "<leader>ps") 'projectile-find-other-file)
(evil-define-key 'normal 'global (kbd "<leader>pr") 'projectile-replace)
(evil-define-key 'normal 'global (kbd "<leader>pw") 'projectile-switch-project)

;; harpoon
(global-set-key (kbd "C-1") 'harpoon-go-to-1)
(global-set-key (kbd "C-2") 'harpoon-go-to-2)
(global-set-key (kbd "C-3") 'harpoon-go-to-3)
(global-set-key (kbd "C-4") 'harpoon-go-to-4)
(global-set-key (kbd "C-5") 'harpoon-go-to-5)
(global-set-key (kbd "C-l") 'harpoon-toggle-file)
(global-set-key (kbd "C-a") 'harpoon-add-file)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("12215297b6de3a361cbf252e0ac1f955d185942bf30623c175156083ccb826e1"
     "9fcd1cb18645407131a9ab1e49a6a7ec3f21a4d8a7a7a7b57b042f453c0cfae4"
     "e097c5df9147c5b0640686109341899408503add1c41bfb6a5fbd93099cbab56"
     "6cd7a68c0e63d1f6cf09ecaec231955d663714b9bf1f07f2da7ad3e30fb6e0bb"
     "bea4633bc7045abe48c41cdf878484441b43c57dee608c5288c9aab9ad148695"
     "bc8c28052eb3bfb00289acc56a39d0a5fa60ed0092c3ac0e1573a032cb55c481"
     "6e88d32af2e62073d9c4f3d9a9b3ded6b23eb8509c1fcf497c17049823d721ef"
     "12782c7b204a019b7a5038b85a1d7e752a1a4dc72c7a8100ab36a3d58ca9d464"
     "3fc333844d3c468e000f33f7a33a853bcce0764b22756642e61577d96c8fda04"
     "63439c0f9ee70322e5a94452bc89fc04c0613af61c6d2897a62a398ca9023cef"
     "0d053a4021eacc2b71984b6deebc663bc435eb883ae552bd6b31832cf4e2fbfb"
     "ac9d38cb3810b137edf8769b9ceaaafbc11944b950be82ee1b9b7fbad2dca29d"
     "b425941e047eb742af1871be9fa2ed5554a20decace8c2ee0817b33d626b448c"
     "f1036056a4480b2affd9c10773d8f18ca9128da1268674c4ba9ec297d70d479b"
     "7554e0ab4ec60666eda7406ccb9819db933876fa9633f1789a1cfab0239c479a"
     "de3a4c8f0612c0135dd42f059b4f21c23a5e85d439a500c3ff1ae29a4c122298"
     "cde4f3c995777630d1b8fb4d402b68695c65f66e0f6aec295e082e9a661758ed"
     "8c49382e3bbf5b18c4a6f58b15f89034a99f6a8a8b96f1526d65afbd43d71ff7"
     "f70fba5222b741de679f4c19f21d9254aae69f04d5b84cda84bb756facfb7c24"
     "8660678488dc817e9a737e7737fd8767a3203d1bea46b806e47a277e2dd9ca4b"
     "8f87f450a8d49abed7da4b771a110a7cca026e739e81130c8427222d81f41bdf"
     "a8b48566aa1037e1473f46d51d40165e308372acb241c1a1e9baa465a4f6dfad"
     "7201e2bff7d545d0b693208cebbfcfd38a27c7f644e1b974661530fa817d1950"
     "6164996403127391160f92d2d0eb89d55f1c75a28a394142873ab7e3114417b4"
     "f07e3dd23bf8a77ef00e327ceaa354957107db846dcff194c3f209b68db126b4"
     "2fbea855628e4f87ca5543be3095254505d1af305ee5ea0667fb5522e8590ee4"
     "39d53c8e2ce47b3271d451349393774172bd060899d0eeba00b4fad5f85158aa"
     "eea756c124e7d0fb8bc442e245c5c4f2bc9ccb27c53423cfc4cbc4238b0e5173"
     "68c10bb38ff0bc8956973dcb3c5a3a38e03bde7c8c73d5509c2e13e819100734"
     "e38d32f5e507ae3b21ceb0a7ee8af25016e9c0300d30a2129efe49bc92f83d79"
     "5f73049d2ae2dcc6b55072476225da1a8433309bd3e79df8e9e285243cc0989d"
     "a6f4da1bebb9dff0bdff7a35899af1a029a00f785cdc797af680b263a246b35b"
     "fc0034f694c88b380fdb5dd59434b63c4c2e7e592502496adcf483ad08260207"
     "3670e6655d5a33e20e5b93315e46962def6ded0920e1adb156a296ab9ac59349"
     default))
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
