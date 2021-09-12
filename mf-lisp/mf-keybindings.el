;;; mf-keybindings.el --- Keybinding configuration -*- lexical-binding: t -*-
;;; Code:
(define-key global-map (kbd "C-c /") #'occur)
(define-key global-map (kbd "C-c o") #'delete-other-windows)
(define-key global-map (kbd "C-c d") #'kill-current-buffer)
(define-key global-map (kbd "C-c c") #'compile)
(define-key global-map (kbd "C-c r") #'recompile)
(if
	(fboundp 'mf/delete-sexp)
	(define-key emacs-lisp-mode-map (kbd "C-M-d") #'mf/delete-sexp))
(if
	(fboundp 'notmuch)
	(define-key global-map (kbd "C-c m") #'notmuch))
(if
	(fboundp 'mf/infos)
	(define-key global-map (kbd "C-c i") #'mf/infos))
(if
	(fboundp 'mf/toggle-eshell)
	(define-key global-map (kbd "C-c RET") #'mf/toggle-eshell))

(provide 'mf-keybindings)
;;; mf-keybindings.el ends here
