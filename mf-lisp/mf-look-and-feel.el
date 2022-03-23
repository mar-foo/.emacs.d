;;; mf-look-and-feel.el --- Look and feel configuration -*- lexical-binding: t -*-
;;; Code:
(defmacro mf/enable-if-bound (symbol enable)
  `(if (fboundp #',symbol)
       (,symbol ,(if (not enable) -1))))
(mf/enable-if-bound scroll-bar-mode nil)	; Scroll bars are awful
(mf/enable-if-bound tool-bar-mode nil)
(mf/enable-if-bound menu-bar-mode nil)		; I don't need menus, I have 300 keybindings in my head
(mf/enable-if-bound fringe-mode t)			; Give me some breathing room
(setq inhibit-startup-message 1)			; No default startup message
(tooltip-mode -1)							; Disable tooltips
(blink-cursor-mode -1)						; Disable cursor blinking
(global-hl-line-mode)						; Highlight current line
(show-paren-mode)
(setq show-paren-delay 0)					; Highlight matching parentheses
(unless (display-graphic-p)
  (set-terminal-coding-system 'utf-8-unix)) ; Use utf-8 in terminal emacs

(setq-default default-frame-alist
	      (append (list
		       '(font . "Fira Code:style=medium:size=14")
		       '(tool-bar-lines . 0)
		       '(menu-bar-lines . 0)
		       '(right-fringe . 5)
		       '(left-fringe . 5)
		       '(vertical-scroll-bars . nil)))
	      fringes-outside-margins t
	      window-resize-pixelwise t
	      frame-resize-pixelwise t)
(setq-default initial-frame-alist default-frame-alist)
(add-hook 'window-configuration-change-hook
	  (lambda()
	    (unless
		(or (eq major-mode 'minibuffer-mode) (eq major-mode 'exwm-mode))
	      (set-window-margins (car (get-buffer-window-list (current-buffer) nil t)) 5 5))))

(setq display-buffer-alist
      '(("\\*Async Shell Command\\*" (display-buffer-no-window))
	("\\*shell" (display-buffer-pop-up-window))
	("\\*eshell\\*"  (display-buffer-in-side-window)
	 (side . bottom)
	 (window-height . 0.4)
	 (slot . 0))
	("\\*Calendar\\*" (display-buffer-below-selected)
	 (window-height . 0.2))
	("\\*compilation\\*" (display-buffer-in-side-window)
	 (side . bottom)
	 (window-height . 0.4)
	 (slot . 1))
	;; ("\\*elfeed-entry\\*" (display-buffer-in-side-window)
	;;  (side . right)
	;;  (window-width . 0.6))
	("\\*Flymake diagnostics for" (display-buffer-below-selected)
	 (window-height . 0.2))
	;; ("\\*slime-repl " (display-buffer-below-selected)
	;;  (window-height . 0.3))
	("\\*inferior-lisp\\*" (display-buffer-below-selected)
	 (window-height . 0.2))
	("\\*sldb " (display-buffer-below-selected)
	 (window-height . 0.3))
	("\\*ielm\\*" (display-buffer-below-selected)
	 (window-height . 0.3))
	("\\*Packages\\*" (display-buffer-in-side-window)
	 (side . bottom)
	 (window-height . 0.4))
	("\\*\\(Wo\\)\?Man" (display-buffer-in-side-window)
	 (side . bottom)
	 (window-height . 0.4)
	 (slot . 2))
	("\\*[Hh]elp" (display-buffer-in-side-window)
	 (side . bottom)
	 (window-height . 0.4)
	 (slot . 1))
	("*Libera.Chat" (display-buffer-in-side-window)
	 (side . bottom)
	 (window-height . 0.4)
	 (slot . 1))
	("\\*MPC-Songs\\*" (display-buffer-in-side-window)
	 (side . bottom)
	 (window-height . 0.4)
	 (slot . 0))
	("\\*MPC Album|Playlists\\*" (display-buffer-in-side-window)
	 (side . bottom)
	 (window-height . 0.4)
	 (slot . 1))
	("\\*Telega Root\\*" (display-buffer-in-side-window)
	 (side . bottom)
	 (window-height . 0.4)
	 (slot . 0))
	("\\*Agenda Commands\\*" (display-buffer-in-side-window)
	 (side . bottom)
	 (window-height . 0.4)
	 (slot . 1))
	("\\*Org Select\\*" (display-buffer-in-side-window)
	 (side . bottom)
	 (window-height . 0.4)
	 (slot . 0))
	("\\*Org Export Dispatcher\\*" (display-buffer-in-side-window)
	 (side . bottom)
	 (window-height . 0.4)
	 (slot . 1))
	("\\*Org Agenda\\*" (display-buffer-in-side-window)
	 (side . bottom)
	 (window-height . 0.4))
	("\\*Org Todo\\*" (display-buffer-in-side-window)
	 (side . bottom)
	 (slot . 1))))

(require 'whitespace)
(setq whitespace-style '(face empty line-tail trailing)
      whitespace-line-column 80)
(global-whitespace-mode)

;; From doom-themes package
(defface mf-visual-bell '((t :background "#900000"))
  "Face for the visual bell")

(defun mf/visual-bell()
  "Blink the modeline red. Set `ring-bell-function' to this to use it."
  (let ((bell-cookie (face-remap-add-relative 'mode-line 'mf-visual-bell)))
    (force-mode-line-update)
    (run-with-timer 0.15 nil
		    (lambda (cookie buf)
		      (with-current-buffer buf
			(face-remap-remove-relative cookie)
			(force-mode-line-update)))
		    bell-cookie
		    (current-buffer))))

(setq ring-bell-function #'mf/visual-bell)

(add-to-list 'custom-theme-load-path (concat user-emacs-directory "mf-lisp/themes/"))
(if (version< emacs-version "28")
    (mf/install doom-themes))
(load-theme 'doom-gruvbox t)

(provide 'mf-look-and-feel)
;;; mf-look-and-feel.el ends here
