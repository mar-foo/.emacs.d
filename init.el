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
 '(global-emojify-mode t)
 '(package-selected-packages
   '(elfeed-goodies all-the-icons-dired dired evil-smartparens smartparens magit yasnippet-snippets yasnippet emojify ytdious rotate org-fragtog org-wild-notifier xterm-color with-editor use-package treemacs-evil pkg-info ivy-prescient eshell-git-prompt async)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
