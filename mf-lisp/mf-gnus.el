;;; mf-gnus.el --- Configuration for gnus -*- lexical-binding: t -*-
;;; Code:
(progn
  (mf/autoload-func
   :func gnus
   :file "gnus")
  (eval-after-load 'gnus
	'(progn
	   (setq gnus-select-method '(nntp "news.gwene.org"))
	   (add-hook 'gnus-group-mode-hook 'gnus-topic-mode))))

(provide 'mf-gnus)
;;; mf-gnus.el ends here
