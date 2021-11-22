;;; mf-functions.el --- My custom functions -*- lexical-binding: t -*-
;;; Code:
(require 'cl-lib)

;;;###autoload
(defun mf/alsamixer ()
  (interactive)
  (ansi-term (executable-find "alsamixer")))

;;;###autoload
(defun mf/big-font (&optional use-generic-p)
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
(defun mf/delete-sexp ()
  (interactive)
  (mark-sexp)
  (delete-active-region))

;;;###autoload
(defun mf/edit-configuration ()
  "Edit emacs configuration"
  (interactive)
  (find-file (concat user-emacs-directory "Emacs.el")))

;;;###autoload
(defun mf/executable-find-file (prog)
  "Find executable in $PATH and open it in a buffer."
  (interactive
   (list
	(read-shell-command "Program: ")))
  (find-file (executable-find prog)))

;;;###autoload
(defun mf/find-recentf ()
  "Open a recent file list"
  (interactive)
  (find-file (completing-read "Recent File: " recentf-list nil t)))

;;;###autoload
(defun mf/infos ()
  (interactive)
  (shell-command (executable-find "infos")))

;;;###autoload
(defun mf/lcm ()
  (interactive)
  (let ((curr-dir default-directory))
	(find-file "/ssh:marioforzanini@lcm.mi.infn.it:")
	(shell)))

;;;###autoload
(defun mf/quit-and-kill ()
  (interactive)
  (quit-window t))

;;;###autoload
(defun mf/reload-configuration ()
  "Reloads configuration"
  (interactive)
  (load-file (concat user-emacs-directory "init.el")))

;;;###autoload
(defun mf/select-completion-and-exit ()
  (interactive)
  (icomplete-force-complete)
  (icomplete-ret))

;;;###autoload
(defun mf/switch-theme ()
  (interactive)
  (if (string= (car custom-enabled-themes) "modus-operandi")
	  (progn
		(load-theme 'modus-vivendi t)
		(disable-theme 'modus-operandi))
	(progn
	  (load-theme 'modus-operandi)
	  (disable-theme 'modus-vivendi))))

(defun mf/yank-to-string ()
  (rotate-yank-pointer 0)
  (car kill-ring-yank-pointer))

;;;###autoload
(defun mf/mpv (&optional url)
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
