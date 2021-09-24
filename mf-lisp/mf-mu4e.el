;;; mf-mu4e.el --- My mu4e configuration -*- lexical-binding: t -*-
;;; Code:
(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e/")
(unless
	(fboundp #'mu4e)
  (autoload #'mu4e "mu4e" nil t))
(eval-after-load 'mu4e
  '(progn
	 (message "Mu4e loaded")
     (require 'smtpmail)
     (setq user-mail-address "mario.forzanini@studenti.unimi.it"
           user-full-name "Mario Forzanini"
           mu4e-get-mail-command "mbsync -c ~/.mbsyncrc -a mario.forzanini@studenti.unimi.it"
           mu4e-update-interval 300
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
           mu4e-trash-folder "/Trash")))

(provide 'mf-mu4e)
;;; mf-mu4e.el ends here
