;; mf-keybindings.el --- Keybinding configuration -*- lexical-binding: t -*-
;;; Code:
(define-key global-map (kbd "C-. C-.") #'execute-extended-command)
(define-key global-map (kbd "C-. ,") #'comment-line)
(define-key global-map (kbd "C-. /") #'eww)
(define-key global-map (kbd "C-. d") #'kill-current-buffer)
(define-key global-map (kbd "C-. c") #'compile)
(define-key global-map (kbd "C-. p") #'mpc)
(define-key global-map (kbd "C-. r") #'point-to-register)
(define-key global-map (kbd "C-. w") #'window-configuration-to-register)
(define-key global-map (kbd "C-. j") #'jump-to-register)
(define-key global-map (kbd "C-x C-b") #'(lambda () (interactive) (ibuffer t)))
(define-key global-map (kbd "C-S-d") #'backward-kill-word)

;; Dired
(if
	(fboundp 'dired-mode-map)
	(define-key dired-mode-map (kbd "q") #'(lambda() (interactive) (quit-window t))))

;; Org
(if
	(fboundp 'org-capture)
	(define-key global-map (kbd "C-. .") #'org-capture))
(if
	(fboundp 'org-agenda)
	(define-key global-map (kbd "C-. a") #'org-agenda))

;; My functions
(if
	(fboundp 'mf/delete-sexp)
	(define-key emacs-lisp-mode-map (kbd "C-M-d") #'mf/delete-sexp))

(if
	(fboundp 'mf/infos)
	(define-key global-map (kbd "C-. i") #'mf/infos))

(if
	(fboundp 'help-mode-map)
	(define-key help-mode-map (kbd "q") #'mf/quit-and-kill))

(if
	(fboundp 'minibuffer-mode-map)
	(define-key minibuffer-mode-map (kbd "M-RET") #'mf/select-completion-and-exit))

(if
	(fboundp 'mf/toggle-eshell)
	(define-key global-map (kbd "C-. RET") #'mf/toggle-eshell))

(if
	(fboundp 'mf/youtube)
	(define-key global-map (kbd "C-. y") #'mf/youtube))

(if
	(fboundp 'mf/presentation-setup)
	(define-key global-map (kbd "C-. C-p") #'mf/presentation-setup))

(provide 'mf-keybindings)
;;; mf-keybindings.el ends here
