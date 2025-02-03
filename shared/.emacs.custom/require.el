;; Add MELPA repository
(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; Initialize package system
(package-initialize)

;; Ensure the package list is updated
(unless package-archive-contents
  (package-refresh-contents))

(defun require-one-package (package)
    (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package))
    (require package))

(defun require-package (&rest packages)
  (dolist (package packages)
    (require-one-package package)))
