;;; mf-telega.el --- Configuration for telega -*- lexical-binding: t -*-
;;; Code:
(mf/install telega nil)
(mf/autoload-func
 :func telega
 :file "telega")
(setq telega-chat-show-avatars nil
	  telega-root-show-avatars nil
	  telega-user-show-avatars nil)

(provide 'mf-telega)
;;; mf-telega.el ends here
