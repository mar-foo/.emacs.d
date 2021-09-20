;;; mf-org.el --- My configuration for Org mode and Org Roam -*- lexical-binding: t -*-
;;; Code:
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
			'("~/Documents/Personal/agenda.org" "~/Documents/University/orario-2122.org")
			org-archive-location "~/Documents/Personal/agenda.org::* Archive"
			org-agenda-window-setup 'other-window
			org-agenda-restore-windows-after-quit nil
			org-agenda-skip-archived-trees t
			org-agenda-start-with-log-mode t
			org-log-done 'time
			org-log-into-drawer t
			org-capture-templates
			'(("a" "Agenda" entry
			   (file+headline "~/Documents/Personal/agenda.org" "Agenda")
			   "** TODO %^{Action}\nSCHEDULED:%^T\n" :time-prompt t)
			  ("t" "Teaching" entry
			   (file+headline "~/Documents/Personal/agenda.org" "Teaching")
			   "*** TODO %^{Action}\n:CATEGORY: teaching\n%?")
			  ("u" "Uni" entry
			   (file+headline "~/Documents/Personal/agenda.org" "Uni")
			   "*** TODO %^{Action}%?"))
			org-todo-keywords
			'((sequence "TODO(t)" "|" "DONE(d)" "NO(n)"))
			org-todo-keyword-faces
			'(("TODO" . org-todo)
			  ("DONE" . org-done)
			  ("NO" . error))
			org-agenda-custom-commands
			'(("a" "Agenda for current week or day"
			   ((agenda "")
				(todo)))))
	  ;; I like my display-buffer-alist and would like it to be respected
	  (defun my-switch-to-buffer-other-window (orig-func &rest args)
		(apply #'switch-to-buffer-other-window args))
	  (advice-add 'org-switch-to-buffer-other-window :around #'my-switch-to-buffer-other-window))))

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
		  org-roam-v2-ack t))

(provide 'mf-org)
;;; mf-org.el ends here
