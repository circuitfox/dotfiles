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

(require 'package)

(defun package-require (package)
  "Install a PACKAGE unless it is already installed or a feature with the
 same name is already is already active

Usage: (package-require 'package)"
  (package-activate package '(0))
  (condition-case nil
      (require package)
    (error (package-install package))))

;; turn off the ugly icon bar
(tool-bar-mode 0)
(menu-bar-mode 0)

;; turn off the scroll bar
(scroll-bar-mode 0)

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

;; no tabs, four spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(load-theme 'circuitfox t)

;; put autosaves and backups in /tmp
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;; package setup
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(package-require 'flycheck)
(package-require 'magit)
(package-require 'auto-complete)
(package-require 'haskell-mode)
(package-require 'csharp-mode)
(package-require 'markdown-mode)

(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))

(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown code." t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

(add-hook 'after-init-hook #'global-flycheck-mode)
(setq flycheck-highlighting-mode 'lines)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq require-final-newline t)
;;(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; c/c++/java/* features
(setq c-default-style "k&r"
      c-basic-offset 4)
(add-hook 'c-mode-common-hook '(lambda ()
  (local-set-ket (kbd "RET") 'newline-and-indent)))

(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc)