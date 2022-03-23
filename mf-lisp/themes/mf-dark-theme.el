;;; mf-dark-theme.el --- A bright Emacs 24 theme for your focused hacking sessions during the day

;; Copyright (C) 2011-2014 Xavier Noria
;; Copyright (C) 2021 Mario Forzanini
;;
;; Author: Xavier Noria <fxn@hashref.com>
;; Author: Mario Forzanini <mario.forzanini@studenti.unimi.it>
;;
;; Just throw this file into ~/.emacs.d and
;;
;; M-x load-theme RET mf-dark RET
;;
;; or put in your init file
;;
;; (load-theme 'mf-dark t)
;;
;; This theme is based on monochrome theme.
;;
;; Works with Emacs 28.

(deftheme mf-dark
  "White on black theme for your focused hacking sessions during the night.")

(custom-theme-set-faces 'mf-dark
			'(default ((t (:foreground "white" :background "#1e1e1e"))))
			'(cursor ((t (:background "white"))))

			;; Highlighting faces
			'(bookmark-face ((t (:foreground "black" :background "#cccccc"))))
			'(fringe ((t (:foreground "white" :background "#1e1e1e"))))
			'(highlight ((t (:foreground "black" :background "white"))))
			'(hl-line ((t (:background "#303030"))))
			'(isearch ((t (:foreground "#f0f0f0" :background "#006800"))))
			'(lazy-highlight ((t (:foreground "black" :background "#303030"))))
			'(linum ((t (:foreground "#f0f0f0" :slant italic))))
			'(match ((t (:background "green"))))
			'(region ((t (:extend t :foreground "black" :background "white"))))
			'(secondary-selection ((t (:foreground: "white" :background "#303030"))))
			'(trailing-whitespace ((t (:background "red"))))

			;; Button and link faces
			'(link ((t (:underline t :foreground "#bababa"))))
			'(link-visited ((t (:underline t :foreground "#bababa"))))

			;; Company
			'(company-scrollbar-bg ((t (:background "#1e1e1e"))))
			'(company-scrollbar-fg ((t (:foreground "white"))))
			'(company-tooltip-annotation ((t (:foreground "#b0b0b0"))))
			'(company-tooltip-common ((t (:foreground "white" :weight semi-bold))))
			'(company-tooltip-selection ((t (:foreground "white" :background "#808080"))))

			;; Corfu
			'(corfu-current ((t (:foreground "white" :background "#b3b3b3"))))
			'(corfu-bar ((t (:background "white"))))
			'(corfu-background ((t (:background "#1e1e1e"))))
			'(corfu-border ((t (:background "#b3b3b3"))))

			;; Erc
			'(erc-current-nick-face ((t (:foreground "white" :weight bold))))
			'(erc-error-face ((t (:inherit error))))
			'(erc-keyword-face ((t (:foreground "white" :underline t :weight bold))))
			'(erc-my-nick-face ((t (:inherit erc-current-nick-face))))
			'(erc-notice-face ((t (:foreground "#b0b0b0" :weight bold))))
			'(erc-prompt-face ((t (:foreground "white" :underline t :weight bold))))
			'(erc-timestamp-face ((t (:foreground "#b0b0b0" :weight bold))))

			;; Escape and prompt faces
			'(minibuffer-prompt ((t (:weight bold :foreground "#bababa"))))
			'(escape-glyph ((t (:foreground "#bababa"))))
			'(error ((t (:weight bold :slant italic :foreground "#900000"))))
			'(warning ((t (:foreground "white" :background "#1e1e1e" :inherit font-lock-warning-face))))
			'(success ((t (:foreground "green"))))

			;; EShell
			'(eshell-prompt ((t (:foreground "white" :bold t))))
			'(eshell-ls-archive ((t (:inherit eshell-ls-unreadable))))
			'(eshell-ls-backup ((t (:inherit eshell-ls-unreadable))))
			'(eshell-ls-clutter ((t (:inherit eshell-ls-unreadable))))
			'(eshell-ls-directory ((t (:foreground "#bababa" :bold t))))
			'(eshell-ls-executable ((t (:inherit eshell-ls-unreadable))))
			'(eshell-ls-missing ((t (:inherit eshell-ls-unreadable))))
			'(eshell-ls-product ((t (:inherit eshell-ls-unreadable))))
			'(eshell-ls-readonly ((t (:inherit eshell-ls-unreadable))))
			'(eshell-ls-special ((t (:inherit eshell-ls-unreadable))))
			'(eshell-ls-symlink ((t (:inherit eshell-ls-unreadable))))

			;; Font lock faces
			'(font-lock-builtin-face ((t (:foreground "#bababa"))))
			'(font-lock-comment-face ((t (:slant italic :foreground "#b3b3b3"))))
			'(font-lock-constant-face ((t (:weight bold :foreground "#bababa"))))
			'(font-lock-function-name-face ((t (:foreground "white" :weight semi-bold))))
			'(font-lock-keyword-face ((t (:weight bold :foreground "white"))))
			'(font-lock-string-face ((t (:foreground "#808080"))))
			'(font-lock-type-face ((t (:weight bold :foreground "#bababa"))))
			'(font-lock-variable-name-face ((t (:weight bold :foreground "#808080" :slant oblique))))
			'(font-lock-warning-face ((t (:foreground "#b0b0b0" :underline (:color foreground-color :style wave)))))

			;; Gnus faces
			'(gnus-group-news-1 ((t (:weight bold :foreground "#bababa"))))
			'(gnus-group-news-1-low ((t (:foreground "#bababa"))))
			'(gnus-group-news-2 ((t (:weight bold :foreground "#bababa"))))
			'(gnus-group-news-2-low ((t (:foreground "#bababa"))))
			'(gnus-group-news-3 ((t (:weight bold :foreground "#bababa"))))
			'(gnus-group-news-3-low ((t (:foreground "#bababa"))))
			'(gnus-group-news-4 ((t (:weight bold :foreground "#bababa"))))
			'(gnus-group-news-4-low ((t (:foreground "#bababa"))))
			'(gnus-group-news-5 ((t (:weight bold :foreground "#b3b3b3"))))
			'(gnus-group-news-5-low ((t (:foreground "#b3b3b3"))))
			'(gnus-group-news-low ((t (:foreground "#bababa"))))
			'(gnus-group-mail-1 ((t (:weight bold :foreground "#bababa"))))
			'(gnus-group-mail-1-low ((t (:foreground "#bababa"))))
			'(gnus-group-mail-2 ((t (:weight bold :foreground "#bababa"))))
			'(gnus-group-mail-2-low ((t (:foreground "#bababa"))))
			'(gnus-group-mail-3 ((t (:weight bold :foreground "#bababa"))))
			'(gnus-group-mail-3-low ((t (:foreground "#bababa"))))
			'(gnus-group-mail-low ((t (:foreground "#bababa"))))
			'(gnus-header-content ((t (:foreground "#bababa"))))
			'(gnus-header-from ((t (:weight bold :foreground "#bababa"))))
			'(gnus-header-subject ((t (:foreground "#bababa"))))
			'(gnus-header-name ((t (:foreground "#bababa"))))
			'(gnus-header-newsgroups ((t (:foreground "#bababa"))))

			;; helm
			'(helm-header ((t (:foreground "#bababa" :background "#1e1e1e" :underline nil :box nil))))
			'(helm-source-header
			  ((t (:foreground "#bababa"
					   :underline nil
					   :weight bold
					   :box (:line-width 1 :style released-button)))))
			'(helm-selection ((t (:underline t :foreground "#bababa"))))
			'(helm-visible-mark ((t (:foreground "#bababa" :background "#1e1e1e"))))
			'(helm-candidate-number ((t (:foreground "#bababa" :background "#1e1e1e"))))
			'(helm-separator ((t (:foreground "#bababa" :background "#1e1e1e"))))
			'(helm-time-zone-current ((t (:foreground "#bababa" :background "#1e1e1e"))))
			'(helm-time-zone-home ((t (:foreground "#bababa" :background "#1e1e1e"))))
			'(helm-bookmark-addressbook ((t (:foreground "#bababa" :background "#1e1e1e"))))
			'(helm-bookmark-directory ((t (:foreground nil :background nil :inherit helm-ff-directory))))
			'(helm-bookmark-file ((t (:foreground nil :background nil :inherit helm-ff-file))))
			'(helm-bookmark-gnus ((t (:foreground "#bababa" :background "#1e1e1e"))))
			'(helm-bookmark-info ((t (:foreground "#bababa" :background "#1e1e1e"))))
			'(helm-bookmark-man ((t (:foreground "#bababa" :background "#1e1e1e"))))
			'(helm-bookmark-w3m ((t (:foreground "#bababa" :background "#1e1e1e"))))
			'(helm-buffer-not-saved ((t (:foreground "#bababa" :background "#1e1e1e"))))
			'(helm-buffer-process ((t (:foreground "#bababa" :background "#1e1e1e"))))
			'(helm-buffer-saved-out ((t (:foreground "#bababa" :background "#1e1e1e"))))
			'(helm-buffer-size ((t (:foreground "#bababa" :background "#1e1e1e"))))
			'(helm-ff-directory ((t (:foreground "#bababa" :background "#1e1e1e" :weight bold))))
			'(helm-ff-file ((t (:foreground "#bababa" :background "#1e1e1e" :weight normal))))
			'(helm-ff-executable ((t (:foreground "#bababa" :background "#1e1e1e" :weight normal))))
			'(helm-ff-invalid-symlink ((t (:foreground "black" :background "#1e1e1e" :weight bold))))
			'(helm-ff-symlink ((t (:foreground "#bababa" :background "#1e1e1e" :weight bold))))
			'(helm-ff-prefix ((t (:foreground "#bababa" :background "#1e1e1e" :weight normal))))
			'(helm-grep-cmd-line ((t (:foreground "#bababa" :background "#1e1e1e"))))
			'(helm-grep-file ((t (:foreground "#bababa" :background "#1e1e1e"))))
			'(helm-grep-finish ((t (:foreground "#bababa" :background "#1e1e1e"))))
			'(helm-grep-lineno ((t (:foreground "#bababa" :background "#1e1e1e"))))
			'(helm-grep-match ((t (:foreground nil :background nil :inherit helm-match))))
			'(helm-grep-running ((t (:foreground "#bababa" :background "#1e1e1e"))))
			'(helm-moccur-buffer ((t (:foreground "#bababa" :background "#1e1e1e"))))
			'(helm-mu-contacts-address-face ((t (:foreground "#bababa" :background "#1e1e1e"))))
			'(helm-mu-contacts-name-face ((t (:foreground "#bababa" :background "#1e1e1e"))))

			;; ido
			'(ido-first-match ((t (:foreground "#bababa"))))
			'(ido-only-match ((t (:underline "#bababa" :foreground "#bababa"))))
			'(ido-subdir ((t (:weight bold :foreground "white"))))

			;; Magit
			'(magit-branch-remote ((t (:foreground "white" :underline t :slant oblique))))
			'(magit-section-heading ((t (:extend t :foreground "white" :weight bold))))

			;; Message faces
			'(message-header-name ((t (:foreground "#bababa"))))
			'(message-header-cc ((t (:foreground "#bababa"))))
			'(message-header-other ((t (:foreground "#bababa"))))
			'(message-header-subject ((t (:foreground "#bababa"))))
			'(message-header-to ((t (:weight bold :foreground "#bababa"))))
			'(message-header-xheader ((t (:slant oblique :foreground "#bababa"))))
			'(message-cited-text ((t (:inherit shadow))))
			'(message-cited-text-1 ((t (:inherit message-cited-text))))
			'(message-cited-text-2 ((t (:inherit message-cited-text))))
			'(message-cited-text-3 ((t (:inherit message-cited-text))))
			'(message-cited-text-4 ((t (:inherit message-cited-text))))
			'(message-separator ((t (:weight bold :foreground "#bababa"))))

			;; Minibuffer
			'(minibuffer-prompt ((t (:foreground "white" :weight bold))))
			'(completions-common-part ((t (:foreground "white" :weight bold))))
			'(completions-first-difference ((t (:underline "white" :weight semi-bold))))

			;; Mode line faces
			'(mode-line ((t (:background "#1e1e1e" :foreground "white"
						     :box (:line-width 4 :color "#1e1e1e" :style flat-button)))))
			'(mode-line-inactive ((t (:background "#1e1e1e" :foreground "#808080"
							      :box (:line-width 4 :color "black")))))

			;; Mini- modeline
			'(mini-modeline-mode-line ((t (:height 0.14 :background "white"))))
			'(mini-modeline-mode-line-inactive ((t (:height 0.14 :background "#1e1e1e"))))

			;; MuMaMo
			'(mumamo-background-chunk-major ((t (:background "#1e1e1e"))))
			'(mumamo-background-chunk-submode1 ((t (:background "#1e1e1e"))))
			'(mumamo-background-chunk-submode2 ((t (:background "#1e1e1e"))))
			'(mumamo-background-chunk-submode3 ((t (:background "#1e1e1e"))))
			'(mumamo-background-chunk-submode4 ((t (:background "#1e1e1e"))))
			'(mumamo-border-face-in ((t (:slant unspecified :underline unspecified
							    :weight bold :foreground "white"))))
			'(mumamo-border-face-out ((t (:slant unspecified :underline unspecified
							     :weight bold :foreground "white"))))

			;; Notmuch
			'(notmuch-search-date ((t (:foreground "white" :slant oblique :weight normal))))
			'(notmuch-search-matching-authors ((t (:foreground "white" :weight semi-bold))))
			'(notmuch-search-subject ((t (:foreground "white" :weight light))))
			'(notmuch-search-unread-face ((t (:inherit bold :underline t))))
			'(notmuch-tag-added ((t (:underline "white"))))
			'(notmuch-tag-face ((t (:inherit shadow :foreground "#505050" :weight normal))))
			'(notmuch-tag-unread ((t (:foreground "white" :weight bold))))
			'(notmuch-tree-match-author-face ((t (:foreground "white" :weight semi-bold))))
			'(notmuch-tree-match-tag-face ((t (:foreground "white" :weight bold))))

			;; Orderless
			'(orderless-match-face-0 ((t (:foreground "white" :underline t  :weight bold))))
			'(orderless-match-face-1 ((t (:inherit orderless-match-face-0))))
			'(orderless-match-face-2 ((t (:inherit orderless-match-face-0))))
			'(orderless-match-face-3 ((t (:inherit orderless-match-face-0))))
			'(orderless-match-face-4 ((t (:inherit orderless-match-face-0))))

			;; Org-mode
			'(org-agenda-done ((t (:foreground "ForestGreen" :underline t :slant oblique :weight bold))))
			'(org-agenda-structure ((t (:foreground "white"))))
			'(org-agenda-dimmed-todo-face ((t (:foreground "white"))))
			'(org-block ((t (:inherit shadow :extend t :background "#1e1e1e"))))
			'(org-date ((t (:underline t :foreground "#b0b0b0"))))
			'(org-document-info ((t (:foreground "white"))))
			'(org-document-title ((t (:foreground "white" :weight bold))))
			'(org-done ((t (:foreground "green" :underline t :slant oblique :weight bold))))
			'(org-headline-done ((t (:extend t))))
			'(org-level-1 ((t (:bold t :foreground "#bababa" :height 1.5))))
			'(org-level-2 ((t (:extend nil :foreground "white" :weight normal :height 1.2))))
			'(org-level-3 ((t (:extend nil :foreground "white" :weight bold :height 1.0))))
			'(org-level-4 ((t (:extend nil :foreground "white" :weight normal :height 1.0))))
			'(org-link ((t (:foreground "#b0b0b0" :underline t :slant oblique))))
			'(org-scheduled ((t (:foreground "white" :slant oblique))))
			'(org-table ((t (:foreground "white"))))
			'(org-table-header ((t (:inherit org-table :foreground "white" :weight semi-bold))))
			'(org-time-grid ((t (:foreground "#a0a0a0"))))
			'(org-todo ((t (:foreground "white" :underline t :slant oblique :weight bold))))
			'(org-upcoming-deadline ((t (:foreground "white" :weight semi-bold))))

			;; Org-roam
			'(org-roam-preview-heading ((t (:inherit org-block))))
			'(org-roam-preview-heading-highlight ((t (:inherit org-roam-preview-heading))))

			;; Show-paren
			'(show-paren-match ((t (:background "#a0a0a0"))))
			'(show-paren-mismatch ((t (:background "red"))))

			;; Speedbar
			'(speedbar-button-face ((t (:foreground "#b3b3b3"))))
			'(speedbar-file-face ((t (:foreground "#bababa"))))
			'(speedbar-directory-face ((t (:weight bold :foreground "white"))))
			'(speedbar-tag-face ((t (:foreground "#b3b3b3"))))
			'(speedbar-selected-face ((t (:underline "#b3b3b3" :foreground "#bababa"))))
			'(speedbar-highlight-face ((t (:weight bold :background "#1e1e1e" :foreground "white"))))

			;; Vertico
			'(vertico-current ((t (:underline "white" :background "#1e1e1e" :foreground "white"))))

			;; Whitespace-mode
			'(whitespace-empty ((t (:background unspecified :foreground "red"))))
			'(whitespace-line ((t (:background "#b3b3b3" :foreground "white"))))
			'(whitespace-trailing ((t (:background "red1")))))

(provide-theme 'mf-dark)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; mf-dark-theme.el ends here
