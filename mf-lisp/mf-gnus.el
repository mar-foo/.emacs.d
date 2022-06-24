;;; mf-gnus.el -- Gnus configuration -*- lexical-binding: t -*-
;;; Code:
(setq maildir-root (concat (getenv "HOME") "/.local/share/mail/"))
(setq gnus-select-method '(nntp "news.gmane.io")
      gnus-secondary-select-methods '((nnmaildir "uni" (directory (concat maildir-root "mario.forzanini@studenti.unimi.it")))
				      (nnmaildir "pers" (directory (concat maildir-root "mf@marioforzanini.com"))))
     mail-sources
      '((maildir :path (concat maildir-root "mario.forzanini@studenti.unimi.it")
		 :subdirs ("cur" "new")
		 :plugged t)
	(maildir :path (concat maildir-root "mf@marioforzanini.com")
		 :subdirs ("cur" "new")
		 :plugged t))
      user-mail-address "mf@marioforzanini.com"
      user-full-name "Mario Forzanini"
      message-send-mail-function 'message-send-mail-with-sendmail
      sendmail-program (executable-find "msmtp")
      message-send-mail-extra-arguments '("-a" "mf@marioforzanini.com")
      gnus-parameters
      '((".*"
	 (signature "--\nMario\n")
	 (posting-style
	  (address "mf@marioforzanini.com")
	  (name "Mario Forzanini")
	  (eval (setq message-sendmail-extra-arguments '("-a" "mf@marioforzanini.com")))
	  (user-mail-address "mf@marioforzanini.com")))
	("nnmaildir\\+uni.*"
	 (signature "--\nMario Forzanini\n")
	 (posting-style
	  (address "mario.forzanini@studenti.unimi.it")
	  (name "Mario Forzanini")
	  (eval (setq message-sendmail-extra-arguments '("-a" "mario.forzanini@studenti.unimi.it")))
	  (user-mail-address "mario.forzanini@studenti.unimi.it")))))
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

(defun mf/gnus ()
  (interactive)
  (persp-switch "gnus")
  (gnus))

(mf/leader "m" mf/gnus)

(provide 'mf-gnus)

