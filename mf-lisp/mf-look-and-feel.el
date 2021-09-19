;;; mf-look-and-feel.el --- Look and feel configuration -*- lexical-binding: t -*-
;;; Code:
(setq inhibit-startup-message 1)
(scroll-bar-mode -1)                    ; Disable scroll bar
(tool-bar-mode -1)                      ; Disable toolbar
(tooltip-mode -1)                       ; Disable tooltips
(menu-bar-mode -1)                      ; Disable menu bar
(blink-cursor-mode -1)		            ; Disable cursor blinking
(global-hl-line-mode 1)			        ; Highlight current line
(show-paren-mode 1)
(setq show-paren-delay 0)		        ; Highlight matching parentheses
(fringe-mode)

(setq-default default-frame-alist
			  (append (list
					   '(font . "Go Mono:style=medium:size=12")
					   '(tool-bar-lines . 0)
					   '(menu-bar-lines . 0)
					   '(internal-border-width . 15)
					   '(right-fringe . 5)
					   '(left-fringe . 5)
					   '(vertical-scroll-bars . nil)))
			  fringes-outside-margins t
			  window-resize-pixelwise t
			  frame-resize-pixelwise t)

(setq display-buffer-alist '(("\\*eshell\\*"  (display-buffer-in-side-window)
                              (side . bottom)
                              (window-height . 0.4)
							  (slot . 0))
                             ("\\*Packages\\*" (display-buffer-in-side-window)
                              (side . bottom)
                              (window-height . 0.4))
                             ("\\*\\(Wo\\)\?Man" (display-buffer-in-side-window)
                              (side . bottom)
                              (window-height . 0.4)
							  (slot . 1))
                             ("\\*[Hh]elp" (display-buffer-in-side-window)
                              (side . bottom)
                              (window-height . 0.4)
							  (slot . 1))
							 ("*Libera.Chat" (display-buffer-in-side-window)
							  (side . bottom)
							  (window-height . 0.4)
							  (slot . 1))))

(require 'whitespace)
(setq whitespace-style '(face empty line-tail trailing)
      whitespace-line-column 80)
(global-whitespace-mode t)

(provide 'mf-look-and-feel)
;;; mf-look-and-feel.el ends here
