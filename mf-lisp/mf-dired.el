;;; mf-dired.el --- My dired configuration -*- lexical-binding: t -*-
;;;Code:
(mf/install dired-filter)
(eval-after-load 'dired
  '(progn
	 (message "Loaded dired-mode")
	 (setq dired-kill-when-opening-new-dired-buffer t)
	 (add-hook 'dired-mode-hook 'dired-hide-details-mode)
	 (add-hook 'dired-mode-hook 'dired-filter-mode)
	 (define-key dired-mode-map (kbd "q") #'(lambda() (interactive (quit-window t))))))

(provide 'mf-dired)
;;; mf-dired.el ends here

(require 'mf-git)
