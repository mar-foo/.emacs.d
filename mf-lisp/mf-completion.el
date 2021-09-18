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

(setq completion-styles '(partial-completion substring initials flex)
	  completion-category-overrides
	  '((file (styles initials basic))))
(mf/install vertico)
(vertico-mode 1)

(provide 'mf-completion)
;;; mf-completion.el ends here
