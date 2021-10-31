;;; mf-bongo.el --- Configuration for the bongo music player -*- lexical-binding: t -*-
;;; Code:
(mf/install bongo)
(mf/autoload-func
 :func bongo
 :file "bongo")
(eval-after-load 'bongo
  '(progn
	 (message "Loaded bongo.")
	 (setq bongo-default-directory
		   "~/Media/Music")))
(provide 'mf-bongo)
;;; mf-bongo.el ends here
