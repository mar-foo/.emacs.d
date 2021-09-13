;;; mf-notmuch.el --- Configuration for notmuch
;;; Code:
(progn
  (add-to-list 'load-path "/usr/share/emacs/site-lisp/notmuch/")
  (unless
      (fboundp 'notmuch)
	(autoload #'notmuch "notmuch" nil t))
  (require 'mm-encode)
  (require 'mml-sec)
  (require 'message))

(setq user-mail-address "mario.forzanini@studenti.unimi.it"
      user-full-name "Mario Forzanini"
      send-mail-function 'transport
      sendmail-program (executable-find "msmtp")
      mail-specify-envelope-from t
      mail-envelope-from 'header
      message-sendmail-envelope-from 'header
      starttls-use-gnutls nil
      mm-encrypt-option nil
      mm-sign-option nil
      mml-secure-opengpg-encrypt-to-self t
      mml-secure-openpgp-sign-with-sender t
      mml-secure-smime-encrypt-to-self t
      mml-secure-smime-sign-with-sender t
      mail-signature "----------\nMario Forzanini\nhttp://www.marioforzanini.com\n"
      message-citation-line-format "On %d-%m-%Y, %R %z, %f wrote:\n"
      message-citation-line-function 'message-insert-formatted-citation-line
      message-confirm-send nil
      message-kill-buffer-on-exit t)
  (setq notmuch-saved-searches
		`((:name "inbox"
				 :query "tag:inbox"
				 :key "i"
				 :sort-order newer-first)
		  (:name "unread"
				 :query "tag:unread"
				 :key "u"
				 :sort-order newer-first)
		  (:name "unimi"
			 :query "tag:uni"
				 :sort-order newer-first)
		  (:name "9front"
				 :query "tag:9front"
				 :key "9"
				 :sort-order newer-first)))

(provide 'mf-notmuch)
;;; mf-notmuch.el ends here