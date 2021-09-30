;;; mf-hacks.el --- Ugly solutions to problems -*- lexical-binding: t -*-
  ;;; Code:
(eval-after-load 'org-agenda
  '(defun mf/org-agenda-get-restriction-and-command (orig-func prefix-descriptions)
	 "The user interface for selecting an agenda command. Fixed when the agenda buffer is displayed in a side window. "
	 (catch 'exit
	   (let* ((bfn (buffer-file-name (buffer-base-buffer)))
			  (restrict-ok (and bfn (derived-mode-p 'org-mode)))
			  (region-p (org-region-active-p))
			  (custom org-agenda-custom-commands)
			  (selstring "")
			  restriction second-time
			  c entry key type match prefixes rmheader header-end custom1 desc
			  line lines left right n n1)
		 (save-window-excursion
		   ;; (delete-other-windows) ; Fix showing agenda in side window
		   (switch-to-buffer-other-window " *Agenda Commands*")
		   (erase-buffer)
		   (insert (eval-when-compile
					 (let ((header
							(copy-sequence
							 "Press key for an agenda command:
  --------------------------------        <   Buffer, subtree/region restriction
  a   Agenda for current week or day      >   Remove restriction
  t   List of all TODO entries            e   Export agenda views
  m   Match a TAGS/PROP/TODO query        T   Entries with special TODO kwd
  s   Search for keywords                 M   Like m, but only TODO entries
  /   Multi-occur                         S   Like s, but only TODO entries
  ?   Find :FLAGGED: entries              C   Configure custom agenda commands
  *   Toggle sticky agenda views          #   List stuck projects (!=configure)
  "))
						   (start 0))
					   (while (string-match
							   "\\(^\\|   \\|(\\)\\(\\S-\\)\\( \\|=\\)"
							   header start)
						 (setq start (match-end 0))
						 (add-text-properties (match-beginning 2) (match-end 2)
											  '(face bold) header))
					   header)))
		   (setq header-end (point-marker))
		   (while t
			 (setq custom1 custom)
			 (when (eq rmheader t)
			   (org-goto-line 1)
			   (re-search-forward ":" nil t)
			   (delete-region (match-end 0) (point-at-eol))
			   (forward-char 1)
			   (looking-at "-+")
			   (delete-region (match-end 0) (point-at-eol))
			   (move-marker header-end (match-end 0)))
			 (goto-char header-end)
			 (delete-region (point) (point-max))

			 ;; Produce all the lines that describe custom commands and prefixes
			 (setq lines nil)
			 (while (setq entry (pop custom1))
			   (setq key (car entry) desc (nth 1 entry)
					 type (nth 2 entry)
					 match (nth 3 entry))
			   (if (> (length key) 1)
				   (cl-pushnew (string-to-char key) prefixes :test #'equal)
				 (setq line
					   (format
						"%-4s%-14s"
						(org-add-props (copy-sequence key)
							'(face bold))
						(cond
						 ((string-match "\\S-" desc) desc)
						 ((eq type 'agenda) "Agenda for current week or day")
						 ((eq type 'agenda*) "Appointments for current week or day")
						 ((eq type 'alltodo) "List of all TODO entries")
						 ((eq type 'search) "Word search")
						 ((eq type 'stuck) "List of stuck projects")
						 ((eq type 'todo) "TODO keyword")
						 ((eq type 'tags) "Tags query")
						 ((eq type 'tags-todo) "Tags (TODO)")
						 ((eq type 'tags-tree) "Tags tree")
						 ((eq type 'todo-tree) "TODO kwd tree")
						 ((eq type 'occur-tree) "Occur tree")
						 ((functionp type) (if (symbolp type)
											   (symbol-name type)
											 "Lambda expression"))
						 (t "???"))))
				 (cond
				  ((not (org-string-nw-p match)) nil)
				  (org-agenda-menu-show-matcher
				   (setq line
						 (concat line ": "
								 (cond
								  ((stringp match)
								   (propertize match 'face 'org-warning))
								  ((listp type)
								   (format "set of %d commands" (length type)))))))
				  (t
				   (org-add-props line nil 'help-echo (concat "Matcher: " match))))
				 (push line lines)))
			 (setq lines (nreverse lines))
			 (when prefixes
			   (mapc (lambda (x)
					   (push
						(format "%s   %s"
								(org-add-props (char-to-string x)
									nil 'face 'bold)
								(or (cdr (assoc (concat selstring
														(char-to-string x))
												prefix-descriptions))
									"Prefix key"))
						lines))
					 prefixes))

			 ;; Check if we should display in two columns
			 (if org-agenda-menu-two-columns
				 (progn
				   (setq n (length lines)
						 n1 (+ (/ n 2) (mod n 2))
						 right (nthcdr n1 lines)
						 left (copy-sequence lines))
				   (setcdr (nthcdr (1- n1) left) nil))
			   (setq left lines right nil))
			 (while left
			   (insert "\n" (pop left))
			   (when right
				 (if (< (current-column) 40)
					 (move-to-column 40 t)
				   (insert "   "))
				 (insert (pop right))))

			 ;; Make the window the right size
			 (goto-char (point-min))
			 (if second-time
				 (when (not (pos-visible-in-window-p (point-max)))
				   (org-fit-window-to-buffer))
			   (setq second-time t)
			   (org-fit-window-to-buffer))

			 ;; Hint to navigation if window too small for all information
			 (setq header-line-format
				   (when (not (pos-visible-in-window-p (point-max)))
					 "Use C-v, M-v, C-n or C-p to navigate."))

			 ;; Ask for selection
			 (cl-loop
			  do (progn
				   (message "Press key for agenda command%s:"
							(if (or restrict-ok org-agenda-overriding-restriction)
								(if org-agenda-overriding-restriction
									" (restriction lock active)"
								  (if restriction
									  (format " (restricted to %s)" restriction)
									" (unrestricted)"))
							  ""))
				   (setq c (read-char-exclusive)))
			  until (not (memq c '(14 16 22 134217846)))
			  do (org-scroll c))

			 (message "")
			 (cond
			  ((assoc (char-to-string c) custom)
			   (setq selstring (concat selstring (char-to-string c)))
			   (throw 'exit (cons selstring restriction)))
			  ((memq c prefixes)
			   (setq selstring (concat selstring (char-to-string c))
					 prefixes nil
					 rmheader (or rmheader t)
					 custom (delq nil (mapcar
									   (lambda (x)
										 (if (or (= (length (car x)) 1)
												 (/= (string-to-char (car x)) c))
											 nil
										   (cons (substring (car x) 1) (cdr x))))
									   custom))))
			  ((eq c ?*)
			   (call-interactively 'org-toggle-sticky-agenda)
			   (sit-for 2))
			  ((and (not restrict-ok) (memq c '(?1 ?0 ?<)))
			   (message "Restriction is only possible in Org buffers")
			   (ding) (sit-for 1))
			  ((eq c ?1)
			   (org-agenda-remove-restriction-lock 'noupdate)
			   (setq restriction 'buffer))
			  ((eq c ?0)
			   (org-agenda-remove-restriction-lock 'noupdate)
			   (setq restriction (if region-p 'region 'subtree)))
			  ((eq c ?<)
			   (org-agenda-remove-restriction-lock 'noupdate)
			   (setq restriction
					 (cond
					  ((eq restriction 'buffer)
					   (if region-p 'region 'subtree))
					  ((memq restriction '(subtree region))
					   nil)
					  (t 'buffer))))
			  ((eq c ?>)
			   (org-agenda-remove-restriction-lock 'noupdate)
			   (setq restriction nil))
			  ((and (equal selstring "") (memq c '(?s ?S ?a ?t ?m ?L ?C ?e ?T ?M ?# ?! ?/ ??)))
			   (throw 'exit (cons (setq selstring (char-to-string c)) restriction)))
			  ((and (> (length selstring) 0) (eq c ?\d))
			   (delete-window)
			   (org-agenda-get-restriction-and-command prefix-descriptions))

			  ((equal c ?q) (user-error "Abort"))
			  (t (user-error "Invalid key %c" c)))))))))

(eval-after-load 'ox
  '(defun org-export--dispatch-ui (options first-key expertp)
	 "Handle interface for `org-export-dispatch'.

OPTIONS is a list containing current interactive options set for
export.  It can contain any of the following symbols:
`body'    toggles a body-only export
`subtree' restricts export to current subtree
`visible' restricts export to visible part of buffer.
`force'   force publishing files.
`async'   use asynchronous export process

FIRST-KEY is the key pressed to select the first level menu.  It
is nil when this menu hasn't been selected yet.

EXPERTP, when non-nil, triggers expert UI.  In that case, no help
buffer is provided, but indications about currently active
options are given in the prompt.  Moreover, [?] allows switching
back to standard interface."
	 (let* ((fontify-key
			 (lambda (key &optional access-key)
			   ;; Fontify KEY string.  Optional argument ACCESS-KEY, when
			   ;; non-nil is the required first-level key to activate
			   ;; KEY.  When its value is t, activate KEY independently
			   ;; on the first key, if any.  A nil value means KEY will
			   ;; only be activated at first level.
			   (if (or (eq access-key t) (eq access-key first-key))
				   (propertize key 'face 'org-warning)
				 key)))
			(fontify-value
			 (lambda (value)
			   ;; Fontify VALUE string.
			   (propertize value 'face 'font-lock-variable-name-face)))
			;; Prepare menu entries by extracting them from registered
			;; back-ends and sorting them by access key and by ordinal,
			;; if any.
			(entries
			 (sort (sort (delq nil
							   (mapcar #'org-export-backend-menu
									   org-export-registered-backends))
						 (lambda (a b)
						   (let ((key-a (nth 1 a))
								 (key-b (nth 1 b)))
							 (cond ((and (numberp key-a) (numberp key-b))
									(< key-a key-b))
								   ((numberp key-b) t)))))
				   'car-less-than-car))
			;; Compute a list of allowed keys based on the first key
			;; pressed, if any.  Some keys
			;; (?^B, ?^V, ?^S, ?^F, ?^A, ?&, ?# and ?q) are always
			;; available.
			(allowed-keys
			 (nconc (list 2 22 19 6 1)
					(if (not first-key) (org-uniquify (mapcar 'car entries))
					  (let (sub-menu)
						(dolist (entry entries (sort (mapcar 'car sub-menu) '<))
						  (when (eq (car entry) first-key)
							(setq sub-menu (append (nth 2 entry) sub-menu))))))
					(cond ((eq first-key ?P) (list ?f ?p ?x ?a))
						  ((not first-key) (list ?P)))
					(list ?& ?#)
					(when expertp (list ??))
					(list ?q)))
			;; Build the help menu for standard UI.
			(help
			 (unless expertp
			   (concat
				;; Options are hard-coded.
				(format "[%s] Body only:    %s           [%s] Visible only:     %s
\[%s] Export scope: %s       [%s] Force publishing: %s
\[%s] Async export: %s\n\n"
						(funcall fontify-key "C-b" t)
						(funcall fontify-value
								 (if (memq 'body options) "On " "Off"))
						(funcall fontify-key "C-v" t)
						(funcall fontify-value
								 (if (memq 'visible options) "On " "Off"))
						(funcall fontify-key "C-s" t)
						(funcall fontify-value
								 (if (memq 'subtree options) "Subtree" "Buffer "))
						(funcall fontify-key "C-f" t)
						(funcall fontify-value
								 (if (memq 'force options) "On " "Off"))
						(funcall fontify-key "C-a" t)
						(funcall fontify-value
								 (if (memq 'async options) "On " "Off")))
				;; Display registered back-end entries.  When a key
				;; appears for the second time, do not create another
				;; entry, but append its sub-menu to existing menu.
				(let (last-key)
				  (mapconcat
				   (lambda (entry)
					 (let ((top-key (car entry)))
					   (concat
						(unless (eq top-key last-key)
						  (setq last-key top-key)
						  (format "\n[%s] %s\n"
								  (funcall fontify-key (char-to-string top-key))
								  (nth 1 entry)))
						(let ((sub-menu (nth 2 entry)))
						  (unless (functionp sub-menu)
							;; Split sub-menu into two columns.
							(let ((index -1))
							  (concat
							   (mapconcat
								(lambda (sub-entry)
								  (cl-incf index)
								  (format
								   (if (zerop (mod index 2)) "    [%s] %-26s"
									 "[%s] %s\n")
								   (funcall fontify-key
											(char-to-string (car sub-entry))
											top-key)
								   (nth 1 sub-entry)))
								sub-menu "")
							   (when (zerop (mod index 2)) "\n"))))))))
				   entries ""))
				;; Publishing menu is hard-coded.
				(format "\n[%s] Publish
	[%s] Current file              [%s] Current project
	[%s] Choose project            [%s] All projects\n\n\n"
						(funcall fontify-key "P")
						(funcall fontify-key "f" ?P)
						(funcall fontify-key "p" ?P)
						(funcall fontify-key "x" ?P)
						(funcall fontify-key "a" ?P))
				(format "[%s] Export stack                  [%s] Insert template\n"
						(funcall fontify-key "&" t)
						(funcall fontify-key "#" t))
				(format "[%s] %s"
						(funcall fontify-key "q" t)
						(if first-key "Main menu" "Exit")))))
			;; Build prompts for both standard and expert UI.
			(standard-prompt (unless expertp "Export command: "))
			(expert-prompt
			 (when expertp
			   (format
				"Export command (C-%s%s%s%s%s) [%s]: "
				(if (memq 'body options) (funcall fontify-key "b" t) "b")
				(if (memq 'visible options) (funcall fontify-key "v" t) "v")
				(if (memq 'subtree options) (funcall fontify-key "s" t) "s")
				(if (memq 'force options) (funcall fontify-key "f" t) "f")
				(if (memq 'async options) (funcall fontify-key "a" t) "a")
				(mapconcat (lambda (k)
							 ;; Strip control characters.
							 (unless (< k 27) (char-to-string k)))
						   allowed-keys "")))))
	   ;; With expert UI, just read key with a fancy prompt.  In standard
	   ;; UI, display an intrusive help buffer.
	   (if expertp
		   (org-export--dispatch-action
			expert-prompt allowed-keys entries options first-key expertp)
		 ;; At first call, create frame layout in order to display menu.
		 (unless (get-buffer "*Org Export Dispatcher*")
		   ;; (delete-other-windows)
		   (org-switch-to-buffer-other-window
			(get-buffer-create "*Org Export Dispatcher*"))
		   (setq cursor-type nil
				 header-line-format "Use SPC, DEL, C-n or C-p to navigate.")
		   ;; Make sure that invisible cursor will not highlight square
		   ;; brackets.
		   (set-syntax-table (copy-syntax-table))
		   (modify-syntax-entry ?\[ "w"))
		 ;; At this point, the buffer containing the menu exists and is
		 ;; visible in the current window.  So, refresh it.
		 (with-current-buffer "*Org Export Dispatcher*"
		   ;; Refresh help.  Maintain display continuity by re-visiting
		   ;; previous window position.
		   (let ((pt (point))
				 (wstart (window-start)))
			 (erase-buffer)
			 (insert help)
			 (goto-char pt)
			 (set-window-start nil wstart)))
		 (org-fit-window-to-buffer)
		 (org-export--dispatch-action
		  standard-prompt allowed-keys entries options first-key expertp)))))

(provide 'mf-hacks)
  ;;; mf-hacks.el ends here
