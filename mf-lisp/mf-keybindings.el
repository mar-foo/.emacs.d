;; mf-keybindings.el --- Keybinding configuration -*- lexical-binding: t -*-
  ;;; Code:
(defmacro mf/leader (key func)
  `(define-key global-map (kbd (concat "C-c " ,key)) #',func))

(mf/leader "C-SPC" execute-extended-command)
(mf/leader "d" dired)
(mf/leader "e" erc)
(mf/leader "g" magit-status)
(mf/leader "i" mf/infos)
(mf/leader "k" kill-current-buffer)
(mf/leader "m" mu4e)
(mf/leader "p" mpc)
(mf/leader "s" mf/toggle-eshell)
(mf/leader "t" mf/toggle-telega)
(mf/leader "T" mf/switch-theme)
(mf/leader "w" eww)
(mf/leader "y" mf/youtube)

;; Org
(mf/leader "c" org-capture)
(mf/leader "a" org-agenda)
(mf/leader "n f" org-roam-node-find)
(mf/leader "n i" org-roam-node-insert)
(mf/leader "n t" mf/org-roam-find-teaching)

(define-key global-map (kbd "C-x C-b") (lambda () (interactive) (ibuffer t)))
;; Quit help buffers and kill the window at the same time
(eval-after-load 'help-mode
  '(define-key help-mode-map (kbd "q") #'kill-current-buffer))

(define-key lisp-mode-map (kbd "C-M-d") #'mf/delete-sexp)

(provide 'mf-keybindings)
  ;;; mf-keybindings.el ends here
