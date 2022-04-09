;;; mf-git.el --- Git workflow configuration -*- lexical-binding: t -*-
;;; Code:
(mf/install magit)
(progn
  (mf/autoload-func
   :func magit
   :file "magit")
  (mf/autoload-func
   :func magit-status
   :file "magit")
  (eval-after-load 'magit
    '(message "Loaded magit")))

; keybindings
(mf/leader "g" magit-status)

(provide 'mf-git)
;;; mf-git.el ends here
