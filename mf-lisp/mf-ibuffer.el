;;; mf-ibuffer.el --- Configuration for iBuffer -*- lexical-binding: t -*-
;;; Code:
(eval-after-load 'ibuffer
  '(progn
	 (setq ibuffer-saved-filter-groups
		   '(("default"
			  ("Exwm" (mode . exwm-mode))
			  ("Programming" (derived-mode . prog-mode))
			  ("Mail" (derived-mode . mu4e-compose-mode))
			  ("Org" (name . "^.*org$"))
			  ("Org-roam" (name . "[0-9]+-.*.org"))
			  ("Shell" (or (mode . eshell-mode) (name . "^st-256color")))
			  ("IRC" (mode . erc-mode))
			  ("Magit" (derived-mode . magit-mode))
			  ("Dired" (mode . dired-mode))
			  ("Web" (or (mode . eww-mode) (name . "^Firefox")))
			  ("Emacs" (or (name . "\\*scratch\\*")
						   (name . "\\*Messages\\*")
						   (name . "\\*dashboard\\*")
						   (name . "\\*Completions\\*")
						   (name . "\\*Warnings\\*")
						   (name . "\\*Backtrace\\*")))
			  ("Compilation" (derived-mode . compilation-mode))))

		   ibuffer-show-empty-filter-groups nil
		   ibuffer-expert t)
	 (eval-after-load 'org-agenda
	   '(setq ibuffer-saved-filter-groups
			  '(("default"
				 ("Exwm" (mode . exwm-mode))
				 ("Programming" (derived-mode . prog-mode))
				 ("Mail" (derived-mode . mu4e-compose-mode))
				 ("Agenda" (or (name . "diary")
							   (name . "agenda.org")
							   (predicate -contains-p org-agenda-files (buffer-file-name))))
				 ("Org" (name . "^.*org$"))
				 ("Org-roam" (name . "[0-9]+-.*.org"))
				 ("Shell" (or (mode . eshell-mode) (name . "^st-256color")))
				 ("IRC" (mode . erc-mode))
				 ("Magit" (derived-mode . magit-mode))
				 ("Dired" (mode . dired-mode))
				 ("Web" (or (mode . eww-mode) (name . "^Firefox")))
				 ("Emacs" (or (name . "\\*scratch\\*")
							  (name . "\\*Messages\\*")
							  (name . "\\*dashboard\\*")
							  (name . "\\*Completions\\*")
							  (name . "\\*Warnings\\*")
							  (name . "\\*Backtrace\\*")))
				 ("Compilation" (derived-mode . compilation-mode))))))
	   (add-hook 'ibuffer-mode-hook
				 (lambda ()
				   (ibuffer-auto-mode 1)
				   (ibuffer-switch-to-saved-filter-groups "default")))))

  (provide 'mf-ibuffer)
;;; mf-ibuffer.el ends here
