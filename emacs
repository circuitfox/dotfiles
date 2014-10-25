(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("96849dbe022998482ff5bed7feda90332926053b086d10812fb97fbf6f36d806" "38a4b30ad6810205d5536619a6c109a0188804987153bf339fce835a0e640b31" "ea56a42650f8862da27df9077ce9774197fe6e8a978740178c28e7db7c723ba4" "9875f9a83db4cdac220312c5efb060b77ceb57fa88e5708b818d3e327a6c8b1f" "fa218243b5a10c684836382779edcb65b50fa2241460622f381f1e59ffa14b4e" "c35e6d0138e6abd0904dcda7964eeffae0dca637d92d7e7e537fa155d783e040" "56c9a808039f1615205f1eca7c29afd8b2294be2c04a5798ec60f924201b4569" "57bd314c34abcc96cde1b6b1cb84a899c1a3691cfc7e8c9e7c344d804f9afeab" "4d050b8feb30389381a3471b37ce24230332cf0c1b9f193e5eb114192efdfc66" "92cec131c6258ba83f2825f372e8072b75c29db3601f40b87c396444e15cebd4" "1f056c33852b6b4f9ef9355f566866c3c0807e460c739f0e109559250b96af8c" default)))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(set-frame-font "Source Code Pro 11")

;; add ~/.emacs.d/lisp and ~/.emacs.d/lisp/mode to load path
(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/lisp/mode")
(add-to-list 'custom-theme-load-path "~/.emacs.d/lisp/theme")

(require 'package)
;;(require 'rainbow-delimiters)

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
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(package-require 'flycheck)
(package-require 'auto-complete)
(package-require 'haskell-mode)

(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))

(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown code." t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

(add-hook 'after-init-hook #'global-flycheck-mode)
(setq flycheck-highlighting-mode 'lines)
;;(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; c/c++/java/* features
(setq c-default-style "k&r"
      c-basic-offset 4)
(add-hook 'c-mode-common-hook '(lambda ()
  (local-set-ket (kbd "RET") 'newline-and-indent)))

(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc)
