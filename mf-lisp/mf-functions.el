;;; mf-functions.el --- My custom functions -*- lexical-binding: t -*-
;;; Code:

;;;###autoload
(defun mf/big-font(&optional use-generic-p)
  (interactive "P")
  (if use-generic-p
	  (text-scale-decrease 4)
	(text-scale-increase 4)))

;;;###autoload
(defun mf/bookmarks ()
  (with-temp-buffer
	(insert-file-contents (file-truename "~/.local/share/bookmarks.txt"))
	(split-string (buffer-string))))

;;;###autoload
(defun mf/delete-sexp()
  (interactive)
  (mark-sexp)
  (delete-active-region))

;;;###autoload
(defun mf/edit-configuration()
  "Edit emacs configuration"
  (interactive)
  (find-file (concat user-emacs-directory "Emacs.el")))

;;;###autoload
(defun mf/eww ()
  (interactive)
  (with-temp-buffer
	(insert-file-contents "~/.local/share/bookmarks.txt")
	(let* ((links (buffer-string))
		   (bookmarks (split-string links)))
	  (eww (completing-read "URL: " bookmarks)))))

;;;###autoload
(defun mf/find-recentf()
  "Open a recent file list"
  (interactive)
  (find-file (completing-read "Recent File: " recentf-list nil t)))

;;;###autoload
(defun mf/infos()
  (interactive)
  (shell-command (executable-find "infos")))

;;;###autoload
(defun mf/quit-and-kill()
  (interactive)
  (quit-window t))

;;;###autoload
(defun mf/reload-configuration()
  "Reloads configuration"
  (interactive)
  (load-file (concat user-emacs-directory "init.el")))

;;;###autoload
(defun mf/select-completion-and-exit()
  (interactive)
  (icomplete-force-complete)
  (icomplete-ret))

;;;###autoload
(defun mf/switch-theme ()
  (interactive)
  (if (string= (car custom-enabled-themes) "mf")
	  (progn
		(load-theme 'mf-dark t)
		(disable-theme 'mf))
	(progn
	  (load-theme 'mf)
	  (disable-theme 'mf-dark))))

;;;###autoload
(defun mf/toggle-eshell (&optional use-generic-p)
  "Toggle eshell window respecting buffer-alist configuration.
If there is a prefix argument, switch to the eshell buffer."
  (interactive "P")
  (if (get-buffer-window "*eshell*")
	  (delete-window (get-buffer-window "*eshell*"))
	(if use-generic-p
		(progn
		  (eshell)
		  (delete-window (get-buffer-window "*eshell*"))
		(switch-to-buffer "*eshell*"))
	  (eshell))))

(defun mf/yank-to-string()
  (rotate-yank-pointer 0)
  (car kill-ring-yank-pointer))

;;;###autoload
(defun mf/mpv(&optional url)
  "Plays url in mpv"
  (interactive)
  (if (called-interactively-p)
	  (let ((url (mf/yank-to-string)))
		(start-process-shell-command "mpv" nil (concat "mpv " url)))
	(start-process-shell-command "mpv" nil (concat "mpv --ytdl-format='bestvideo[height<=1080]+bestaudio/best' " url))))

;;;###autoload
(defun mf/youtube(title)
  (interactive (list (read-string "Query: ")))
  (let* ((json (shell-command-to-string (concat "echo " title " | eyt")))
		 (resp-plist (json-parse-string json :object-type 'plist))
		 (videos (plist-get resp-plist :videos))
		 (ids (seq-map (lambda (vid)
						 (format "%s -$- %s"
								 (plist-get vid :title)
								 (plist-get vid :id)))
					   videos))
		 (chosen-id (cdr (split-string (completing-read "Title: " ids) " -$- " t)))
		 (url (concat "https://www.youtube.com/watch?v=" (car chosen-id))))
	(mf/mpv url)))

(provide 'mf-functions)
;;; mf-functions.el ends here
