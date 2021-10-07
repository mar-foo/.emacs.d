;;; mf-dashboard.el --- Custom welcome screen for Emacs -*- lexical-binding: t -*-
	 ;;; Code:
(defgroup mf-dashboard nil
  "My startup screen"
  :group 'applications)

(defvar dashboard-mode-map
  (let ((map (make-sparse-keymap)))
	(define-key map (kbd "b") 'switch-to-buffer)
	(define-key map (kbd "f") 'find-file)
	(define-key map (kbd "g") 'mf-dashboard-init)
	(define-key map (kbd "j") 'bookmark-jump)
	(define-key map (kbd "n") 'next-line)
	(define-key map (kbd "p") 'previous-line)
	(define-key map (kbd "q") 'quit-window)
	map)
  "Keymap for dashboard mode.")

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

(defcustom mf-dashboard-title "Emacs is a decent operating system only lacking a good text editor"
  "Title to be displayed in the dashboard"
  :type '(string)
  :group 'mf-dashboard)

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
	  (mf-dashboard-insert-title)
	  (mf-dashboard-insert-init-info))
	(dashboard-mode)))

(defun mf-dashboard-center-line (string)
  "Center a STRING according to it's size."
  (insert (make-string (max 0 (floor (/ (- (window-width)
										   (+ (length string) 1))
										2)))
					   ?\ )))

(defun mf-dashboard-insert-title ()
  "Insert banner at the top of the dashboard"
  (goto-char (point-min))
  (while (< (count-lines 1 (point)) (- (/ (window-height nil 'floor) 2) 3))
	  (insert "\n")
	  (forward-line))
  (when mf-dashboard-title
	(mf-dashboard-center-line mf-dashboard-title)
	(insert (format "%s\n\n" (propertize mf-dashboard-title 'face 'mf-dashboard-logo-title)))))

(defun mf-dashboard-insert-init-info ()
  "Insert init info"
  (interactive)
  (let* ((init-time (emacs-init-time "%.2f seconds"))
		 (info (format "Emacs ready in %s with %d garbage collections" (propertize init-time 'face 'font-lock-keyword-face) gcs-done))
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
