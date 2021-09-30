;; mf-keybindings.el --- Keybinding configuration -*- lexical-binding: t -*-
;;; Code:
(defmacro mf/leader (key func)
  `(define-key global-map (kbd (concat "C-. " ,key)) #',func))

(mf/leader "C-." execute-extended-command)
(mf/leader "," comment-line)
(mf/leader "'" jump-to-register)
(mf/leader "/" eww)
(mf/leader "RET" mf/toggle-eshell)
(mf/leader "b" switch-to-buffer)
(mf/leader "c" compile)
(mf/leader "d" dired)
(mf/leader "e" erc)
(mf/leader "f" find-file)
(mf/leader "g" magit-status)
(mf/leader "i" mf/infos)
(mf/leader "j" bookmark-jump)
(mf/leader "k" kill-current-buffer)
(mf/leader "m" mu4e)
(mf/leader "o" other-window)
(mf/leader "p" mpc)
(mf/leader "r" point-to-register)
(mf/leader "s" query-replace-regexp)
(mf/leader "t" mf/switch-theme)
(mf/leader "w" window-configuration-to-register)
(mf/leader "y" mf/youtube)
(mf/leader "0" delete-window)
(mf/leader "1" delete-other-windows)
(mf/leader "2" split-window-below)
(mf/leader "3" split-window-right)
(mf/leader "4 f" find-file-other-window)
(mf/leader "4 b" switch-to-buffer-other-window)
(mf/leader "4 d" dired-other-window)
(mf/leader "4 C-f" find-file-other-window)
(mf/leader "4 C-b" switch-to-buffer-other-window)
(mf/leader "4 C-d" dired-other-window)
(mf/leader "C-b" (lambda() (interactive) (ibuffer t)))
(mf/leader "C-f" find-file)
(mf/leader "C-s" save-buffer)

;; Org
(mf/leader "." org-capture)
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
