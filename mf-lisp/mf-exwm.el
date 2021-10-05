;;; mf-exwm.el --- EXWM configuration -*- lexical-binding: t -*-
;;; Code:
(display-battery-mode)

(setq display-time-default-load-average nil
	  display-time-format "%H:%M")
(display-time-mode)

(defun mf/exwm--update-class()
  (exwm-workspace-rename-buffer exwm-class-name))

(defun mf/manage--window-by-class()
  (pcase exwm-class-name
	("Firefox" (exwm-workspace-move-window 1))
	("mpv" (unless mini-modeline-mode
			 exwm-layout-toggle-mode-line))))

(defun mf/volume (action)
  (interactive)
  (start-process-shell-command "amixer" nil (concat "amixer sset Master 5%" action)))

(progn
  (mf/install exwm)
  (require 'exwm-config)
  (setq exwm-workspace-number 2
		exwm-workspace-warp-cursor t
		exwm-input-prefix-keys
		'(?\C-x
		  ?\C-c
		  ?\C-u
		  ?\M-x
		  ?\C-.
		  ?\M-:
		  ?\C-h)
		exwm-input-global-keys
		`((,(kbd "s-r") . (lambda (command)
							(interactive (list (read-shell-command "$ ")))
							(start-process-shell-command command nil command)))
		  (,(kbd "s-C-r") . exwm-reset)
		  (,(kbd "s-<return>") . (lambda ()
								   (interactive)
								   (start-process-shell-command "st" nil "st")))
		  (,(kbd "<XF86AudioRaiseVolume>") . (lambda()
											   (interactive)
											   (mf/volume "+")))
		  (,(kbd "<XF86AudioLowerVolume>") . (lambda()
											   (interactive)
											   (mf/volume "-")))
		  (,(kbd "s--") . (lambda()
							(interactive)
							(mf/volume "-")))
		  (,(kbd "s-+") . (lambda()
							(interactive)
							(mf/volume "+")))
		  (,(kbd "s-)") . (lambda () (interactive) (exwm-workspace-move-window 0)))
		  (,(kbd "s-!") . (lambda () (interactive) (exwm-workspace-move-window 1)))

		  ,@(mapcar (lambda (i)
					  `(,(kbd (format "s-%d" i)) .
						(lambda ()
						  (interactive)
						  (exwm-workspace-switch-create ,i))))
					(number-sequence 0 1)))
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
		exwm-layout-show-all-buffers t
		exwm-workspace-show-all-buffers t)
  (define-key exwm-mode-map (kbd "C-q") #'exwm-input-send-next-key)
  (add-hook 'exwm-update-class-hook 'mf/exwm--update-class)
  (add-hook 'exwm-manage-finish-hook #'mf/manage--window-by-class)
  (add-hook 'exwm-floating-setup-hook #'exwm-layout-toggle-mode-line)
  (add-hook 'exwm-init-hook
			(lambda ()
			  (exwm-randr-refresh)
			  (exwm-workspace-switch 1)
			  (switch-to-buffer "*scratch*")))
  (require 'exwm-randr)
  (setq exwm-randr-workspace-output-plist '(1 "VGA1"))
  (add-hook 'exwm-randr-screen-change-hook
			(lambda()
			  (start-process-shell-command
			   "xrandr" nil "xrandr --output VGA1 --left-of LVDS1 --auto")))
  (exwm-randr-enable)
  (exwm-enable))

(provide 'mf-exwm)
	;;; mf-exwm.el ends here
