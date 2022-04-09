;;; mf-completion.el --- Configuration for the completion framework -*- lexical-binding: t -*-
;;; Code:
(setq tab-always-indent 'complete)
(autoload 'ffap-file-at-point "ffap")
(defun complete-path-at-point+ ()
      "Return completion data for UNIX path at point."
      (let ((fn (ffap-file-at-point))
		(fap (thing-at-point 'filename)))
	(when (and (or fn (equal "/" fap))
			       (save-excursion
				 (search-backward fap (line-beginning-position) t)))
	      (list (match-beginning 0)
			(match-end 0)
			#'completion-file-name-table :exclusive 'no))))
(add-hook 'completion-at-point-functions
		      #'complete-path-at-point+
		      'append)

(mf/install orderless)
;; (setq completion-styles '(substring partial-completion initials flex)
(setq completion-styles '(orderless)
	      completion-category-overrides
	      '((file (styles partial-completion initials basic))))

(mf/install vertico)
(eval-after-load 'minibuffer
      '(progn
	 (message "Loaded vertico")
	 (vertico-mode 1)))

(mf/install corfu)

(mf/install consult)
(global-set-key (kbd "C-x b") 'consult-buffer)
(global-set-key (kbd "C-x 4 b") 'consult-buffer-other-window)
(global-set-key (kbd "M-y") 'consult-yank-from-kill-ring)
(global-set-key (kbd "C-x r b") 'consult-bookmark)
(global-set-key (kbd "C-x p b") 'consult-project-buffer)
(eval-after-load 'consult
  '(progn
     (message "Loaded consult")
     (setq consult-narrow-key (kbd "<"))
     (define-key consult-narrow-map (vconcat consult-narrow-key "?") #'consult-narrow-help)

     ;; hide full buffer list (still available with "b")
     (consult-customize consult--source-buffer :hidden t :default nil)

     ;; set consult-workspace buffer list
     (defvar consult--source-workspace
       (list :name     "Workspace Buffers"
             :narrow   ?w
             :category 'buffer
             :state    #'consult--buffer-state
             :default  t
             :items    #'persp-current-buffer-names
	     :action   #'consult--buffer-action)
       "Set workspace buffer list for consult-buffer.")
     (push consult--source-workspace consult-buffer-sources)))

(provide 'mf-completion)
;;; mf-completion.el ends here
