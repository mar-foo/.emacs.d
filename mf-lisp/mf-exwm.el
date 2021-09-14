;;; mf-exwm.el --- EXWM configuration -*- lexical-binding: t -*-
;;; Code:
(display-battery-mode)

(defun mf/exwm-update-class()
  (exwm-workspace-rename-buffer exwm-class-name))

(defun mf/exwm-handle-mpv()
  (if
	  (> (window-body-width) 100)
	  (split-window-right)))

(defun mf/manage-window-by-class()
  (pcase exwm-class-name
	("Firefox" (exwm-workspace-move-window 3))
	("mpv" (mf/exwm-handle-mpv))))

(progn
  (mf/install exwm)
  (require 'exwm-config)
  (setq exwm-workspace-number 5
		exwm-input-prefix-keys
		'(?\C-x
		  ?\C-c
		  ?\C-u
		  ?\M-x
		  ?\C-.
		  ?\M-:)
		exwm-input-global-keys
		`((,(kbd "s-r") . (lambda (command)
							(interactive (list (read-shell-command "$ ")))
							(start-process-shell-command command nil command)))
		  (,(kbd "s-C-r") . exwm-reset)
		  (,(kbd "s-RET") . (lambda ()
							  (start-process-shell-command "st" nil "st")))
		  (,(kbd "s-)") . (lambda () (interactive) (exwm-workspace-move-window 0)))
		  (,(kbd "s-!") . (lambda () (interactive) (exwm-workspace-move-window 1)))
		  (,(kbd "s-@") . (lambda () (interactive) (exwm-workspace-move-window 2)))
		  (,(kbd "s-#") . (lambda () (interactive) (exwm-workspace-move-window 3)))
		  (,(kbd "s-$") . (lambda () (interactive) (exwm-workspace-move-window 4)))
		  ,@(mapcar (lambda (i)
					  `(,(kbd (format "s-%d" i)) .
						(lambda ()
						  (interactive)
						  (exwm-workspace-switch-create ,i))))
					(number-sequence 0 4)))
		exwm-input-simulation-keys
		'((,(kbd "C-b") . [left])
		  (,(kbd "C-f") . [right])
		  (,(kbd "C-p") . [up])
		  (,(kbd "C-n") . [down])
		  (,(kbd "C-a") . [home])
		  (,(kbd "C-e") . [end])
		  (,(kbd "M-v") . [prior])
		  (,(kbd "C-v") . [next])
		  (,(kbd "C-d") . [delete])
		  (,(kbd "C-k") . [S-end delete]))
		  exwm-workspace-show-all-buffers t)
  (define-key exwm-mode-map (kbd "C-q") #'exwm-input-send-next-key)
  (add-hook 'exwm-update-class-hook 'mf/exwm-update-class)
  (add-hook 'exwm-manage-finish-hook #'mf/manage-window-by-class)
  (exwm-enable))

(provide 'mf-exwm)
;;; mf-exwm.el ends here
