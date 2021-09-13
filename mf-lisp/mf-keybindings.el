;;; mf-keybindings.el --- Keybinding configuration -*- lexical-binding: t -*-
;;; Code:
(define-key global-map (kbd "C-. C-.") #'execute-extended-command)
(define-key global-map (kbd "C-. /") #'occur)
(define-key global-map (kbd "C-. d") #'kill-current-buffer)
(define-key global-map (kbd "C-. c") #'compile)
(define-key global-map (kbd "C-. r") #'recompile)
(define-key minibuffer-mode-map (kbd "M-RET") #'mf/select-completion-and-exit)

(if
	(fboundp 'mf/delete-sexp)
	(define-key emacs-lisp-mode-map (kbd "C-M-d") #'mf/delete-sexp))
(if
	(fboundp 'notmuch)
	(define-key global-map (kbd "C-. m") #'notmuch))
(if
	(fboundp 'mf/infos)
	(define-key global-map (kbd "C-. i") #'mf/infos))
(if
	(fboundp 'mf/toggle-eshell)
	(define-key global-map (kbd "C-. RET") #'mf/toggle-eshell))

;; Org
(if
	(fboundp 'org-roam-capture)
	(define-key global-map (kbd "C-. o") #'org-roam-capture))
(if
	(fboundp 'org-roam-node-find)
	(define-key global-map (kbd "C-. n f") #'org-roam-node-find))
(if
	(fboundp 'org-roam-node-insert)
	(define-key global-map (kbd "C-. n i") #'org-roam-node-insert))

(provide 'mf-keybindings)
;;; mf-keybindings.el ends here
