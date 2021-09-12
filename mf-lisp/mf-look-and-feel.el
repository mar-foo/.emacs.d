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

(setq-default default-frame-alist
			  (append (list
					   '(font . "Go Mono:style=medium:size=12")
					   '(tool-bar-lines . 0)
					   '(menu-bar-lines . 0)
					   '(left-margin-width . 1)
					   '(right-margin-width . 1)
					   '(vertical-scroll-bars . nil)))
			  fringes-outside-margins t
			  window-resize-pixelwise t
			  frame-resize-pixelwise t)

;; Mode line format
;; (setq-default mode-line-format
;; 			  (list
;; 			   '(:eval (propertize (concat (if (display-graphic-p) " " "-") " %*%+ ")
;; 								   'face '(:background "#10387c" :foreground "black" :height 0.9 :weight bold)))
;; 			   '(:eval (propertize (concat " [" (file-name-directory buffer-file-name))
;; 								   'face '(:foreground "black" :height 0.9 :weight normal)))
;; 			   '(:eval (propertize (concat (file-name-nondirectory buffer-file-name))
;; 								   'face '(:foreground "#10387c" :height 0.9 :weight bold)))
;; 			   '(:eval (propertize (if (string-equal (file-name-nondirectory buffer-file-name) "") "" "]")
;; 								   'face '(:foreground "black" :height 0.9 :weight normal)))
;; 			   '(:eval (propertize (concat (concat " [" mode-name ) "] ")
;; 								   'face '(:foreground "black" :height 0.9 :weight normal)))))
;; (custom-set-faces
;;  '(mode-line ((t (:background "#ffffff" :foreground "#f4f4f4" :box nil :overline nil :underline nil))))
;;  '(mode-line-inactive ((t (:background "#aaaaaa" :foreground "#bfc0c4" :box nil :overline nil :underline nil)))))

(setq display-buffer-alist '(("\\*eshell\\*"  (display-buffer-in-side-window)
                              (side . bottom)
                              (window-height . 0.4))
                             ("\\*Packages\\*" (display-buffer-in-side-window)
                              (side . bottom)
                              (window-height . 0.4))
                             ("\\*WoMan" (display-buffer-in-side-window)
                              (side . bottom)
                              (window-height . 0.4))
                             ("\\*[Hh]elp" (display-buffer-in-side-window)
                              (side . bottom)
                              (window-height . 0.4))))

(require 'whitespace)
(setq whitespace-style '(face empty line-tail trailing)
      whitespace-line-column 80)
(global-whitespace-mode t)

(provide 'mf-look-and-feel)
;;; mf-look-and-feel.el ends here
