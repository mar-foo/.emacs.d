;;; mf-mpc.el --- Configuration for mpc.el -*- lexical-binding: t -*-
;;; Code:
(require 'mpc)
(progn
  (define-key mpc-mode-map (kbd "SPC") #'mpc-toggle-play)
  (define-key mpc-mode-map (kbd "p") #'previous-line)
  (define-key mpc-mode-map (kbd "n") #'next-line)
  (define-key mpc-tagbrowser-mode-map (kbd "a") #'mpc-playlist-add)
  (define-key mpc-mode-map (kbd "+") #'mpc-next)
  (define-key mpc-mode-map (kbd "-") #'mpc-prev)
 (defun mf/mpc (orig-func)
  (interactive
   (progn
   (if current-prefix-arg
	   (setq mpc-host (read-string
					   (format-prompt "MPD host and port" mpc-host)
					   nil nil mpc-host)))
   nil))
  (with-current-buffer
	  (current-buffer)
	(setq-local mpc-previous-window-config
				(current-window-configuration)))
  (let* ((tags mpc-browser-tags)
		 (win (pop-to-buffer (mpc-songs-buf) nil)))
	(unless tags (error "Need at least one entry in `mpc-browser-tags'"))
	(while
		(progn
		  (pop-to-buffer (mpc-tagbrowser-buf (pop tags)) nil)
		  tags)))
  (mpc-songs-refresh))
(advice-add 'mpc :around #'mf/mpc))

(provide 'mf-mpc)
;;; mf-mpc.el ends here
