;;; mf-shell.el --- Configuration for emacs' shells -*- lexical-binding: t -*-
;;; Code:
;;;###autoload
(defun mf/toggle-eshell ()
  "Toggle eshell window respecting buffer-alist configuration."
  (interactive)
  (if (get-buffer-window "*eshell*")
      (delete-window (get-buffer-window "*eshell*"))
    (eshell)))

;;;###autoload
(defun mf/toggle-shell (&optional use-generic-p)
  "Toggle shell window."
  (interactive "P")
  (if (string-match "\\*shell" (buffer-name))
      (delete-window)
    (let ((shell-buffers (cl-loop
			  for buf in (nreverse (if persp-mode
						   (mapcar #'get-buffer (persp-current-buffer-names))
						 (buffer-list)))
			  if (with-current-buffer buf (derived-mode-p 'shell-mode))
			  collect buf)))
      (cond
       ((eq (length shell-buffers) 1)
	(if (not use-generic-p)
	    (pop-to-buffer (pop shell-buffers))))
       ((null shell-buffers)
	(if persp-mode
	    (shell (get-buffer-create (format "*shell (%s)*" (persp-current-name))))
	  (shell)))
       (t
	(pop-to-buffer
	 (completing-read "Switch to Shell buffer: "
			  (mapcar #'buffer-name
				  shell-buffers)))))))
  (if use-generic-p
      (let ((buf-name (if persp-mode
			  (generate-new-buffer-name (format "*shell (%s)*" (persp-current-name)))
			(generate-new-buffer-name "*shell*"))))
	(save-excursion
	  (shell (get-buffer-create buf-name)))
	(pop-to-buffer buf-name))))

(defun add-process-sentinel (sentinel &optional process)
  "Add SENTINEL to PROCESS.
PROCESS defaults to the process of the current buffer.
Use this function with care.
If there is already a process sentinel SENTINEL is used as after-advice.
That can fail if the process sentinel is reset by some other function."
  (unless process
    (setq process (get-buffer-process (current-buffer))))
  (let ((old (process-sentinel process)))
    (cond
     ((symbolp old)
      (advice-add old :after sentinel))
     ((null old)
      (set-process-sentinel process sentinel))
     (t (warn "Cannot set sentinel %S for process %S." sentinel process)))))

(defun my-shell-mode-hook ()
  "Custom `shell-mode' behaviours."
  ;; Kill the buffer when the shell process exits.
  (add-process-sentinel
   (lambda (process signal)
     (and (memq (process-status process) '(exit signal))
	  (buffer-live-p (process-buffer process))
	  (kill-buffer (process-buffer process))))))

(add-hook 'shell-mode-hook 'my-shell-mode-hook)

(provide 'mf-shell)
;;; mf-shell.el ends here
