;;; mf-org.el --- My configuration for Org mode and Org Roam -*- lexical-binding: t -*-
;;; Code:
(mf/install ob-go)
(progn
  (unless
	  (fboundp #'org-mode)
	(autoload #'org-mode "org-mode" nil t))
  (unless
	  (fboundp #'org-capture)
	(autoload #'org-capture "org-mode" nil t))
  (unless
	  (fboundp #'org-agenda)
	(autoload #'org-agenda "org-mode" nil t))
  (eval-after-load 'org-mode
	(progn
	  (setq org-agenda-files
			'("~/Documents/Personal/agenda.org" "~/Documents/Personal/Notes/20210913174909-teaching.org")
			org-archive-location "~/Documents/Personal/agenda.org::* Archive"
			org-agenda-window-setup 'other-window
			org-agenda-restore-windows-after-quit nil
			org-agenda-sticky nil
			org-agenda-skip-archived-trees t
			org-agenda-start-with-log-mode t
			org-agenda-include-diary t
			org-log-done 'time
			org-log-into-drawer t
			org-capture-templates
			'(("a" "Agenda" entry
			   (file+headline "~/Documents/Personal/agenda.org" "Agenda")
			   "** TODO %^{Action}\nSCHEDULED:%^T\n" :time-prompt t)
			  ("t" "Teaching")
			  ("tt" "Teaching General" entry
			   (file+headline "~/Documents/Personal/Notes/20210913174909-teaching.org" "Agenda")
			   "** TODO %^{Action}\n%?")
			  ("tb" "CBI" entry
			   (file+headline "~/Documents/Personal/Notes/20210921201618-cbi2021.org" "Agenda")
			   "** TODO %^{Action}\n%?")
			  ("tp" "CPA" entry
			   (file+headline "~/Documents/Personal/Notes/20210921201649-cpa2021.org" "Agenda")
			   "** TODO %^{Action}\n%?")
			  ("u" "Uni" entry
			   (file+headline "~/Documents/Personal/agenda.org" "Uni")
			   "*** TODO %^{Action}%?"))
			org-todo-keywords
			'((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "NO(n)"))
			org-todo-keyword-faces
			'(("TODO" . org-todo)
			  ("WAITING" . (:inherit org-todo :foreground "#b0b0b0"))
			  ("DONE" . org-done)
			  ("NO" . error))
			org-agenda-custom-commands
			'(("a" "Agenda for current week or day"
			   ((agenda "")
				(todo))))
			org-confirm-babel-evaluate nil)
	  (org-babel-do-load-languages
	   'org-babel-load-languages
	   '((emacs-lisp . t)
		 (shell . t)
		 (awk . t)
		 (go . t)))
	  ;; I like my display-buffer-alist and would like it to be respected
	  (defun my-switch-to-buffer-other-window (orig-func &rest args)
		(apply #'switch-to-buffer-other-window args))
	  (advice-add 'org-switch-to-buffer-other-window :around #'my-switch-to-buffer-other-window))))

(setq diary-file (file-truename "~/Documents/Personal/diary"))

(progn
  (mf/install org-roam)
  (unless
	  (fboundp 'org-roam-find-node)
	(autoload #'org-roam-find-node "org-roam-find-node" nil t))
  (unless
	  (fboundp 'org-roam-insert-node)
	(autoload #'org-roam-insert-node "org-roam-insert-node" nil t))
  (unless
	  (fboundp 'org-roam-capture)
	(autoload #'org-roam-capure "org-roam-capture" nil t))
  (define-key global-map (kbd "C-. o") #'org-roam-capture)
  (define-key global-map (kbd "C-. n f") #'org-roam-node-find)
  (define-key global-map (kbd "C-. n i") #'org-roam-node-insert)
  (setq org-roam-directory (file-truename "~/Documents/Personal/Notes/")
		org-roam-v2-ack t)
  (add-hook 'org-roam-mode-hook 'org-roam-db-autosync-mode)
  (defun mf/org-roam-filter-by-tag (tag-name)
	(lambda (node)
	  (member tag-name (org-roam-node-tags node))))
  (defun mf/org-roam-list-notes-by-tag (tag-name)
	(mapcar #'org-roam-node-file
			(seq-filter
			 (mf/org-roam-filter-by-tag tag-name)
			 (org-roam-node-list))))
  (defun mf/org-roam-refresh-agenda-files()
	(interactive)
	(setq org-agenda-files (mf/org-roam-list-notes-by-tag "Teaching"))
	(add-to-list 'org-agenda-files "~/Documents/Personal/agenda.org")))
(provide 'mf-org)
;;; mf-org.el ends here
