;; init.el --- Emacs initalization file -*- lexical-binding: t -*-
;; Raise garbage collection threshold to speed up init time
(setq gc-cons-threshold most-positive-fixnum)

;; Better defaults
(setq-default
 tab-always-indent 'complete		    ; First tab indents, second one completes
 tab-width 4				            ; Smaller width for tab characters
 sentence-end-double-space nil		    ; Use a single space after dots
 mouse-yank-at-point t			        ; Yank at point rather than pointer
 help-window-select t			        ; Focus newly spawned help windows
 visible-bell 1                         ; No bell
 auto-save-default nil                  ; Stop all the #filename# madness
 create-lockfiles nil
 custom-file (concat user-emacs-directory "early-init.el")
 cursor-in-non-selected-windows nil)	; Hide cursor in non selected windows
(fset #'yes-or-no-p #'y-or-n-p)         ; y or n instead of yes or no
(delete-selection-mode 1)		        ; Replace region when inserting text
(recentf-mode 1)                         ; Keep recent file list

(add-to-list 'custom-theme-load-path (concat user-emacs-directory "mf-lisp/themes/"))
(if
	(>= (string-to-number (format-time-string "%H")) 19)
	(load-theme 'mf-dark t)
  (load-theme 'mf t))

(load-file (concat user-emacs-directory "Emacs.el"))

;; Startup time and garbage collection
(add-hook 'emacs-startup-hook
		  (lambda ()
			(message "Emacs ready in %s with %d garbage collections"
					 (format "%.2f seconds"
							 (float-time
							  (time-subtract after-init-time before-init-time)))
					 gcs-done)))

(setq gc-cons-threshold (* 2 1000 1000))
;;; init.el ends here
