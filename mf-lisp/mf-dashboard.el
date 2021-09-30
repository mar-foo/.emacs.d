;;; mf-dashboard.el --- Custom welcome screen for Emacs -*- lexical-binding: t -*-
;;; Code:
(define-derived-mode dashboard-mode fundamental-mode "Dashboard"
  "Startup screen major mode"
  :group 'mf-dashboard
  :syntax-table nil
  :abbrev-table nil
  (buffer-disable-undo)
  (whitespace-mode -1)
  (linum-mode -1)
  (display-line-numbers-mode -1)
  (setq buffer-read-only t
		truncate-lines t
		inhibit-startup-screen t))

(defgroup mf-dashboard nil
  "My startup screen"
  :group 'applications)

(defconst mf-dashboard-buffer-name "*dashboard*"
  "Startup screen buffer name")

(defconst mf-dashboard-banner-length 300
  "Width of a banner.")

(defconst mf-dashboard-banner-max-height 0
  "Max height of a banner.")

(defconst mf-dashboard-banner-max-width 0
  "Max width of a banner.")

(defface mf-dashboard-logo-title
  '((t :inherit font-lock-keyword-face))
  "Face used for the banner title"
  :group 'mf-dashboard)

(defun mf-dashboard-init ()
  "Insert contents in the startup buffer"
  (interactive)
  (with-current-buffer (get-buffer-create mf-dashboard-buffer-name)
	(let ((buffer-read-only nil))
	  (erase-buffer)
	  (mf-dashboard-insert-image)
	  (mf-dashboard-insert-init-info))
	(dashboard-mode)))

(defun mf-dashboard-center-line (string)
  "Center a STRING according to it's size."
  (insert (make-string (max 0 (floor (/ (- (window-width)
										   (+ (length string) 1))
										2)))
					   ?\ )))

(defun mf-dashboard-insert-image ()
  "Insert banner at the top of the dashboard"
  (goto-char (point-max))
  (let ((banner (concat user-emacs-directory "logo.png") )
		(buffer-read-only nil))
	(when banner
	  (if (image-type-available-p (intern (file-name-extension banner)))
		  (when (file-exists-p banner)
			(let* ((title "Emacs is a decent operating system just lacking a good text editor.")
				   (spec
					(cond ((image-type-available-p 'imagemagick)
						   (apply 'create-image banner 'imagemagick nil))
						  (t
						   (apply 'create-image banner nil nil))))
				   (size (when (fboundp 'image-size) (image-size spec)))
				   (width (car size))
				   (left-margin (max 0 (floor (- (window-width )width) 2))))
			  (goto-char (point-min))
			  (insert "\n")
			  (insert (make-string left-margin ?\ ))
			  (insert-image spec)
			  (insert "\n\n")
			  (when title
				(mf-dashboard-center-line title)
				(insert (format "%s\n\n" (propertize title 'face 'mf-dashboard-logo-title))))))))))

(defun mf-dashboard-insert-init-info ()
  "Insert init info"
  (interactive)
  (let* ((init-time (format "%.2f seconds" (float-time (time-subtract after-init-time before-init-time))))
		 (info (format "Emacs ready in %s with %d garbage collections" (propertize init-time 'face 'font-lock-keyword) gcs-done))
		 (buffer-read-only nil))
	(mf-dashboard-center-line info)
	(insert info)))

(add-hook 'window-setup-hook
		  (lambda()
			(add-hook 'window-size-change-functions 'mf-dashboard-resize-on-hook)
			(mf-dashboard-resize-on-hook)))

(defun mf-dashboard-refresh-buffer ()
  "Refresh dashboard buffer"
  (interactive)
  (switch-to-buffer mf-dashboard-buffer-name))

(defun mf-dashboard-resize-on-hook (&optional _)
  "Re-render dashboard buffer on window size change."
  (let ((space-win (get-buffer-window mf-dashboard-buffer-name))
		(frame-win (frame-selected-window)))
	(when (and space-win
			   (not (window-minibuffer-p frame-win)))
	  (with-selected-window space-win
		(mf-dashboard-init)))))

;;;autoload
(defun mf-dashboard-setup-startup-hook ()
  "Setup post initialization hooks.
If a command line argument is provided, assume a filename and
skip displaying the dashboard."
  (add-hook 'after-init-hook (lambda ()
							   (mf-dashboard-init)))
  (add-hook 'emacs-startup-hook (lambda()
								  (switch-to-buffer mf-dashboard-buffer-name)
								  (goto-char (point-min))
								  (redisplay)
								  (run-hooks 'mf-dashboard-after-initialize-hook))))

(provide 'mf-dashboard)
;;; mf-dashboard.el ends here
