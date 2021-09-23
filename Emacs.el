;;; Emacs.el --- Use package driven emacs configuration
;;; Code:
(require 'mf-exwm)
(require 'mf-autoloads)
(require 'mf-look-and-feel)
(require 'mf-mpc)
(require 'mf-erc)
(require 'mf-notmuch)
(require 'mf-completion)
(require 'mf-org)
; mf-keybindings has to be loaded after everything else, it needs some
; autoloads to be defined
(require 'mf-keybindings)

(mf/install gcmh)
(gcmh-mode 1)

(eval-after-load 'dired
  '(progn
	 (message "Loaded dired-mode")
	 (add-hook 'dired-mode-hook 'dired-hide-details-mode)))

;;; Programming
;; Golang
(mf/install go-mode)
(progn
  (unless
	  (fboundp 'go-mode)
	(autoload #'go-mode "go-mode" nil t))
  (unless
	  (fboundp 'gofmt-before-save)
	(autoload #'gofmt-before-save "gofmt-before-save" nil t))
  (eval-after-load 'go-mode
	'(progn
	   (message "Loaded go-mode")
	   (add-hook 'go-mode-hook 'gofmt-before-save))))

;; Haskell
(mf/install haskell-mode)
(progn
  (unless
	  (fboundp 'haskell-mode)
	(autoload #'haskell-mode "haskell-mode" nil t))
  (unless
	  (fboundp 'interactive-haskell-mode)
	(autoload #'interactive-haskell-mode "haskell-mode" nil t))
  (unless
	  (fboundp 'haskell-indent-mode)
	(autoload #'haskell-indent-mode "haskell-mode" nil t))
  (eval-after-load 'haskell-mode
	'(progn
	   (message "Loaded haskell-mode")
	   (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
	   (add-hook 'haskell-mode-hook 'haskell-indent-mode))))

(mf/install hindent)
(unless
	(fboundp 'hindent-mode)
  (autoload #'hindent-mode "hindent" nil t))
(eval-after-load 'haskell-mode
  '(progn
	 (message "Loaded hindent")
	 (add-hook 'haskell-mode-hook 'hindent-mode)
	 (setq hindent-reformat-buffer-on-save t)))

;; C
(add-hook 'c-mode-hook #'(lambda()
						  (c-set-style "k&r")))

;; Git
(mf/install magit)
(progn
  (unless
	  (fboundp 'magit)
	(autoload #'magit "magit" nil t))
  (unless
	  (fboundp 'magit-status)
	(autoload #'magit-status "magit" nil t))
  (eval-after-load 'magit
	'(message "Loaded magit")))

;; Pass
(mf/install password-store)
(progn
  (unless
	  (fboundp 'password-store-copy)
	(autoload #'password-store-copy "password-store-copy" nil t))
  (unless
	  (fboundp 'password-store-insert)
	(autoload #'password-store-insert "password-store-insert" nil t))
  (unless
	  (fboundp 'password-store-insert)
	(autoload #'password-store-generate "password-store-generate" nil t))
  (eval-after-load 'password-store
	'(progn
	   (message "Loaded password-store")
	   (require 'epa-file)
	   (setq epa-pinentry-mode 'loopback))))
;;; Emacs.el ends here
