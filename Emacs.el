;;; Emacs.el --- Use package driven emacs configuration
;;; Code:
(require 'mf-autoloads)
(require 'mf-look-and-feel)
(require 'mf-notmuch)
(require 'mf-completion)
; mf-keybindings has to be loaded after everything else, it needs some
; autoloads to be defined
(require 'mf-keybindings)

;;; Programming
(use-package projectile
  :defer t
  :commands projectile-mode
  :hook
  (c-mode . projectile-mode)
  (c++-mode . projectile-mode)
  (go-mode . projectile-mode)
  (haskell-mode . projectile-mode)
  (emacs-lisp-mode . projectile-mode))

;; Golang
(use-package go-mode
  :defer t
  :commands go-mode
  :config
  (add-hook 'go-mode-hook 'gofmt-before-save))

;; Haskell
(use-package hindent
  :defer t
  :commands hindent-mode
  :hook (haskell-mode-hook . hindent-mode)
  :config (setq hindent-reformat-buffer-on-save t))

;; C
(add-hook 'c-mode-hook '(lambda()
						  (c-set-style 'k&r)))

;; Git
(use-package magit
  :defer t
  :commands magit magit-status)
;;; Emacs.el ends here
