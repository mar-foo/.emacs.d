;;; early-init.el --- Early configuration for Emacs
;;; Code:
(add-to-list 'load-path (concat user-emacs-directory "mf-lisp/"))
(require 'mf-look-and-feel)
(require 'mf-packages)
(defmacro mf/install (package)
  (unless
	  (package-installed-p package)
	(package-install package)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("cbd85ab34afb47003fa7f814a462c24affb1de81ebf172b78cb4e65186ba59d2" "ffba0482d3548c9494e84c1324d527f73ea4e43fff8dfd0e48faa8fc6d5c2bc7" "021321ae56a45794f43b41de09fb2bfca184e196666b7d7ff59ea97ec2114559" "779df25c6240f183dd378811465566082eacc3c86ed260835382cb5c1dc54de3" "e8825f26af32403c5ad8bc983f8610a4a4786eb55e3a363fa9acb48e0677fe7e" "cdd26fa6a8c6706c9009db659d2dffd7f4b0350f9cc94e5df657fa295fffec71" "2db65c4ef21dc93dd0d8f27d890637093e977658b7a70d55bedaaa1b7f973d85" "bf798e9e8ff00d4bf2512597f36e5a135ce48e477ce88a0764cfb5d8104e8163" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "998975856274957564b0ab8f4219300bca12a0f553d41c1438bbca065f298a29" "0568a5426239e65aab5e7c48fa1abde81130a87ddf7f942613bf5e13bf79686b" "d6da24347c813d1635a217d396cf1e3be26484fd4d05be153f3bd2b293d2a0b5" "4eb6fa2ee436e943b168a0cd8eab11afc0752aebb5d974bba2b2ddc8910fca8f" "6bdcff29f32f85a2d99f48377d6bfa362768e86189656f63adbf715ac5c1340b" "78c4238956c3000f977300c8a079a3a8a8d4d9fee2e68bad91123b58a4aa8588" "7661b762556018a44a29477b84757994d8386d6edee909409fabe0631952dad9" "6b5c518d1c250a8ce17463b7e435e9e20faa84f3f7defba8b579d4f5925f60c1" "5784d048e5a985627520beb8a101561b502a191b52fa401139f4dd20acb07607" "7eea50883f10e5c6ad6f81e153c640b3a288cd8dc1d26e4696f7d40f754cc703" "0e2a7e1e632dd38a8e0227d2227cb8849f877dd878afb8219cb6bcdd02068a52" "2cdc13ef8c76a22daa0f46370011f54e79bae00d5736340a5ddfe656a767fddf" "3c2f28c6ba2ad7373ea4c43f28fcf2eed14818ec9f0659b1c97d4e89c99e091e" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" "5a0eee1070a4fc64268f008a4c7abfda32d912118e080e18c3c865ef864d1bea" "79278310dd6cacf2d2f491063c4ab8b129fee2a498e4c25912ddaa6c3c5b621e" "c4bdbbd52c8e07112d1bfd00fee22bf0f25e727e95623ecb20c4fa098b74c1bd" "0a41da554c41c9169bdaba5745468608706c9046231bbbc0d155af1a12f32271" "8a379e7ac3a57e64de672dd744d4730b3bdb88ae328e8106f95cd81cbd44e0b6" "2035a16494e06636134de6d572ec47c30e26c3447eafeb6d3a9e8aee73732396" "8f5a7a9a3c510ef9cbb88e600c0b4c53cdcdb502cfe3eb50040b7e13c6f4e78e" "ddff22007104a1317014e48ff3d4911a83771a4ccf57185ccebf7f91339dbfb8" "0f7fa4835d02a927d7d738a0d2d464c38be079913f9d4aba9c97f054e67b8db9" "23b564cfb74d784c73167d7de1b9a067bcca00719f81e46d09ee71a12ef7ee82" "c3957b559cf3606c9a40777c5712671db3c7538e5d5ea9f63eb0729afeac832b" default))
 '(fci-rule-color "#BA45A3")
 '(global-emojify-mode t)
 '(jdee-db-active-breakpoint-face-colors (cons "#131033" "#1ea8fc"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#131033" "#a7da1e"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#131033" "#546A90"))
 '(objed-cursor-color "#e61f44")
 '(package-selected-packages
   '(monochrome-theme monospace-theme monospace-themes vertico icomplete-vertical password-store exwm modus-themes haskell-mode org-roam notmuch go-mode hindent visual-fill-column projectile prescient magit))
 '(rustic-ansi-faces
   ["#0c0a20" "#e61f44" "#a7da1e" "#ffd400" "#1ea8fc" "#ff2afc" "#42c6ff" "#f2f3f7"])
 '(send-mail-function 'sendmail-send-it)
 '(warning-suppress-types '((org-roam) (org-roam))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(completions-common-part ((t (:foreground "black" :weight bold))))
 '(completions-first-difference ((t (:underline "black" :weight semi-bold))))
 '(error ((t (:background "white" :foreground "#900000" :slant italic :weight bold))))
 '(font-lock-function-name-face ((t (:foreground "black" :weight semi-bold))))
 '(fringe ((t (:background "white" :foreground "black"))))
 '(highlight ((t (:background "#e0e0e0" :foreground "black"))))
 '(hl-line ((t (:background "#e0e0e0"))))
 '(icomplete-selected-match ((t (:weight bold))))
 '(magit-branch-remote ((t (:foreground "black" :underline t :slant oblique))))
 '(magit-section-heading ((t (:extend t :foreground "black" :weight bold))))
 '(message-cited-text-1 ((t (:inherit shadow))))
 '(minibuffer-prompt ((t (:foreground "black" :weight bold))))
 '(mode-line ((t (:background "#e0e0e0" :foreground "#303030" :box (:line-width (1 . -1) :style flat-button)))))
 '(mode-line-inactive ((t (:background "white" :foreground "#808080" :box (:line-width (1 . -1) :style flat-button)))))
 '(notmuch-search-date ((t (:foreground "black" :slant oblique :weight normal))))
 '(notmuch-search-matching-authors ((t (:foreground "black" :weight semi-bold))))
 '(notmuch-search-subject ((t (:foreground "#000000" :weight light))))
 '(notmuch-search-unread-face ((t (:inherit bold :underline t))))
 '(notmuch-tag-added ((t (:underline "black"))))
 '(notmuch-tag-face ((t (:inherit shadow :foreground "#505050" :weight normal))))
 '(notmuch-tag-unread ((t (:foreground "black" :weight bold))))
 '(notmuch-tree-match-author-face ((t (:foreground "black" :weight semi-bold))))
 '(notmuch-tree-match-tag-face ((t (:foreground "black" :weight bold))))
 '(org-agenda-done ((t (:foreground "ForestGreen" :underline t :slant oblique :weight bold))))
 '(org-agenda-structure ((t (:foreground "black"))))
 '(org-document-info ((t (:foreground "black"))))
 '(org-document-title ((t (:foreground "black" :weight bold))))
 '(org-done ((t (:foreground "green" :underline t :slant oblique :weight bold))))
 '(org-headline-done ((t (:extend t))))
 '(org-level-2 ((t (:extend nil :foreground "black" :weight normal :height 1.2))))
 '(org-level-3 ((t (:extend nil :foreground "black" :weight bold :height 1.0))))
 '(org-level-4 ((t (:extend nil :foreground "black" :weight normal :height 1.0))))
 '(org-link ((t (:foreground "#606060" :underline t :slant oblique))))
 '(org-scheduled ((t (:foreground "black" :slant oblique))))
 '(org-table ((t (:foreground "black"))))
 '(org-table-header ((t (:inherit org-table :foreground "Black" :weight semi-bold))))
 '(org-time-grid ((t (:foreground "#a0a0a0"))))
 '(org-todo ((t (:foreground "black" :underline t :slant oblique :weight bold))))
 '(org-upcoming-deadline ((t (:foreground "black" :weight semi-bold))))
 '(region ((t (:extend t :background "#bcbcbc" :foreground "black"))))
 '(secondary-selection ((t (:background "#e0e0e0" :foreground "black"))))
 '(warning ((t (:background "#b0b0b0" :foreground "black"))))
 '(whitespace-trailing ((t (:background "red1")))))
(put 'downcase-region 'disabled nil)
;;; early-init.el ends here
