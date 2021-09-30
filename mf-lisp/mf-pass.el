;;; mf-pass.el --- Configuration for the emacs frontend to GNU pass -*- lexical-binding: t -*-
;;; Code:
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

(provide 'mf-pass)
;;; mf-pass.el ends here
