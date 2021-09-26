;;; Emacs.el --- Use package driven emacs configuration
;;; Code:
;; Configuration modules used
(require 'mf-exwm)
(require 'mf-look-and-feel)
(require 'mf-autoloads)
(require 'mf-mpc)
(require 'mf-erc)
(require 'mf-gnus)
(require 'mf-mu4e)
(require 'mf-completion)
(require 'mf-org)
(require 'mf-programming)
; mf-keybindings has to be loaded after everything else, it needs some
; autoloads to be defined
(require 'mf-keybindings)

;;; Manage garbage collection
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
  (mf/autoload-func
   :func magit
   :file "magit")
  (mf/autoload-func
   :func magit-status
   :file "magit")
  (eval-after-load 'magit
	'(message "Loaded magit")))

;; Pass
(mf/install password-store)
(progn
  (mf/autoload-func
   :func password-store-copy
   :file "password-store")
  (mf/autoload-func
   :func password-store-insert
   :file "password-store")
  (mf/autoload-func
   :func password-store-generate
   :file "password-store")
  (eval-after-load 'password-store
	'(progn
	   (message "Loaded password-store")
	   (require 'epa-file)
	   (setq epa-pinentry-mode 'loopback))))
;;; Emacs.el ends here
