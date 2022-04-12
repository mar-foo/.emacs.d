;;; mf-perspective.el --- Configuration for perspective.el -*- lexical-binding: t -*-
;;; Code:
(mf/install perspective)
(persp-mode)
;; (define-key global-map (kbd "C-x b") #'persp-switch-to-buffer*)
(define-key global-map (kbd "C-x x TAB") #'persp-switch-last)
(defun mf/persp-set-buffer-ask (buffer)
  (interactive)
  (if (y-or-n-p (concat "Add " (buffer-name buffer) " to perspective?"))
      (persp-set-buffer buffer)))
(defun mf/persp-add-buffer-by-regexp (regexp &optional ask-too)
  (interactive "sAdd buffers matching this regular expression: \nP")
  (dolist (buffer (buffer-list))
    (let ((name (buffer-name buffer)))
      (when (and name (not (string-equal name ""))
		 (string-match regexp name))
	(funcall (if (not ask-too) 'mf/persp-set-buffer-ask
		   'persp-set-buffer)
		 buffer)))))
(advice-add #'shell :after #'(lambda (&rest r) (persp-set-buffer (buffer-name))))

(mf/install f)
(require 'f)
(defun mf/project-find-file-and-persp ()
  (interactive)
  (let* ((pr (project-current t))
	 (dirs (list (project-root pr))))
    (persp-switch (f-base (cdr pr)))
    (project-find-file-in (thing-at-point 'filename) dirs pr)))

; keybindings
(global-set-key (kbd "C-x p f") #'mf/project-find-file-and-persp)

(provide 'mf-perspective)
;;; mf-perspective.el ends here
