;; mf-keybindings.el --- Keybinding configuration -*- lexical-binding: t -*-
	;;; Code:
(defcustom mf/leader-prefix-key "C-c"
  "Prefix key for my personal keybindings")

(define-prefix-command 'mf/leader-map)

(defmacro mf/leader (key func)
  `(define-key'mf/leader-map (kbd ,key) #',func))

(mf/leader "C-SPC" execute-extended-command)
(mf/leader "k" kill-current-buffer)

(global-set-key (kbd mf/leader-prefix-key) 'mf/leader-map)

;; Quit help buffers and kill the window at the same time
(eval-after-load 'help-mode
  '(define-key help-mode-map (kbd "q") #'kill-current-buffer))

(define-key lisp-mode-map (kbd "C-M-d") #'mf/delete-sexp)

(provide 'mf-keybindings)
;;; mf-keybindings.el ends here
