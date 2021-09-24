;;; early-init.el --- Early configuration for Emacs
;;; Code:
(add-to-list 'load-path (concat user-emacs-directory "mf-lisp/"))
(require 'mf-packages)
(defmacro mf/install (package)
  (unless
	  (package-installed-p package)
	(package-install package)))
(require 'mf-look-and-feel)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(company lsp-mode org-tree-slide dired-filter go-complete gcmh all-the-icons ob-go monochrome-theme vertico password-store exwm haskell-mode org-roam go-mode hindent prescient magit))
 '(rustic-ansi-faces
   ["#0c0a20" "#e61f44" "#a7da1e" "#ffd400" "#1ea8fc" "#ff2afc" "#42c6ff" "#f2f3f7"])
 '(send-mail-function 'sendmail-send-it)
 '(warning-suppress-types '((org-roam) (org-roam))))
(put 'downcase-region 'disabled nil)
;;; early-init.el ends here
