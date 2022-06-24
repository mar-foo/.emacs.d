;;; mf-config.el --- Load configuration modules -*- lexical-binding: t
;;; Code

(require 'mf-autoloads)

(require 'mf-keybindings)

(require 'mf-completion)

(require 'mf-dired)

(require 'mf-erc)

(require 'mf-eww)

(require 'mf-git)

(require 'mf-gnus)

(require 'mf-hacks)

(require 'mf-ibuffer)

(require 'mf-org)

(require 'mf-perspective)

(require 'mf-programming)

(require 'mf-shell)

;; Startup time and garbage collection
(add-hook 'emacs-startup-hook
	  (lambda ()
	    (message "Emacs ready in %s with %d garbage collections"
		     (format "%.2f seconds"
			     (float-time
			      (time-subtract after-init-time before-init-time)))
		     gcs-done)))

(provide 'mf-config)
;;; mf-config.el ends here
