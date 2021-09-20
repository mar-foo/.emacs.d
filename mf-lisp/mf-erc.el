;;; mf-erc.el --- Configuration for ERC -*- lexical-binding: t -*-
;;; Code:
(progn
  (unless
	  (fboundp #'erc)
	(autoload #'erc "erc" nil t))
  (unless
	  (fboundp #'erc-tls)
	(autoload #'erc-tls "erc" nil t))
  (add-hook 'erc-mode-hook '(lambda() (whitespace-mode -1)))
  (setq erc-autojoin-channels-alist
		'(("irc.libera.chat" "#emacs")
		("localhost" "&bitlbee"))))
;;; mf-erc.el ends here
