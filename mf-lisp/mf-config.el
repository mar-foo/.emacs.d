(require 'mf-exwm)

(require 'mf-autoloads)

(require 'mf-mpc)

(require 'mf-erc)

(require 'mf-gnus)

(require 'mf-mu4e)

(require 'mf-completion)

(require 'mf-org)

(require 'mf-hacks)

(require 'mf-programming)

(require 'mf-dired)

(require 'mf-pass)

(require 'mf-ibuffer)

(require 'mf-keybindings)

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
