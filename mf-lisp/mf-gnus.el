;;; mf-gnus.el --- Configuration for gnus -*- lexical-binding: t -*-
;;; Code:
(progn
  (unless
	  (fboundp 'gnus)
	(autoload #'gnus "gnus" nil t))
  (eval-after-load 'gnus
	'(progn
	   (setq gnus-select-method '(nntp "news.gwene.org"))
	   (add-hook 'gnus-group-mode-hook 'gnus-topic-mode))))

(provide 'mf-gnus)
;;; mf-gnus.el ends here
