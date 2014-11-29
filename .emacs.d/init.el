(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("1f056c33852b6b4f9ef9355f566866c3c0807e460c739f0e109559250b96af8c" default)))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(set-frame-font "Source Code Pro 11")

(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/theme")

;; put autosaves and backups in /tmp
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defun package-require (package)
  "Install a PACKAGE unless it is already installed or a feature with the
 same name is already is already active

Usage: (package-require 'package)"
  (package-activate package '(0))
  (condition-case nil
      (require package)
    (error (package-install package))))

(package-require 'color-identifiers-mode)
(package-require 'company)
(package-require 'flycheck)
(package-require 'ggtags)
(package-require 'haskell-mode)
(package-require 'magit)
(package-require 'markdown-mode)
(package-require 'org)

;; turn off the ugly icon bar
(tool-bar-mode 0)
(menu-bar-mode 0)

;; turn off the scroll bar
(scroll-bar-mode 0)

(if window-system
    (load-theme 'circuitfox t)
  (load-theme 'circuitfox-console t))

;; no tabs, four spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(setq-default column-number-mode t)

;; turn on line numbers and add a space after the number
(global-linum-mode 1)
(defun linum-format-func (line)
  (let ((w (length (number-to-string (count-lines (point-min) (point-max))))))
    (propertize (format (format "%%%dd " w) line) 'face 'linum)))
(setq linum-format 'linum-format-func)

;; highlight parens
(setq show-paren-delay 0)
(show-paren-mode t)

;; ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; org-mode shortcuts
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; find markdown files
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

(add-hook 'after-init-hook #'global-flycheck-mode)
(setq flycheck-highlighting-mode 'lines)

(add-hook 'after-init-hook 'global-company-mode)

(add-hook 'after-init-hook 'global-color-identifiers-mode)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq require-final-newline t)

;; c/c++/java indenting
(setq c-default-style "k&r"
      c-basic-offset 4)
(add-hook 'c-mode-common-hook
          '(lambda ()
             (local-set-ket (kbd "RET") 'newline-and-indent)
             (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
               (ggtags-mode 1))))

;; haskell
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc)
