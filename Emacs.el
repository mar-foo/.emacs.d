;;; Emacs.el --- Use package driven emacs configuration
;;; Code:
(require 'mf-autoloads)
(require 'mf-look-and-feel)
(require 'mf-notmuch)
(require 'mf-completion)
(require 'mf-org)
; mf-keybindings has to be loaded after everything else, it needs some
; autoloads to be defined
(require 'mf-keybindings)

;;; Programming
(mf/install projectile)
(progn
  (unless
	(fboundp 'projectile-mode)
  (autoload #'projectile-mode "projectile" nil t))
(add-hook 'c-mode-hook 'projectile-mode)
(add-hook 'c++-mode-hook 'projectile-mode)
(add-hook 'go-mode 'projectile-mode)
(add-hook 'haskell-mode 'projectile-mode)
(add-hook 'emacs-lisp-mode 'projectile-mode))

;; Golang
(mf/install go-mode)
(progn
  (unless
	  (fboundp 'go-mode)
	(autoload #'go-mode "go-mode" nil t))
  (add-hook 'go-mode-hook 'gofmt-before-save))

;; Haskell
(mf/install haskell-mode)
(progn
  (unless
	  (fboundp 'haskell-mode)
	(autoload #'haskell-mode "haskell-mode" nil t))
  (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
  (add-hook 'haskell-mode-hook 'haskell-indent-mode))

(mf/install hindent)
(progn
  (unless
	  (fboundp 'hindent-mode)
	(autoload #'hindent-mode "hindent" nil t))
  (add-hook 'haskell-mode-hook 'hindent-mode)
  (setq hindent-reformat-buffer-on-save t))

;; C
(add-hook 'c-mode-hook '(lambda()
						  (c-set-style "k&r")))

;; Git
(mf/install magit)
(progn
  (unless
	  (fboundp 'magit)
	(autoload #'magit "magit" nil t))
  (unless
	  (fboundp 'magit-status)
	(autoload #'magit-status "magit-status" nil t)))
;;; Emacs.el ends here
