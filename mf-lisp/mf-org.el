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
  (eval-after-load 'org
	'(progn
	   (message "Loaded org-mode")
	   (require 'org-tempo)
	   (setq org-archive-location "~/Documents/Personal/agenda.org::* Archive"
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
				"** TODO %^{Action}\nSCHEDULED: %^t\n%?")
			   ("t" "Teaching")
			   ("tt" "Teaching General" entry
				(file+headline "~/Documents/Personal/Notes/20210913174909-teaching.org" "Agenda")
				"** TODO %^{Action}\n%?\n%a")
			   ("tb" "CBI" entry
				(file+headline "~/Documents/Personal/Notes/20210921201618-cbi2021.org" "Agenda")
				"** TODO %^{Action}\n%?\n%a")
			   ("tp" "CPA" entry
				(file+headline "~/Documents/Personal/Notes/20210921201649-cpa2021.org" "Agenda")
				"** TODO %^{Action}\n%?\n%a")
			   ("u" "Uni" entry
				(file+headline "~/Documents/Personal/agenda.org" "Uni")
				"*** TODO %^{Action}\n%?\n%a"))
			 org-todo-keywords
			 '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "NO(n)"))
			 org-todo-keyword-faces
			 '(("TODO" . org-todo)
			   ("WAITING" . (:inherit org-todo :foreground "#b0b0b0"))
			   ("DONE" . org-done)
			   ("NO" . error))
			 org-use-fast-todo-selection 'expert
			 org-agenda-custom-commands
			 '(("a" "Agenda for current week or day"
				((agenda "")
				 (todo))))
			 org-confirm-babel-evaluate nil
			 org-html-doctype "html4-strict"
			 org-html-head ""
			 org-html-head-extra ""
			 org-html-head-include-default-style nil
			 org-html-head-include-scripts nil
			 org-html-preamble nil
			 org-html-postamble nil
			 org-html-use-infojs nil)
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
	   ;; I like my display-buffer-alist and would like it to be respected
	   (defun mf/switch-to-buffer-other-window (orig-func &rest args)
		 (apply #'switch-to-buffer-other-window args))
	   (advice-add 'org-agenda-get-restriction-and-command :around #'mf/org-agenda-get-restriction-and-command)
	   (advice-add 'org-switch-to-buffer-other-window :around #'mf/switch-to-buffer-other-window))))

(setq diary-file (file-truename "~/Documents/Personal/diary"))

;; Org tree slide
(mf/install org-tree-slide)
(mf/autoload-func
 :func org-tree-slide-mode
 :file "org-tree-slide")
(eval-after-load 'org
  '(progn
	 (define-key org-mode-map (kbd "C-c p") #'org-tree-slide-mode)
	 (eval-after-load 'org-tree-slide
	   '(progn
		  (setq org-tree-slide-header nil)
		  (define-key org-tree-slide-mode-map (kbd "n") #'org-tree-slide-move-next-tree)
		  (define-key org-tree-slide-mode-map (kbd "p") #'org-tree-slide-move-previous-tree)
		  (define-key org-tree-slide-mode-map (kbd "RET") #'org-tree-slide-move-next-tree)
		  (define-key org-tree-slide-mode-map (kbd "+") #'mf/big-font)
		  (define-key org-tree-slide-mode-map (kbd "-") #'(lambda() (interactive) (mf/big-font t)))))))
;; Org roam
(eval-after-load 'org
  '(progn
	 (mf/install org-roam)
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
	 (advice-add 'org-agenda :after #'(lambda(&rest r) (require 'org-roam)))  ; I use some org-roam nodes as agenda buffers so org-agenda needs org-roam to be loaded
	 (eval-after-load 'org-roam
	   '(progn
		  (message "Loaded org-roam")
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
			(setq org-agenda-files (mf/org-roam-list-notes-by-tag "Agenda"))
			(add-to-list 'org-agenda-files "~/Documents/Personal/agenda.org"))
		  (mf/org-roam-refresh-agenda-files)

		  (defun mf/org-roam-teaching-finalize-hook()
			"Adds the captured project file to `org-agenda-files' if the
  capture was not aborted"
			(remove-hook 'org-capture-after-finalize-hook 'mf/org-roam-teaching-finalize-hook)
			(unless org-note-abort
			  (with-current-buffer (org-capture-get :buffer)
				(add-to-list 'org-agenda-files (buffer-file-name)))))

		  (defun mf/org-roam-find-teaching()
			(interactive)
			(add-hook 'org-capture-after 'mf/org-roam-teaching-finalize-hook)
			(org-roam-node-find
			 nil
			 nil
			 (mf/org-roam-filter-by-tag "Teaching")
			 :templates
			 '(("t" "Teaching" plain "* Agenda\n** TODO %^{Action}\n%?"
				:if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: Teaching")
				:unnarrowed t))))))))

(provide 'mf-org)
;;; mf-org.el ends here
