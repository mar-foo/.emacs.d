;; mf-keybindings.el --- Keybinding configuration -*- lexical-binding: t -*-
;;; Code:
(defmacro mf/leader (key func)
  `(define-key global-map (kbd (concat "C-. " ,key)) #',func))
(mf/leader "e" erc)
(defmacro mf/bind (cell &rest body)
	 `(define-key ,(plist-get body :map) (kbd ,(car cell)) #',(cdr cell)))

(mf/leader "C-." execute-extended-command)
(mf/leader "," comment-line)
(mf/leader "'" jump-to-register)
(mf/leader "/" eww)
(mf/leader "b" switch-to-buffer)
(mf/leader "c" compile)
(mf/leader "d" dired)
(mf/leader "e" erc)
(mf/leader "g" magit-status)
(mf/leader "j" bookmark-jump)
(mf/leader "k" kill-current-buffer)
(mf/leader "m" mu4e)
(mf/leader "o" other-window)
(mf/leader "p" mpc)
(mf/leader "r" point-to-register)
(mf/leader "s" query-replace-regexp)
(mf/leader "w" window-configuration-to-register)
(mf/leader "1" delete-other-windows)
(mf/leader "2" split-window-below)
(mf/leader "3" split-window-right)
(mf/leader "0" delete-window)
(mf/leader "C-b" (lambda() (interactive) (ibuffer t)))
(mf/leader "C-f" find-file)
(mf/leader "C-s" save-buffer)

;; Dired
(eval-after-load 'dired-mode
  '(define-key dired-mode-map (kbd "q") #'(lambda() (interactive) (quit-window t))))

;; Org
(mf/leader "." org-capture)
(mf/leader "a" org-agenda)
(mf/leader "n f" org-roam-node-find)
(mf/leader "n i" org-roam-node-insert)
(mf/leader "n t" mf/org-roam-find-teaching)

;; Quit help buffers and kill the window at the same time
(eval-after-load 'help-mode
  '(define-key help-mode-map (kbd "q") #'(lambda() (interactive) (quit-window t))))

;; My functions (should all be already autoloaded as defined in mf-autoloads.el)
(define-key emacs-lisp-mode-map (kbd "C-M-d") #'mf/delete-sexp)
(mf/leader "i" mf/infos)
(mf/leader "RET" mf/toggle-eshell)
(mf/leader "y" mf/youtube)

(provide 'mf-keybindings)
;;; mf-keybindings.el ends here
