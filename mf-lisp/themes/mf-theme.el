;;; mf-theme.el --- A bright Emacs 24 theme for your focused hacking sessions during the day

;; Copyright (C) 2011-2014 Xavier Noria
;; Copyright (C) 2021 Mario Forzanini
;;
;; Author: Xavier Noria <fxn@hashref.com>
;; Author: Mario Forzanini <mario.forzanini@studenti.unimi.it>
;;
;; Just throw this file into ~/.emacs.d and
;;
;; M-x load-theme RET mf RET
;;
;; or put in your init file
;;
;; (load-theme 'mf)
;;
;; This theme is based on monochrome-bright theme.
;;
;; Works with Emacs 28.

(deftheme mf
  "Black on white theme4 for your focused hacking sessions during the day.")

(custom-theme-set-faces 'mf
						'(default ((t (:foreground "black" :background "white"))))
						'(cursor ((t (:background "black"))))

						;; Highlighting faces
						'(fringe ((t (:foreground "black" :background "white"))))
						'(highlight ((t (:foreground "black" :background "#e0e0e0"))))
						'(hl-line ((t (:background "#e0e0e0"))))
						'(isearch ((t (:foreground "#f0f0f0" :background "#006800"))))
						'(lazy-highlight ((t (:foreground "white" :background "#303030"))))
						'(linum ((t (:foreground "#303030" :slant italic))))
						'(match ((t (:background "green"))))
						'(region ((t (:extend t :foreground "black" :background "#bcbcbc"))))
						'(secondary-selection ((t (:foreground: "black" :background "#e0e0e0"))))
						'(trailing-whitespace ((t (:background "red"))))

						;; Button and link faces
						'(link ((t (:underline t :foreground "#303030"))))
						'(link-visited ((t (:underline t :foreground "#303030"))))

						;; Company
						'(company-scrollbar-bg ((t (:background "white"))))
						'(company-scrollbar-fg ((t (:foreground "black"))))
						'(company-tooltip-annotation ((t (:foreground "#b0b0b0"))))
						'(company-tooltip-common ((t (:foreground "black" :weight semi-bold))))
						'(company-tooltip-selection ((t (:foreground "black" :background "#808080"))))

						;; Corfu
						'(corfu-current ((t (:foreground "black" :background "#b3b3b3"))))
						'(corfu-bar ((t (:background "black"))))
						'(corfu-background ((t (:background "white"))))
						'(corfu-border ((t (:background "#b3b3b3"))))

						;; Erc
						'(erc-current-nick-face ((t (:foreground "black" :weight bold))))
						'(erc-error-face ((t (:inherit error))))
						'(erc-keyword-face ((t (:foreground "black" :underline t :weight bold))))
						'(erc-my-nick-face ((t (:inherit erc-current-nick-face))))
						'(erc-notice-face ((t (:foreground "#b0b0b0" :weight bold))))
						'(erc-prompt-face ((t (:foreground "Black" :underline t :weight bold))))
						'(erc-timestamp-face ((t (:foreground "#b0b0b0" :weight bold))))

						;; Escape and prompt faces
						'(minibuffer-prompt ((t (:weight bold :foreground "#303030"))))
						'(escape-glyph ((t (:foreground "#303030"))))
						'(error ((t (:weight bold :slant italic :foreground "#900000"))))
						'(warning ((t (:background "#b0b0b0" :foreground "black"))))
						'(success ((t (:background "#303030" :foreground "green"))))

						;; EShell
						'(eshell-prompt ((t (:foreground "black" :bold t))))
						'(eshell-ls-archive ((t (:inherit eshell-ls-unreadable))))
						'(eshell-ls-backup ((t (:inherit eshell-ls-unreadable))))
						'(eshell-ls-clutter ((t (:inherit eshell-ls-unreadable))))
						'(eshell-ls-directory ((t (:foreground "#303030" :bold t))))
						'(eshell-ls-executable ((t (:inherit eshell-ls-unreadable))))
						'(eshell-ls-missing ((t (:inherit eshell-ls-unreadable))))
						'(eshell-ls-product ((t (:inherit eshell-ls-unreadable))))
						'(eshell-ls-readonly ((t (:inherit eshell-ls-unreadable))))
						'(eshell-ls-special ((t (:inherit eshell-ls-unreadable))))
						'(eshell-ls-symlink ((t (:inherit eshell-ls-unreadable))))

						;; Font lock faces
						'(font-lock-builtin-face ((t (:foreground "#303030"))))
						'(font-lock-comment-face ((t (:slant italic :foreground "#b3b3b3"))))
						'(font-lock-constant-face ((t (:weight bold :foreground "#303030"))))
						'(font-lock-function-name-face ((t (:foreground "black" :weight semi-bold))))
						'(font-lock-keyword-face ((t (:weight bold :foreground "black"))))
						'(font-lock-string-face ((t (:foreground "#808080"))))
						'(font-lock-type-face ((t (:weight bold :foreground "#303030"))))
						'(font-lock-variable-name-face ((t (:weight bold :foreground "#808080" :slant oblique))))
						'(font-lock-warning-face ((t (:foreground "#b0b0b0" :underline (:color foreground-color :style wave)))))

						;; Gnus faces
						'(gnus-group-news-1 ((t (:weight bold :foreground "#303030"))))
						'(gnus-group-news-1-low ((t (:foreground "#303030"))))
						'(gnus-group-news-2 ((t (:weight bold :foreground "#303030"))))
						'(gnus-group-news-2-low ((t (:foreground "#303030"))))
						'(gnus-group-news-3 ((t (:weight bold :foreground "#303030"))))
						'(gnus-group-news-3-low ((t (:foreground "#303030"))))
						'(gnus-group-news-4 ((t (:weight bold :foreground "#303030"))))
						'(gnus-group-news-4-low ((t (:foreground "#303030"))))
						'(gnus-group-news-5 ((t (:weight bold :foreground "#b3b3b3"))))
						'(gnus-group-news-5-low ((t (:foreground "#b3b3b3"))))
						'(gnus-group-news-low ((t (:foreground "#303030"))))
						'(gnus-group-mail-1 ((t (:weight bold :foreground "#303030"))))
						'(gnus-group-mail-1-low ((t (:foreground "#303030"))))
						'(gnus-group-mail-2 ((t (:weight bold :foreground "#303030"))))
						'(gnus-group-mail-2-low ((t (:foreground "#303030"))))
						'(gnus-group-mail-3 ((t (:weight bold :foreground "#303030"))))
						'(gnus-group-mail-3-low ((t (:foreground "#303030"))))
						'(gnus-group-mail-low ((t (:foreground "#303030"))))
						'(gnus-header-content ((t (:foreground "#303030"))))
						'(gnus-header-from ((t (:weight bold :foreground "#303030"))))
						'(gnus-header-subject ((t (:foreground "#303030"))))
						'(gnus-header-name ((t (:foreground "#303030"))))
						'(gnus-header-newsgroups ((t (:foreground "#303030"))))

						;; helm
						'(helm-header ((t (:foreground "#303030" :background "white" :underline nil :box nil))))
						'(helm-source-header
						  ((t (:foreground "#303030"
										   :underline nil
										   :weight bold
										   :box (:line-width 1 :style released-button)))))
						'(helm-selection ((t (:underline t :foreground "#303030"))))
						'(helm-visible-mark ((t (:foreground "#303030" :background "white"))))
						'(helm-candidate-number ((t (:foreground "#303030" :background "white"))))
						'(helm-separator ((t (:foreground "#303030" :background "white"))))
						'(helm-time-zone-current ((t (:foreground "#303030" :background "white"))))
						'(helm-time-zone-home ((t (:foreground "#303030" :background "white"))))
						'(helm-bookmark-addressbook ((t (:foreground "#303030" :background "white"))))
						'(helm-bookmark-directory ((t (:foreground nil :background nil :inherit helm-ff-directory))))
						'(helm-bookmark-file ((t (:foreground nil :background nil :inherit helm-ff-file))))
						'(helm-bookmark-gnus ((t (:foreground "#303030" :background "white"))))
						'(helm-bookmark-info ((t (:foreground "#303030" :background "white"))))
						'(helm-bookmark-man ((t (:foreground "#303030" :background "white"))))
						'(helm-bookmark-w3m ((t (:foreground "#303030" :background "white"))))
						'(helm-buffer-not-saved ((t (:foreground "#303030" :background "white"))))
						'(helm-buffer-process ((t (:foreground "#303030" :background "white"))))
						'(helm-buffer-saved-out ((t (:foreground "#303030" :background "white"))))
						'(helm-buffer-size ((t (:foreground "#303030" :background "white"))))
						'(helm-ff-directory ((t (:foreground "#303030" :background "white" :weight bold))))
						'(helm-ff-file ((t (:foreground "#303030" :background "white" :weight normal))))
						'(helm-ff-executable ((t (:foreground "#303030" :background "white" :weight normal))))
						'(helm-ff-invalid-symlink ((t (:foreground "white" :background "white" :weight bold))))
						'(helm-ff-symlink ((t (:foreground "#303030" :background "white" :weight bold))))
						'(helm-ff-prefix ((t (:foreground "#303030" :background "white" :weight normal))))
						'(helm-grep-cmd-line ((t (:foreground "#303030" :background "white"))))
						'(helm-grep-file ((t (:foreground "#303030" :background "white"))))
						'(helm-grep-finish ((t (:foreground "#303030" :background "white"))))
						'(helm-grep-lineno ((t (:foreground "#303030" :background "white"))))
						'(helm-grep-match ((t (:foreground nil :background nil :inherit helm-match))))
						'(helm-grep-running ((t (:foreground "#303030" :background "white"))))
						'(helm-moccur-buffer ((t (:foreground "#303030" :background "white"))))
						'(helm-mu-contacts-address-face ((t (:foreground "#303030" :background "white"))))
						'(helm-mu-contacts-name-face ((t (:foreground "#303030" :background "white"))))

						;; ido
						'(ido-first-match ((t (:foreground "#303030"))))
						'(ido-only-match ((t (:underline "#303030" :foreground "#303030"))))
						'(ido-subdir ((t (:weight bold :foreground "black"))))

						;; Magit
						'(magit-branch-remote ((t (:foreground "black" :underline t :slant oblique))))
						'(magit-section-heading ((t (:extend t :foreground "black" :weight bold))))

						;; Message faces
						'(message-header-name ((t (:foreground "#303030"))))
						'(message-header-cc ((t (:foreground "#303030"))))
						'(message-header-other ((t (:foreground "#303030"))))
						'(message-header-subject ((t (:foreground "#303030"))))
						'(message-header-to ((t (:weight bold :foreground "#303030"))))
						'(message-header-xheader ((t (:slant oblique :foreground "#303030"))))
						'(message-cited-text ((t (:inherit shadow))))
						'(message-cited-text-1 ((t (:inherit message-cited-text))))
						'(message-cited-text-2 ((t (:inherit message-cited-text))))
						'(message-cited-text-3 ((t (:inherit message-cited-text))))
						'(message-cited-text-4 ((t (:inherit message-cited-text))))
						'(message-separator ((t (:weight bold :foreground "#303030"))))

						;; Minibuffer
						'(minibuffer-prompt ((t (:foreground "black" :weight bold))))
						'(completions-common-part ((t (:foreground "black" :weight bold))))
						'(completions-first-difference ((t (:underline "black" :weight semi-bold))))

						;; Mini-modeline
						;; Mini- modeline
						'(mini-modeline-mode-line ((t (:height 0.14 :background "black"))))
						'(mini-modeline-mode-line-inactive ((t (:height 0.14 :background "white"))))

						;; Mode line faces
						'(mode-line ((t (:background "#e0e0e0" :foreground "#303030"
													 :box (:line-width 4 :color "#e0e0e0" :style flat-button)))))
						'(mode-line-inactive ((t (:background "white" :foreground "#808080"
															  :box (:line-width 4 :color "white" :style flat-button)))))

						;; MuMaMo
						'(mumamo-background-chunk-major ((t (:background "white"))))
						'(mumamo-background-chunk-submode1 ((t (:background "white"))))
						'(mumamo-background-chunk-submode2 ((t (:background "white"))))
						'(mumamo-background-chunk-submode3 ((t (:background "white"))))
						'(mumamo-background-chunk-submode4 ((t (:background "white"))))
						'(mumamo-border-face-in ((t (:slant unspecified :underline unspecified
															:weight bold :foreground "black"))))
						'(mumamo-border-face-out ((t (:slant unspecified :underline unspecified
															 :weight bold :foreground "black"))))

						;; Notmuch
						'(notmuch-search-date ((t (:foreground "black" :slant oblique :weight normal))))
						'(notmuch-search-matching-authors ((t (:foreground "black" :weight semi-bold))))
						'(notmuch-search-subject ((t (:foreground "black" :weight light))))
						'(notmuch-search-unread-face ((t (:inherit bold :underline t))))
						'(notmuch-tag-added ((t (:underline "black"))))
						'(notmuch-tag-face ((t (:inherit shadow :foreground "#505050" :weight normal))))
						'(notmuch-tag-unread ((t (:foreground "black" :weight bold))))
						'(notmuch-tree-match-author-face ((t (:foreground "black" :weight semi-bold))))
						'(notmuch-tree-match-tag-face ((t (:foreground "black" :weight bold))))

						;; Orderless
						'(orderless-match-face-0 ((t (:foreground "black" :weight bold))))
						'(orderless-match-face-1 ((t (:inherit orderless-match-face-0))))
						'(orderless-match-face-2 ((t (:inherit orderless-match-face-0))))
						'(orderless-match-face-3 ((t (:inherit orderless-match-face-0))))
						'(orderless-match-face-4 ((t (:inherit orderless-match-face-0))))

						;; Org-mode
						'(org-agenda-done ((t (:foreground "ForestGreen" :underline t :slant oblique :weight bold))))
						'(org-agenda-structure ((t (:foreground "black"))))
						'(org-block ((t (:inherit shadow :extend t :background "#eeeeee"))))
						'(org-document-info ((t (:foreground "black"))))
						'(org-document-title ((t (:foreground "black" :weight bold))))
						'(org-done ((t (:foreground "green" :underline t :slant oblique :weight bold))))
						'(org-headline-done ((t (:extend t))))
						'(org-level-1 ((t (:bold t :foreground "#303030" :height 1.5))))
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

						;; Org-roam
						'(org-roam-preview-heading ((t (:inherit org-block))))
						'(org-roam-preview-heading-highlight ((t (:inherit org-roam-preview-heading))))

						;; Show-paren
						'(show-paren-match ((t (:background "#303030"))))
						'(show-paren-mismatch ((t (:background "red"))))

						;; Speedbar
						'(speedbar-button-face ((t (:foreground "#b3b3b3"))))
						'(speedbar-file-face ((t (:foreground "#303030"))))
						'(speedbar-directory-face ((t (:weight bold :foreground "black"))))
						'(speedbar-tag-face ((t (:foreground "#b3b3b3"))))
						'(speedbar-selected-face ((t (:underline "#b3b3b3" :foreground "#303030"))))
						'(speedbar-highlight-face ((t (:weight bold :background "white" :foreground "black"))))

						;; Whitespace-mode
						'(whitespace-empty ((t (:background unspecified :foreground "red"))))
						'(whitespace-line ((t (:background "#b3b3b3" :foreground "black"))))
						'(whitespace-trailing ((t (:background "red1")))))

(provide-theme 'mf)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; mf-theme.el ends here
