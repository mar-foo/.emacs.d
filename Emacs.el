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

;;; Dired
(mf/install dired-filter)
(eval-after-load 'dired
  '(progn
	 (message "Loaded dired-mode")
	 (setq dired-kill-when-opening-new-dired-buffer t)
	 (add-hook 'dired-mode-hook 'dired-hide-details-mode)
	 (add-hook 'dired-mode-hook 'dired-filter-mode)))

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
