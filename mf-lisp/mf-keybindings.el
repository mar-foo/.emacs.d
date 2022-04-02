;; mf-keybindings.el --- Keybinding configuration -*- lexical-binding: t -*-
	;;; Code:
(defcustom mf/leader-prefix-key "C-c"
  "Prefix key for my personal keybindings")

(define-prefix-command 'mf/leader-map)

(defmacro mf/leader (key func)
  `(define-key'mf/leader-map (kbd ,key) #',func))

(mf/leader "C-SPC" execute-extended-command)
(mf/leader "d" dired)
(mf/leader "e" mf/toggle-eshell)
(mf/leader "f" fzf-git-files)
(mf/leader "g" magit-status)
(mf/leader "i" erc)
(mf/leader "k" kill-current-buffer)
(mf/leader "m" mu4e)
(mf/leader "p" bongo)
(mf/leader "s" mf/toggle-shell)
(mf/leader "S" mf/switch-theme)
(mf/leader "t" mf/toggle-telega)
(mf/leader "T" modus-themes-toggle)
(mf/leader "w" eww)
(mf/leader "y" mf/youtube)

;; Org
(mf/leader "c" org-capture)
(mf/leader "a" org-agenda)
(mf/leader "n f" org-roam-node-find)
(mf/leader "n i" org-roam-node-insert)
(mf/leader "n t" mf/org-roam-find-teaching)

(global-set-key (kbd mf/leader-prefix-key) 'mf/leader-map)

(define-key global-map (kbd "C-x C-b") (lambda () (interactive) (ibuffer t)))
(define-key global-map (kbd "C-x M-f") #'mf/executable-find-file)
;; Quit help buffers and kill the window at the same time
(eval-after-load 'help-mode
  '(define-key help-mode-map (kbd "q") #'kill-current-buffer))

(define-key lisp-mode-map (kbd "C-M-d") #'mf/delete-sexp)

(provide 'mf-keybindings)
;;; mf-keybindings.el ends here
