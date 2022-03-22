;;; mf-mu4e.el --- My mu4e configuration -*- lexical-binding: t -*-
;;; Code:
(cond
 ((string= mf/os "OpenBSD\n")
      (add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e/"))
 (t
      (add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e/")))
(mf/autoload-func
 :func mu4e
 :file "mu4e")
(eval-after-load 'mu4e
      '(progn
	 (message "Mu4e loaded")
	 (require 'smtpmail)
	 (setq user-mail-address "mario.forzanini@studenti.unimi.it"
		       user-full-name "Mario Forzanini"
		       mu4e-get-mail-command "mbsync -c ~/.config/mutt/mbsyncrc -a mario.forzanini@studenti.unimi.it"
		       mu4e-compose-signature
		       (concat
			"----------\n"
			"Mario Forzanini\n"
			"http://www.marioforzanini.com")
		       message-send-mail-function 'smtpmail-send-it
		       starttls-use-gnutls nil
		       smtpmail-auth-credentials '(("smtp.unimi.it" 465 "mario.forzanini@studenti.unimi.it" nil))
		       smtpmail-default-smtp-server "smtp.unimi.it"
		       smtpmail-smtp-server "smtp.unimi.it"
		       smtpmail-smtp-service 465
		       smtpmail-stream-type 'ssl
		       mu4e-sent-folder "/Sent"
		       mu4e-drafts-folder "/Drafts"
		       mu4e-trash-folder "/Trash"
		       mu4e-headers-date-format "%d/%m/%Y"
		       mu4e-date-format-long "%d/%m/%Y"
		       mu4e-change-filenames-when-moving t)
	 (add-to-list 'mu4e-bookmarks
				      '(:name "Uni"
						      :key ?U
						      :query "from:unimi.it AND to:mario.forzanini@studenti.unimi.it OR from:mario.forzanini@studenti.unimi.it AND to:unimi.it"))
	 (add-to-list 'mu4e-bookmarks
				      '(:name "Traccia"
						      :key ?T
						      :query "from:latracciabg.it OR to:latracciabg.it"))
	 (add-to-list 'mu4e-bookmarks
				      '(:name "LCM"
						      :key ?l
						      :query "from:lcm.mi.infn.it OR from:pcteor1.mi.infn.it"))
	 (define-key mu4e-main-mode-map (kbd "n") #'next-line)
	 (define-key mu4e-main-mode-map (kbd "p") #'previous-line)
	 (define-key mu4e-headers-mode-map (kbd "C-c c") 'mu4e-org-store-and-capture)
	 (define-key mu4e-view-mode-map (kbd "C-c c") 'mu4e-org-store-and-capture)
	 (add-hook 'mu4e-compose-mode-hook #'mml-secure-message-sign-pgp)))

(provide 'mf-mu4e)
      ;;; mf-mu4e.el ends here
