;; init.el --- Emacs initalization file -*- lexical-binding: t -*-
(setq mf/os
      (cond
       ((string= (shell-command-to-string "uname") "Linux\n")
	(if (not (null (executable-find "guix")))
	    "Guix"
	  "Linux"))
       (t
	(shell-command-to-string "uname"))))
(if (string= mf/os "Guix")
    (add-to-list 'load-path "/home/mario/.guix-profile/share/emacs/site-lisp/"))

(setq mf/use-exwm nil)

(setq gc-cons-threshold most-positive-fixnum)

(setq-default
 tab-always-indent 'complete		    ; First tab indents, second one completes
 tab-width 8
 sentence-end-double-space nil		    ; Use a single space after dots
 mouse-yank-at-point t			        ; Yank at point rather than pointer
 help-window-select t			        ; Focus newly spawned help windows
 visible-bell 1                         ; No bell
 auto-save-default nil                  ; Stop all the #filename# madness
 create-lockfiles nil
 backup-directory-alist '(("." . "~/.cache/emacs-saves/"))
 custom-file (concat user-emacs-directory "custom.el")
 cursor-in-non-selected-windows nil)	; Hide cursor in non selected windows
(fset #'yes-or-no-p #'y-or-n-p)         ; y or n instead of yes or no
(delete-selection-mode 1)		        ; Replace region when inserting text
(recentf-mode 1)                         ; Keep recent file list
(load-file custom-file)

(mf/install wgrep)
(mf/install multiple-cursors)

(defmacro mf/autoload-func (&rest body)
  `(unless
       (fboundp #',(plist-get body :func))
     (autoload #',(plist-get body :func) ,(plist-get body :file) nil t)))

(require 'mf-config)

; keybindings
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-.") 'mc/mark-all-like-this)

(mf/install gcmh)
(gcmh-mode 1)
;;; init.el ends here
