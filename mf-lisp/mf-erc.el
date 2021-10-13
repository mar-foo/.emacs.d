;;; mf-erc.el --- Configuration for ERC -*- lexical-binding: t -*-
;;; Code:
(progn
  (mf/autoload-func
   :func erc
   :file "erc")
  (mf/autoload-func
   :func erc-tls
   :file "erc")
  (eval-after-load 'erc
	'(progn
	   (message "Loaded erc")
	   (add-hook 'erc-mode-hook #'(lambda()
									(whitespace-mode)
									(whitespace-mode -1)))
	   (setq erc-autojoin-channels-alist
			 '(("irc.libera.chat" "#emacs")
			   ("localhost" "&bitlbee"))))))

(provide 'mf-erc)
;;; mf-erc.el ends here
