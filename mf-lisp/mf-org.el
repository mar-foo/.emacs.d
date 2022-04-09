;;; mf-org.el --- My configuration for Org mode and Org Roam -*- lexical-binding: t -*-
;;; Code:
;; Org mode
(progn
  (mf/autoload-func
   :func org-mode
   :file "org-mode")
  (mf/autoload-func
   :func org-capture
   :file "org-mode")
  (mf/autoload-func
   :func org-agenda
   :file "org-mode")
  (mf/install org-edna)
  (setq org-directory (file-truename "~/doc/pers/org/"))
  (eval-after-load 'org
    '(progn
       (message "Loaded org-mode")
       (require 'org-tempo)
       (setq org-archive-location (concat org-directory "projects.org::* Past")
	     org-agenda-window-setup 'other-window
	     org-agenda-restore-windows-after-quit nil
	     org-agenda-sticky nil
	     org-agenda-skip-archived-trees t
	     org-agenda-start-with-log-mode t
	     org-agenda-include-diary t
	     org-agenda-todo-list-sublevels nil
	     org-log-done 'time
	     org-log-into-drawer t
	     org-todo-keywords
	     '((sequence "TODO(t)" "NEXT(n)" "WAITING(w)" "|" "DONE(d)" "NO(N)"))
	     org-todo-keyword-faces
	     '(("TODO" . org-todo)
	       ("WAITING" . (:inherit org-todo :foreground "#b0b0b0"))
	       ("DONE" . org-done)
	       ("NO" . error))
	     org-use-fast-todo-selection 'expert
	     org-agenda-hide-tags-regexp "."
	     org-agenda-prefix-format
	     '((agenda . "%i %-12:c%?-12t% s")
	       (todo   . "")
	       (tags   . "%i %-12:c")
	       (search . "%i %-12:c"))
	     org-agenda-files (mapcar #'(lambda (name)
					  (concat org-directory name))
				      '("inbox.org"
					"agenda.org"
					"projects.org"))
	     org-capture-templates
	     `(("a" "Agenda" entry
		(file+headline "agenda.org" "Agenda")
		"** TODO %?\n/Entered on/ %U")
	       ("i" "Inbox" entry
		(file "inbox.org")
		"* TODO %?\n/Entered on/ %U")
	       ("@" "Inbox [mu4e]" entry
		(file "inbox.org")
		"* TODO Process \"%a\" %?\n/Entered on/ %U")
	       ("m" "Meeting" entry
		(file+headline "agenda.org" "Future")
		"* %? :meeting:\n<%<%Y-%m-%d %a %H:%M>>")
	       ("n" "Notes" entry
		(file "notes.org")
		"* Note (%a)\n/Entered on/ %U\n\n%?"))
	     org-agenda-custom-commands
	     '(("a" "Agenda for current week or day"
		((agenda "")
		 (todo)))
	       ("g" "Get Things Done (GTD)"
		((agenda ""
			 ((org-agenda-skip-function
			   '(org-agenda-skip-entry-if 'deadline))
			  (org-deadline-warning-days 0)))
		 (todo "NEXT"
		       ((org-agenda-skip-function
			 '(org-agenda-skip-entry-if 'deadline))
			(org-agenda-prefix-format " %i %-12:c [%e] ")
			(org-agenda-overriding-header "\nTasks\n")))
		 (agenda ""
			 ((org-agenda-entry-types '(:deadline))
			  (org-agenda-format-date "")
			  (org-deadline-warning-days 7)
			  (org-agenda-skip-function
			   '(org-agenda-skip-entry-if 'notregexp "\\* NEXT"))
			  (org-agenda-overriding-header "\nDeadlines")))
		 (tags-todo "inbox"
			    ((org-agenda-prefix-format " %?-12t% s")
			     (org-agenda-overriding-header "\nInbox\n")))
		 (tags "CLOSED=\"<today>\""
		       ((org-agenda-overriding-header "\nCompleted today\n"))))))
	     org-refile-targets
	     '(("projects.org" :regexp . "\\(?:\\(?:Note\\|Task\\)s\\)"))
	     org-refile-use-outline-path 'file
	     org-outline-path-complete-in-steps nil
	     org-confirm-babel-evaluate nil
	     org-html-doctype "html4-strict"
	     org-html-head ""
	     org-html-head-extra ""
	     org-html-head-include-default-style nil
	     org-html-head-include-scripts nil
	     org-html-preamble nil
	     org-html-postamble nil
	     org-html-use-infojs nil)
       (eval-after-load 'org-agenda
	 '(org-edna-mode))
       (add-to-list 'org-structure-template-alist '("sh" . "src shell"))
       (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
       (add-to-list 'org-structure-template-alist '("go" . "src go"))
       (add-to-list 'org-structure-template-alist '("sc" . "src c"))
       (add-to-list 'org-structure-template-alist '("scp" . "src c++"))
       (add-to-list 'org-structure-template-alist '("hs" . "src haskell"))
       (mf/install ob-go)
       (org-babel-do-load-languages
	'org-babel-load-languages
	'((emacs-lisp . t)
	  (shell . t)
	  (awk . t)
	  (go . t)
	  (C . t)))
       (defun log-todo-next-creation-date (&rest ignore)
	 "Log NEXT creation time in the property drawer under the key 'ACTIVATED'.
https://github.com/rougier/emacs-gtd#Activating-tasks"
	 (when (and (string= (org-get-todo-state) "NEXT")
		    (not (org-entry-get nil "ACTIVATED")))
	   (org-entry-put nil "ACTIVATED" (format-time-string "[%d-%m-%Y]"))))
       (add-hook 'org-after-todo-state-change-hook #'log-todo-next-creation-date)
       ;; I like my display-buffer-alist and would like it to be respected
       (defun mf/switch-to-buffer-other-window (orig-func &rest args)
	 (apply #'switch-to-buffer-other-window args))
       (advice-add 'org-agenda-get-restriction-and-command :around #'mf/org-agenda-get-restriction-and-command)
       (advice-add 'org-switch-to-buffer-other-window :around #'mf/switch-to-buffer-other-window))))


(eval-after-load 'org
  '(progn
     (mf/install org-roam)
     (mf/install consult-org-roam)
     (mf/autoload-func
      :func org-roam-find-node
      :file "org-roam")
     (mf/autoload-func
      :func org-roam-insert-node
      :file "org-roam")
     (mf/autoload-func
      :func org-roam-capture
      :file "org-roam")
     (mf/autoload-func
      :func org-roam-node-list
      :file "org-roam")
     (mf/autoload-func
      :func org-roam-db-autosync-mode
      :file "org-roam")
     (eval-after-load 'org-roam
       '(progn
	  (message "Loaded org-roam")
	  (setq org-roam-directory (file-truename "~/doc/pers/org/Notes/")
		org-roam-v2-ack t)
	  (add-hook 'org-roam-mode-hook 'org-roam-db-autosync-mode)))))
(setq diary-file (file-truename "~/doc/pers/diary"))

(provide 'mf-org)
;;; mf-org.el ends here
