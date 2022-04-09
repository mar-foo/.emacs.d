;;; mf-telega.el --- Configuration for telega -*- lexical-binding: t -*-
;;; Code:
(mf/install telega)
(mf/autoload-func
 :func telega
 :file "telega")
(setq telega-chat-show-avatars nil
	  telega-root-show-avatars nil
	  telega-user-show-avatars nil)
;;;###autoload
(defun mf/toggle-telega (&optional use-generic-p)
  "Toggle telega root buffer, if called with a prefix argument
	switch to the buffer."
  (interactive "P")
  (if (get-buffer-window "*Telega Root*")
	  (delete-window (get-buffer-window "*Telega Root*"))
	(if use-generic-p
		(progn
		  (telega)
		  (delete-window (get-buffer-window "*Telega Root*"))
		  (switch-to-buffer "*Telega Root*"))
	  (telega))))

; keybindings
(mf/leader "t" mf/toggle-telega)

(provide 'mf-telega)
;;; mf-telega.el ends here
