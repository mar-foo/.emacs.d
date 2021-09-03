;; Raise garbage collection threshold to speed up init time
(setq gc-cons-threshold (* 50 1000 1000))
;; Package management
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
						 ("org" . "https://orgmode.org/elpa/")
						 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)


;; Better defaults
(setq-default
 tab-always-indent 'complete		    ; First tab indents, second one completes
 tab-width 4				            ; Smaller width for tab characters
 sentence-end-double-space nil		    ; Use a single space after dots
 mouse-yank-at-point t			        ; Yank at point rather than pointer
 help-window-select t			        ; Focus newly spawned hel windows
 visible-bell 1                         ; No bell
 header-line-format mode-line-format
 mode-line-format nil
 cursor-in-non-selected-windows nil)	; Hide cursor in non selected windows

;; GUI Tweaks
(setq inhibit-startup-message 1)
(scroll-bar-mode -1)                    ; Disable scroll bar
(tool-bar-mode -1)                      ; Disable toolbar
(tooltip-mode -1)                       ; Disable tooltips
(menu-bar-mode -1)                      ; Disable menu bar
(fset #'yes-or-no-p #'y-or-n-p)         ; y or n instead of yes or no
(blink-cursor-mode -1)		            ; Disable cursor blinking
(global-hl-line-mode 1)			        ; Highlight current line
(show-paren-mode 1)
(setq show-paren-delay 0)		        ; Highlight matching parentheses
(delete-selection-mode 1)		        ; Replace region when inserting text
(recentf-mode 1)                         ; Keep recent file list

(setq-default default-frame-alist
			  (append (list
					   '(font . "Go Mono:style=medium:size=12")
					   '(left-fringe . 0)
					   '(right-fringe . 0)
					   '(tool-bar-lines . 0)
					   '(menu-bar-lines . 0)
					   '(vertical-scroll-bars . nil)))
			  window-resize-pixelwise t
			  frame-resize-pixelwise t)

;; Header line colour
(custom-set-faces
 '(header-line ((t (:background "#1d2021" :height 100 :box (:line-width 1 :color "#32302f"))))))

;; Header line format
(setq-default header-line-format
			  (list
			   '(:eval (propertize (concat (if (display-graphic-p) " " "-") " %*%+ ")
								   'face '(:background "#dd6f48" :foreground "black" :height 0.9 :weight bold)))
			   '(:eval (propertize (concat " [" (file-name-directory buffer-file-name))
								   'face '(:foreground "white" :height 0.9 :weight normal)))
			   '(:eval (propertize (concat (file-name-nondirectory buffer-file-name))
								   'face '(:foreground "#dd6f48" :height 0.9 :weight bold)))
			   '(:eval (propertize (if (string-equal (file-name-nondirectory buffer-file-name) "") "" "]")
								   'face '(:foreground "white" :height 0.9 :weight normal)))
			   ;; spaces to align right https://github.com/jamesnvc/dotfiles/blob/master/emacs.d/modules/cogent-modeline.el
			   '(:eval (propertize " " 'display
								   `((space :align-to (- (+ right right-fringe right-margin)
														 ,(+ 3 (string-width
																(if (listp mode-name)
																	(car mode-name)
																  mode-name))))))))
			   '(:eval (propertize (concat "[" mode-name "]")
								   'face '(:foreground "white" :height 0.9 :weight normal)))
			   '(:eval (propertize (mode-line-remote) 'face 'default))))

;; Fonts
(defun mf/set-font-faces ()
  (set-face-attribute 'default nil
					  :font "Go Mono"
					  :height 90))

(if (daemonp)
	(add-hook 'after-make-frame-functions
			  (lambda (frame)
				(with-selected-frame frame
				  (mf/set-font-faces)
				  (message "Loading fonts"))))
  (mf/set-font-faces))

(use-package gruvbox-theme
  :init
  (load-theme 'gruvbox-dark-medium t))

;; Tangle and compile if necessary only, then load the configuration
;; From tecosaur's config https://github.com/tecosaur
(let* ((.org "~/.emacs.d/Emacs.org")
	   (.el (concat (file-name-sans-extension .org) ".el"))
	   (modification-time
		(file-attribute-modification-time (file-attributes .org))))
  (require 'org-macs)
  (unless (org-file-newer-than-p .el modification-time)
	(require 'ob-tangle)
	(org-babel-tangle-file .org .el "emacs-lisp")
	(byte-compile-file .el))
  (load-file .el))



;; (load-file "~/.emacs.d/Emacs.el")


;; Startup time and garbage collection
(add-hook 'emacs-startup-hook
		  (lambda ()
			(message "Emacs ready in %s with %d garbage collections"
					 (format "%.2f seconds"
							 (float-time
							  (time-subtract after-init-time before-init-time)))
					 gcs-done)))
(setq gc-cons-threshold (* 2 1000 1000))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("4eb6fa2ee436e943b168a0cd8eab11afc0752aebb5d974bba2b2ddc8910fca8f" "6bdcff29f32f85a2d99f48377d6bfa362768e86189656f63adbf715ac5c1340b" "78c4238956c3000f977300c8a079a3a8a8d4d9fee2e68bad91123b58a4aa8588" "7661b762556018a44a29477b84757994d8386d6edee909409fabe0631952dad9" "6b5c518d1c250a8ce17463b7e435e9e20faa84f3f7defba8b579d4f5925f60c1" "5784d048e5a985627520beb8a101561b502a191b52fa401139f4dd20acb07607" "7eea50883f10e5c6ad6f81e153c640b3a288cd8dc1d26e4696f7d40f754cc703" "0e2a7e1e632dd38a8e0227d2227cb8849f877dd878afb8219cb6bcdd02068a52" "2cdc13ef8c76a22daa0f46370011f54e79bae00d5736340a5ddfe656a767fddf" "3c2f28c6ba2ad7373ea4c43f28fcf2eed14818ec9f0659b1c97d4e89c99e091e" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "5a0eee1070a4fc64268f008a4c7abfda32d912118e080e18c3c865ef864d1bea" "79278310dd6cacf2d2f491063c4ab8b129fee2a498e4c25912ddaa6c3c5b621e" "c4bdbbd52c8e07112d1bfd00fee22bf0f25e727e95623ecb20c4fa098b74c1bd" "0a41da554c41c9169bdaba5745468608706c9046231bbbc0d155af1a12f32271" "8a379e7ac3a57e64de672dd744d4730b3bdb88ae328e8106f95cd81cbd44e0b6" "2035a16494e06636134de6d572ec47c30e26c3447eafeb6d3a9e8aee73732396" "8f5a7a9a3c510ef9cbb88e600c0b4c53cdcdb502cfe3eb50040b7e13c6f4e78e" "ddff22007104a1317014e48ff3d4911a83771a4ccf57185ccebf7f91339dbfb8" "0f7fa4835d02a927d7d738a0d2d464c38be079913f9d4aba9c97f054e67b8db9" "23b564cfb74d784c73167d7de1b9a067bcca00719f81e46d09ee71a12ef7ee82" "c3957b559cf3606c9a40777c5712671db3c7538e5d5ea9f63eb0729afeac832b" default))
 '(fci-rule-color "#BA45A3")
 '(global-emojify-mode t)
 '(jdee-db-active-breakpoint-face-colors (cons "#131033" "#1ea8fc"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#131033" "#a7da1e"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#131033" "#546A90"))
 '(objed-cursor-color "#e61f44")
 '(package-selected-packages
   '(go-mode page-break-lines dante hindent vterm visual-fill-column use-package smartparens rainbow-delimiters projectile prescient org-fragtog org-bullets orderless marginalia magit hydra helpful gruvbox-theme general evil-collection eshell-git-prompt emojify corfu all-the-icons))
 '(rustic-ansi-faces
   ["#0c0a20" "#e61f44" "#a7da1e" "#ffd400" "#1ea8fc" "#ff2afc" "#42c6ff" "#f2f3f7"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
