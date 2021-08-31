; Raise garbage collection threshold to speed up init time
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
 tab-always-indent 'complete		; First tab indents, second one completes
 tab-width 4				; Smaller width for tab characters
 sentence-end-double-space nil		; Use a single space after dots
 mouse-yank-at-point t			; Yank at point rather than pointer
 help-window-select t			; Focus newly spawned hel windows
 visible-bell 1                 ; No bell
 cursor-in-non-selected-windows nil)	; Hide cursor in non selected windows

;; GUI Tweaks
(setq inhibit-startup-message 1)
(scroll-bar-mode -1) ; Disable scroll bar
(tool-bar-mode -1) ; Disable toolbar
(tooltip-mode -1) ; Disable tooltips
(set-fringe-mode 10)
(menu-bar-mode -1) ; Disable menu bar
(fset #'yes-or-no-p #'y-or-n-p) ; y or n instead of yes or no
(blink-cursor-mode -1)		; Disable cursor blinking
(global-hl-line-mode 1)			; Highlight current line
(show-paren-mode 1)
(setq show-paren-delay 0)		; Highlight matching parentheses
(delete-selection-mode 1)		; Replace region when inserting text

;; Fonts
(defun mf/set-font-faces ()
 (set-face-attribute 'variable-pitch nil ; Variable pitch font
					  :font "Dejavu Serif"
					  :height 100)
  (set-face-attribute 'fixed-pitch nil
					  :font "Terminus"
					  :height 110)
  (set-face-attribute 'default nil
					  :font "Terminus"
					  :height 100))

(if (daemonp)
	(add-hook 'after-make-frame-functions
			  (lambda (frame)
				(with-selected-frame frame
				  (mf/set-font-faces)
				  (message "Loading fonts"))))
  (mf/set-font-faces))

(if (file-exists-p "/sys/class/power_supply/BAT0/capacity")
	(display-battery-mode))				; Display battery on laptops

(use-package gruvbox-theme
  :init
  (load-theme 'gruvbox-dark-medium t))

(setq mf/site-bookmarks-list '("https://ariel.unimi.it" "https://mail.protonmail.com" "https://duckduckgo.com/html?q=" "http://unimia.unimi.it/" "https://meet.jit.si/Mecc_Quant" "https://meet.jit.si/Mario_Mate" "https://wiki.gentoo.org" "https://suckless.org" "https://cat-v.org"))

(setq mf/is-laptop
	  (file-exists-p "/sys/class/power_supply/BAT0/capacity"))

;; Tangle and compile if necessary only, then load the configuration
;; From tecosaur's config https://github.com/tecosaur
(let* ((.org "~/.emacs.d/GNUEmacs.org")
       (.el (concat (file-name-sans-extension .org) ".el"))
       (modification-time
	(file-attribute-modification-time (file-attributes .org))))
  (require 'org-macs)
  (unless (org-file-newer-than-p .el modification-time)
    (require 'ob-tangle)
    (org-babel-tangle-file .org .el "emacs-lisp")
    (byte-compile-file .el))
  (load-file .el))

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
   '("7661b762556018a44a29477b84757994d8386d6edee909409fabe0631952dad9" "6b5c518d1c250a8ce17463b7e435e9e20faa84f3f7defba8b579d4f5925f60c1" "5784d048e5a985627520beb8a101561b502a191b52fa401139f4dd20acb07607" "7eea50883f10e5c6ad6f81e153c640b3a288cd8dc1d26e4696f7d40f754cc703" "0e2a7e1e632dd38a8e0227d2227cb8849f877dd878afb8219cb6bcdd02068a52" "2cdc13ef8c76a22daa0f46370011f54e79bae00d5736340a5ddfe656a767fddf" "3c2f28c6ba2ad7373ea4c43f28fcf2eed14818ec9f0659b1c97d4e89c99e091e" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "5a0eee1070a4fc64268f008a4c7abfda32d912118e080e18c3c865ef864d1bea" "79278310dd6cacf2d2f491063c4ab8b129fee2a498e4c25912ddaa6c3c5b621e" "c4bdbbd52c8e07112d1bfd00fee22bf0f25e727e95623ecb20c4fa098b74c1bd" "0a41da554c41c9169bdaba5745468608706c9046231bbbc0d155af1a12f32271" "8a379e7ac3a57e64de672dd744d4730b3bdb88ae328e8106f95cd81cbd44e0b6" "2035a16494e06636134de6d572ec47c30e26c3447eafeb6d3a9e8aee73732396" "8f5a7a9a3c510ef9cbb88e600c0b4c53cdcdb502cfe3eb50040b7e13c6f4e78e" "ddff22007104a1317014e48ff3d4911a83771a4ccf57185ccebf7f91339dbfb8" "0f7fa4835d02a927d7d738a0d2d464c38be079913f9d4aba9c97f054e67b8db9" "23b564cfb74d784c73167d7de1b9a067bcca00719f81e46d09ee71a12ef7ee82" "c3957b559cf3606c9a40777c5712671db3c7538e5d5ea9f63eb0729afeac832b" default))
 '(fci-rule-color "#BA45A3")
 '(global-emojify-mode t)
 '(jdee-db-active-breakpoint-face-colors (cons "#131033" "#1ea8fc"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#131033" "#a7da1e"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#131033" "#546A90"))
 '(objed-cursor-color "#e61f44")
 '(package-selected-packages
   '(dante hindent which-key vterm visual-fill-column use-package smartparens rainbow-delimiters projectile prescient org-fragtog org-bullets orderless marginalia magit hydra helpful gruvbox-theme general evil-collection eterm-256color eshell-git-prompt emojify embark corfu avy all-the-icons))
 '(rustic-ansi-faces
   ["#0c0a20" "#e61f44" "#a7da1e" "#ffd400" "#1ea8fc" "#ff2afc" "#42c6ff" "#f2f3f7"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
