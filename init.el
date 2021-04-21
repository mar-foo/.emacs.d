;;Use emacs.org as init file
;; (require 'org)
;; (org-babel-load-file
;;  (expand-file-name "Emacs.org"
;; 		   user-emacs-directory))
(load-file "~/.emacs.d/Emacs.el")


;; Tangle and compile if necessary only, then load the configuration
;; (let* ((.org "~/.emacs.d/Emacs.org")
;;        (.el (concat (file-name-sans-extension .org) ".el"))
;;        (modification-time
;; 	(file-attribute-modification-time (file-attributes .org))))
;;   (require 'org-macs)
;;   (unless (org-file-newer-than-p .el modification-time)
;;     (require 'ob-tangle)
;;     (org-babel-tangle-file .org .el "emacs-lisp")
;;     (byte-compile-file .el))
;;   (load-file .el))




























(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#0c0a20" "#e61f44" "#a7da1e" "#ffd400" "#1ea8fc" "#ff2afc" "#42c6ff" "#f2f3f7"])
 '(custom-safe-themes
   '("ddff22007104a1317014e48ff3d4911a83771a4ccf57185ccebf7f91339dbfb8" "0f7fa4835d02a927d7d738a0d2d464c38be079913f9d4aba9c97f054e67b8db9" "23b564cfb74d784c73167d7de1b9a067bcca00719f81e46d09ee71a12ef7ee82" "c3957b559cf3606c9a40777c5712671db3c7538e5d5ea9f63eb0729afeac832b" default))
 '(fci-rule-color "#BA45A3")
 '(global-emojify-mode t)
 '(jdee-db-active-breakpoint-face-colors (cons "#131033" "#1ea8fc"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#131033" "#a7da1e"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#131033" "#546A90"))
 '(objed-cursor-color "#e61f44")
 '(package-selected-packages
   '(modus-vivendi-theme company-box esup minibuffer embark window orderless marginalia almost-mono-themes sexy-monochrome-theme vscdark-theme sublime-themes stimmung-themes quasi-monochrome-theme org-mime ivy-posframe guix elfeed-goodies all-the-icons-dired dired evil-smartparens smartparens magit yasnippet-snippets yasnippet emojify ytdious rotate org-fragtog org-wild-notifier xterm-color with-editor use-package treemacs-evil pkg-info ivy-prescient eshell-git-prompt async))
 '(pdf-view-midnight-colors (cons "#f2f3f7" "#0c0a20"))
 '(rustic-ansi-faces
   ["#0c0a20" "#e61f44" "#a7da1e" "#ffd400" "#1ea8fc" "#ff2afc" "#42c6ff" "#f2f3f7"])
 '(vc-annotate-background "#0c0a20")
 '(vc-annotate-color-map
   (list
    (cons 20 "#a7da1e")
    (cons 40 "#c4d814")
    (cons 60 "#e1d60a")
    (cons 80 "#ffd400")
    (cons 100 "#efa314")
    (cons 120 "#df7329")
    (cons 140 "#cf433e")
    (cons 160 "#df3a7d")
    (cons 180 "#ef32bc")
    (cons 200 "#ff2afc")
    (cons 220 "#f626be")
    (cons 240 "#ee2281")
    (cons 260 "#e61f44")
    (cons 280 "#c13157")
    (cons 300 "#9d4469")
    (cons 320 "#78577d")
    (cons 340 "#BA45A3")
    (cons 360 "#BA45A3")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
