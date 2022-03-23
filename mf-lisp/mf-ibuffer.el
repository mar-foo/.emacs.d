;;; mf-ibuffer.el --- Configuration for iBuffer -*- lexical-binding: t -*-
;;; Code:
(eval-after-load 'ibuffer
  '(progn
     (setq ibuffer-saved-filter-groups
	   '(("default"
	      ("EXWM" (mode . exwm-mode))
	      ("Programming" (derived-mode . prog-mode))
	      ("Mail" (derived-mode . mu4e-compose-mode))
	      ("Org" (name . "^.*org$"))
	      ("Org-roam" (name . "[0-9]+-.*.org"))
	      ("Telegram" (or (mode . telega-chat-mode)
			      (name . "\\*Telega Root\\*")))
	      ("Shell" (or (mode . eshell-mode)
			   (mode . shell-mode)
			   (name . "^st-256color")))
	      ("PDF" (name . "^.*pdf$"))
	      ("IRC" (mode . erc-mode))
	      ("Man" (name . "\\*Man "))
	      ("Magit" (derived-mode . magit-mode))
	      ("Dired" (mode . dired-mode))
	      ("Web" (or (mode . eww-mode)
			 (name . "^Firefox")
			 (mode . elfeed-search-mode)))
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
		 ("EXWM" (mode . exwm-mode))
		 ("Programming" (derived-mode . prog-mode))
		 ("Mail" (derived-mode . mu4e-compose-mode))
		 ("Agenda" (or (name . "diary")
			       (name . "agenda.org")
			       (name . "\\*Org Agenda\\*")
			       (predicate -contains-p org-agenda-files (buffer-file-name))))
		 ("Org" (name . "^.*org$"))
		 ("Org-roam" (name . "[0-9]+-.*.org"))
		 ("Telegram" (or (mode . telega-chat-mode)
				 (name . "\\*Telega Root\\*")))
		 ("Shell" (or (mode . eshell-mode)
			      (mode . shell-mode)
			      (name . "^st-256color")))
		 ("PDF" (name . "^.*pdf$"))
		 ("IRC" (mode . erc-mode))
		 ("Man" (name . "\\*Man "))
		 ("Magit" (derived-mode . magit-mode))
		 ("Dired" (mode . dired-mode))
		 ("Web" (or (mode . eww-mode)
			    (name . "^Firefox")
			    (mode . elfeed-search-mode)))
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
