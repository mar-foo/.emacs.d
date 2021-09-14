;;; mf-functions.el --- My custom functions -*- lexical-binding: t -*-
;;; Code:

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
(defun mf/find-recentf()
  "Open a recent file list"
  (interactive)
  (find-file (completing-read "Recent File: " recentf-list nil t)))

;;;###autoload
(defun mf/infos()
  (interactive)
  (shell-command (executable-find "infos")))

;;;###autoload
(defun mf/ensure-package(pack)
  (unless
	  (package-installed-p pack)
	(package-install pack)))

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

(provide 'mf-functions)
;;; mf-functions.el ends here
