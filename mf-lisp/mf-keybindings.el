;; mf-keybindings.el --- Keybinding configuration -*- lexical-binding: t -*-
;;; Code:
(define-key global-map (kbd "C-. C-.") #'execute-extended-command)
(define-key global-map (kbd "C-. ,") #'comment-line)
(define-key global-map (kbd "C-. /") #'eww)
(define-key global-map (kbd "C-. b") #'switch-to-buffer)
(define-key global-map (kbd "C-. c") #'compile)
(define-key global-map (kbd "C-. d") #'kill-current-buffer)
(define-key global-map (kbd "C-. j") #'jump-to-register)
(define-key global-map (kbd "C-. m") #'mu4e)
(define-key global-map (kbd "C-. o") #'other-window)
(define-key global-map (kbd "C-. p") #'mpc)
(define-key global-map (kbd "C-. r") #'point-to-register)
(define-key global-map (kbd "C-. w") #'window-configuration-to-register)
(define-key global-map (kbd "C-x C-b") #'(lambda () (interactive) (ibuffer t)))
(define-key global-map (kbd "C-S-d") #'backward-kill-word)
(define-key global-map (kbd "C-. 1") #'delete-other-windows)
(define-key global-map (kbd "C-. 2") #'split-window-below)
(define-key global-map (kbd "C-. 3") #'split-window-right)
(define-key global-map (kbd "C-. 0") #'delete-window)
(define-key global-map (kbd "C-. C-b") #'(lambda() (interactive) (ibuffer t)))
(define-key global-map (kbd "C-. C-f") #'find-file)
(define-key global-map (kbd "C-. C-s") #'save-buffer)

;; Dired
(eval-after-load 'dired-mode
  '(define-key dired-mode-map (kbd "q") #'(lambda() (interactive) (quit-window t))))

;; Org
(define-key global-map (kbd "C-. .") #'org-capture)
(define-key global-map (kbd "C-. a") #'org-agenda)
(define-key global-map (kbd "C-. n f") #'org-roam-node-find)
(define-key global-map (kbd "C-. n i") #'org-roam-node-insert)
(define-key global-map (kbd "C-. n t") #'mf/org-roam-find-teaching)

;; Quit help buffers and kill the window at the same time
(eval-after-load 'help-mode
  '(define-key help-mode-map (kbd "q") #'(lambda() (interactive) (quit-window t))))

;; My functions (should all be already autoloaded as defined in mf-autoloads.el)
(define-key emacs-lisp-mode-map (kbd "C-M-d") #'mf/delete-sexp)
(define-key global-map (kbd "C-. i") #'mf/infos)
(define-key global-map (kbd "C-. RET") #'mf/toggle-eshell)
(define-key global-map (kbd "C-. y") #'mf/youtube)

(provide 'mf-keybindings)
;;; mf-keybindings.el ends here
