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
 '(custom-safe-themes
   '("310674968aed9acc596110ef4f06cd03102310a6dc332228c0afc0d206de5f63" "571b6fb1e475e5db9304c487613438226c367bd364b6337235a3140b6789e72c" "a34a12514ca64ec3ab79818a2f0a41971d2ba196ba7de76cc5ad3b1add7b3b7f" "1da2cec909d2a89c50c5ffb9410a2f6813fe28b856093d9d75c905b5ecb3d4f6" "71cc29d307ad5c9892c58735eb19d63c14f3e559ca49e66dc989150bd784107f" "da858899f44034c9dba83e999317929b320268dbfa81f98a4e3e3793b4383606" "c4064dc5882387734d7a6373a37c1f297574c99de7d911670e233e28e73bb059" "f3e3936ff7c813fc2223ee7168b2194283d2a9f08927bd082b6810456e893e47" "9efba0448559eb344fe77d257d9b7ee073a2167d96c8959449951d2d357fd873" "2dda9be1e667defc077269a68035afc0f152b342826472bc5259c4aef9711157" "ff9fc2478b6efe3cb5789dc18e2bf4b9dffc21b5969ca791db2187fce88c7b23" "e1c46e047e80afe08f3ba292bf09cab1082d345f999c2415da17c39d0162fd33" "b5e3bfc046217051d97051c8cf8ea4e817f334349ebe6aa8c338d1dc6e7d62e4" "c5e173fc049b756d8237ab412a95548dd7927f95f52972f497d91e40245de552" "38382eb17da3242e689f8421e5b2a09ea2d52ec0b44a3cb507286ce557566a2d" "7a4d3d3c481f42c0c09d99b62cc81aa8cf5cbdfa31aadce5e0795025d6801877" "330e17fa92c78a8abe4b98d468d9384c6461a3023788536563d9b87737e574e8" default))
 '(package-selected-packages
   '(yasnippet company lsp-mode org-tree-slide dired-filter go-complete gcmh all-the-icons ob-go monochrome-theme vertico password-store exwm haskell-mode org-roam go-mode hindent prescient magit))
 '(rustic-ansi-faces
   ["#0c0a20" "#e61f44" "#a7da1e" "#ffd400" "#1ea8fc" "#ff2afc" "#42c6ff" "#f2f3f7"])
 '(send-mail-function 'sendmail-send-it)
 '(warning-suppress-types '((org-roam) (org-roam))))
(put 'downcase-region 'disabled nil)
;;; early-init.el ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
