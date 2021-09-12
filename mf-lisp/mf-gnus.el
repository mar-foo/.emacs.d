;;; mf-gnus.el --- Gnus configuration -*- lexical-binding: t -*-
;;; Code:
(eval-when-compile
  (require 'gnus)
  (require 'gnus-topic))

;;;###autoload
(defun mf/gnus-setup()
  (setq user-mail-address "mario.forzanini@studenti.unimi.it"
		user-full-name "Mario Forzanini"
		send-mail-function 'transport
		sendmail-program (executable-find "msmtp")
		mail-specify-envelope-from t
		mail-envelope-from 'header
		message-sendmail-envelope-from 'header
		starttls-use-gnutls nil)
  (setq gnus-selected-method '(nnnil ""))
  (setq gnus-secondary-select-methods
		'((nnmaildir "uni" (directory "~/.local/share/mail/mario.forzanini@studenti.unimi.it")
					 (gnus-search-engine gnus-search-notmuch
										 (remove-prefix "~/.local/share/mail/mario.forzanini@studenti.unimi.it/")))
		  (nntp "news.gwene.org")))
  (setq gnus-search-use-parsed-queries nil) ; Emacs 28
  (setq gnus-parameters
		'((".*"							; fallback
		   (posting-style
			(gcc "nnmaildir+uni:Sent")
			(From
			 (format "%s <%s>" user-full-name))))
		  ("uni"
		   (posting-style
			(gcc "nnmaildir+uni:Sent")
			(From
			 (format "%s <%s>" user-full-name))))))

(setq gnus-gcc-mark-as-read t)
(setq gnus-agent t)
(setq gnus-novice-user t)
(setq gnus-check-new-newsgroups 'ask-server)
(setq gnus-read-active-file 'some))

(provide 'mf-gnus)
;;; gnus.el ends here
