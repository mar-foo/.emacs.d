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

(defvar mf-default-bg
  "white")

(defvar mf-default-fg
  "black")

(defvar mf-light-grey
  "#e0e0e0")

(defvar mf-dark-grey
  "#303030")

(defvar mf-medium-grey
  "#b3b3b3")

(custom-theme-set-faces 'mf
			`(default ((t (:foreground ,mf-default-fg :background ,mf-default-bg))))
			`(cursor ((t (:background ,mf-default-fg))))

			;; Highlighting faces
			`(fringe ((t (:foreground ,mf-default-fg :background ,mf-default-bg))))
			`(highlight ((t (:foreground ,mf-default-fg :background ,mf-light-grey))))
			`(hl-line ((t (:background ,mf-light-grey))))
			'(isearch ((t (:foreground "#f0f0f0" :background "#006800"))))
			`(lazy-highlight ((t (:foreground "white" :background ,mf-dark-grey))))
			`(linum ((t (:foreground ,mf-dark-grey :slant italic))))
			'(match ((t (:background "green"))))
			`(region ((t (:extend t :foreground ,mf-default-fg :background "#bcbcbc"))))
			`(secondary-selection ((t (:foreground: "black" :background ,mf-light-grey))))
			'(trailing-whitespace ((t (:background "red"))))

			;; Button and link faces
			`(link ((t (:underline t :foreground ,mf-dark-grey))))
			`(link-visited ((t (:underline t :foreground ,mf-dark-grey))))

			;; Company
			`(company-scrollbar-bg ((t (:background ,mf-default-bg))))
			`(company-scrollbar-fg ((t (:foreground ,mf-default-fg))))
			`(company-tooltip-annotation ((t (:foreground "#b0b0b0"))))
			`(company-tooltip-common ((t (:foreground ,mf-default-fg :weight semi-bold))))
			`(company-tooltip-selection ((t (:foreground ,mf-default-fg :background "#808080"))))

			;; Corfu
			`(corfu-current ((t (:foreground ,mf-default-fg :background ,mf-medium-grey))))
			`(corfu-bar ((t (:background ,mf-default-fg))))
			`(corfu-background ((t (:background ,mf-default-bg))))
			`(corfu-border ((t (:background ,mf-medium-grey))))

			;; Erc
			`(erc-current-nick-face ((t (:foreground ,mf-default-fg :weight bold))))
			'(erc-error-face ((t (:inherit error))))
			`(erc-keyword-face ((t (:foreground ,mf-default-fg :underline t :weight bold))))
			'(erc-my-nick-face ((t (:inherit erc-current-nick-face))))
			'(erc-notice-face ((t (:foreground "#b0b0b0" :weight bold))))
			`(erc-prompt-face ((t (:foreground ,mf-default-fg :underline t :weight bold))))
			'(erc-timestamp-face ((t (:foreground "#b0b0b0" :weight bold))))

			;; Escape and prompt faces
			`(minibuffer-prompt ((t (:weight bold :foreground ,mf-dark-grey))))
			`(escape-glyph ((t (:foreground ,mf-dark-grey))))
			'(error ((t (:weight bold :slant italic :foreground "#900000"))))
			`(warning ((t (:background "#b0b0b0" :foreground ,mf-default-fg))))
			`(success ((t (:background ,mf-dark-grey :foreground "green"))))

			;; EShell
			`(eshell-prompt ((t (:foreground ,mf-default-fg :bold t))))
			'(eshell-ls-archive ((t (:inherit eshell-ls-unreadable))))
			'(eshell-ls-backup ((t (:inherit eshell-ls-unreadable))))
			'(eshell-ls-clutter ((t (:inherit eshell-ls-unreadable))))
			`(eshell-ls-directory ((t (:foreground ,mf-dark-grey :bold t))))
			'(eshell-ls-executable ((t (:inherit eshell-ls-unreadable))))
			'(eshell-ls-missing ((t (:inherit eshell-ls-unreadable))))
			'(eshell-ls-product ((t (:inherit eshell-ls-unreadable))))
			'(eshell-ls-readonly ((t (:inherit eshell-ls-unreadable))))
			'(eshell-ls-special ((t (:inherit eshell-ls-unreadable))))
			'(eshell-ls-symlink ((t (:inherit eshell-ls-unreadable))))

			;; Font lock faces
			`(font-lock-builtin-face ((t (:foreground ,mf-dark-grey))))
			`(font-lock-comment-face ((t (:slant italic :foreground ,mf-medium-grey))))
			`(font-lock-constant-face ((t (:weight bold :foreground ,mf-dark-grey))))
			`(font-lock-function-name-face ((t (:foreground ,mf-default-fg :weight semi-bold))))
			`(font-lock-keyword-face ((t (:weight bold :foreground ,mf-default-fg))))
			'(font-lock-string-face ((t (:foreground "#808080"))))
			`(font-lock-type-face ((t (:weight bold :foreground ,mf-dark-grey))))
			'(font-lock-variable-name-face ((t (:weight bold :foreground "#808080" :slant oblique))))
			'(font-lock-warning-face ((t (:foreground "#b0b0b0" :underline (:color foreground-color :style wave)))))

			;; Gnus faces
			`(gnus-group-news-1 ((t (:weight bold :foreground ,mf-dark-grey))))
			`(gnus-group-news-1-low ((t (:foreground ,mf-dark-grey))))
			`(gnus-group-news-2 ((t (:weight bold :foreground ,mf-dark-grey))))
			`(gnus-group-news-2-low ((t (:foreground ,mf-dark-grey))))
			`(gnus-group-news-3 ((t (:weight bold :foreground ,mf-dark-grey))))
			`(gnus-group-news-3-low ((t (:foreground ,mf-dark-grey))))
			`(gnus-group-news-4 ((t (:weight bold :foreground ,mf-dark-grey))))
			`(gnus-group-news-4-low ((t (:foreground ,mf-dark-grey))))
			`(gnus-group-news-5 ((t (:weight bold :foreground ,mf-medium-grey))))
			`(gnus-group-news-5-low ((t (:foreground ,mf-medium-grey))))
			`(gnus-group-news-low ((t (:foreground ,mf-dark-grey))))
			`(gnus-group-mail-1 ((t (:weight bold :foreground ,mf-dark-grey))))
			`(gnus-group-mail-1-low ((t (:foreground ,mf-dark-grey))))
			`(gnus-group-mail-2 ((t (:weight bold :foreground ,mf-dark-grey))))
			`(gnus-group-mail-2-low ((t (:foreground ,mf-dark-grey))))
			`(gnus-group-mail-3 ((t (:weight bold :foreground ,mf-dark-grey))))
			`(gnus-group-mail-3-low ((t (:foreground ,mf-dark-grey))))
			`(gnus-group-mail-low ((t (:foreground ,mf-dark-grey))))
			`(gnus-header-content ((t (:foreground ,mf-dark-grey))))
			`(gnus-header-from ((t (:weight bold :foreground ,mf-dark-grey))))
			`(gnus-header-subject ((t (:foreground ,mf-dark-grey))))
			`(gnus-header-name ((t (:foreground ,mf-dark-grey))))
			`(gnus-header-newsgroups ((t (:foreground ,mf-dark-grey))))

			;; helm
			`(helm-header ((t (:foreground ,mf-dark-grey :background ,mf-default-bg :underline nil :box nil))))
			'(helm-source-header
			  ((t (:foreground ,mf-dark-grey
					   :underline nil
					   :weight bold
					   :box (:line-width 1 :style released-button)))))
			`(helm-selection ((t (:underline t :foreground ,mf-dark-grey))))
			`(helm-visible-mark ((t (:foreground ,mf-dark-grey :background ,mf-default-bg))))
			`(helm-candidate-number ((t (:foreground ,mf-dark-grey :background ,mf-default-bg))))
			`(helm-separator ((t (:foreground ,mf-dark-grey :background ,mf-default-bg))))
			`(helm-time-zone-current ((t (:foreground ,mf-dark-grey :background ,mf-default-bg))))
			`(helm-time-zone-home ((t (:foreground ,mf-dark-grey :background ,mf-default-bg))))
			`(helm-bookmark-addressbook ((t (:foreground ,mf-dark-grey :background ,mf-default-bg))))
			'(helm-bookmark-directory ((t (:foreground nil :background nil :inherit helm-ff-directory))))
			'(helm-bookmark-file ((t (:foreground nil :background nil :inherit helm-ff-file))))
			`(helm-bookmark-gnus ((t (:foreground ,mf-dark-grey :background ,mf-default-bg))))
			`(helm-bookmark-info ((t (:foreground ,mf-dark-grey :background ,mf-default-bg))))
			`(helm-bookmark-man ((t (:foreground ,mf-dark-grey :background ,mf-default-bg))))
			`(helm-bookmark-w3m ((t (:foreground ,mf-dark-grey :background ,mf-default-bg))))
			`(helm-buffer-not-saved ((t (:foreground ,mf-dark-grey :background ,mf-default-bg))))
			`(helm-buffer-process ((t (:foreground ,mf-dark-grey :background ,mf-default-bg))))
			`(helm-buffer-saved-out ((t (:foreground ,mf-dark-grey :background ,mf-default-bg))))
			`(helm-buffer-size ((t (:foreground ,mf-dark-grey :background ,mf-default-bg))))
			`(helm-ff-directory ((t (:foreground ,mf-dark-grey :background ,mf-default-bg :weight bold))))
			`(helm-ff-file ((t (:foreground ,mf-dark-grey :background ,mf-default-bg :weight normal))))
			`(helm-ff-executable ((t (:foreground ,mf-dark-grey :background ,mf-default-bg :weight normal))))
			`(helm-ff-invalid-symlink ((t (:foreground "white" :background ,mf-default-bg :weight bold))))
			`(helm-ff-symlink ((t (:foreground ,mf-dark-grey :background ,mf-default-bg :weight bold))))
			`(helm-ff-prefix ((t (:foreground ,mf-dark-grey :background ,mf-default-bg :weight normal))))
			`(helm-grep-cmd-line ((t (:foreground ,mf-dark-grey :background ,mf-default-bg))))
			`(helm-grep-file ((t (:foreground ,mf-dark-grey :background ,mf-default-bg))))
			`(helm-grep-finish ((t (:foreground ,mf-dark-grey :background ,mf-default-bg))))
			`(helm-grep-lineno ((t (:foreground ,mf-dark-grey :background ,mf-default-bg))))
			'(helm-grep-match ((t (:foreground nil :background nil :inherit helm-match))))
			`(helm-grep-running ((t (:foreground ,mf-dark-grey :background ,mf-default-bg))))
			`(helm-moccur-buffer ((t (:foreground ,mf-dark-grey :background ,mf-default-bg))))
			`(helm-mu-contacts-address-face ((t (:foreground ,mf-dark-grey :background ,mf-default-bg))))
			`(helm-mu-contacts-name-face ((t (:foreground ,mf-dark-grey :background ,mf-default-bg))))

			;; ido
			`(ido-first-match ((t (:foreground ,mf-dark-grey))))
			`(ido-only-match ((t (:underline ,mf-dark-grey :foreground ,mf-dark-grey))))
			`(ido-subdir ((t (:weight bold :foreground ,mf-default-fg))))

			;; Magit
			`(magit-branch-remote ((t (:foreground ,mf-default-fg :underline t :slant oblique))))
			`(magit-section-heading ((t (:extend t :foreground ,mf-default-fg :weight bold))))

			;; Message faces
			`(message-header-name ((t (:foreground ,mf-dark-grey))))
			`(message-header-cc ((t (:foreground ,mf-dark-grey))))
			`(message-header-other ((t (:foreground ,mf-dark-grey))))
			`(message-header-subject ((t (:foreground ,mf-dark-grey))))
			`(message-header-to ((t (:weight bold :foreground ,mf-dark-grey))))
			`(message-header-xheader ((t (:slant oblique :foreground ,mf-dark-grey))))
			'(message-cited-text ((t (:inherit shadow))))
			'(message-cited-text-1 ((t (:inherit message-cited-text))))
			'(message-cited-text-2 ((t (:inherit message-cited-text))))
			'(message-cited-text-3 ((t (:inherit message-cited-text))))
			'(message-cited-text-4 ((t (:inherit message-cited-text))))
			`(message-separator ((t (:weight bold :foreground ,mf-dark-grey))))

			;; Minibuffer
			`(minibuffer-prompt ((t (:foreground ,mf-default-fg :weight bold))))
			`(completions-common-part ((t (:foreground ,mf-default-fg :weight bold))))
			'(completions-first-difference ((t (:underline "black" :weight semi-bold))))

			;; Mini-modeline
			;; Mini- modeline
			'(mini-modeline-mode-line ((t (:height 0.14 :background "black"))))
			`(mini-modeline-mode-line-inactive ((t (:height 0.14 :background ,mf-default-bg))))

			;; Mode line faces
			`(mode-line ((t (:background ,mf-light-grey :foreground ,mf-default-fg))))
			`(mode-line-inactive ((t (:background ,mf-default-bg :foreground "#808080"))))

			;; MuMaMo
			`(mumamo-background-chunk-major ((t (:background ,mf-default-bg))))
			`(mumamo-background-chunk-submode1 ((t (:background ,mf-default-bg))))
			`(mumamo-background-chunk-submode2 ((t (:background ,mf-default-bg))))
			`(mumamo-background-chunk-submode3 ((t (:background ,mf-default-bg))))
			`(mumamo-background-chunk-submode4 ((t (:background ,mf-default-bg))))
			`(mumamo-border-face-in ((t (:slant unspecified :underline unspecified
							    :weight bold :foreground ,mf-default-fg))))
			`(mumamo-border-face-out ((t (:slant unspecified :underline unspecified
							     :weight bold :foreground ,mf-default-fg))))

			;; Notmuch
			`(notmuch-search-date ((t (:foreground ,mf-default-fg :slant oblique :weight normal))))
			`(notmuch-search-matching-authors ((t (:foreground ,mf-default-fg :weight semi-bold))))
			`(notmuch-search-subject ((t (:foreground ,mf-default-fg :weight light))))
			'(notmuch-search-unread-face ((t (:inherit bold :underline t))))
			'(notmuch-tag-added ((t (:underline "black"))))
			'(notmuch-tag-face ((t (:inherit shadow :foreground "#505050" :weight normal))))
			`(notmuch-tag-unread ((t (:foreground ,mf-default-fg :weight bold))))
			`(notmuch-tree-match-author-face ((t (:foreground ,mf-default-fg :weight semi-bold))))
			`(notmuch-tree-match-tag-face ((t (:foreground ,mf-default-fg :weight bold))))

			;; Orderless
			`(orderless-match-face-0 ((t (:foreground ,mf-default-fg :weight bold))))
			'(orderless-match-face-1 ((t (:inherit orderless-match-face-0))))
			'(orderless-match-face-2 ((t (:inherit orderless-match-face-0))))
			'(orderless-match-face-3 ((t (:inherit orderless-match-face-0))))
			'(orderless-match-face-4 ((t (:inherit orderless-match-face-0))))

			;; Org-mode
			'(org-agenda-done ((t (:foreground "ForestGreen" :underline t :slant oblique :weight bold))))
			`(org-agenda-structure ((t (:foreground ,mf-default-fg))))
			'(org-block ((t (:inherit shadow :extend t :background "#eeeeee"))))
			`(org-document-info ((t (:foreground ,mf-default-fg))))
			`(org-document-title ((t (:foreground ,mf-default-fg :weight bold))))
			'(org-done ((t (:foreground "green" :underline t :slant oblique :weight bold))))
			'(org-headline-done ((t (:extend t))))
			`(org-level-1 ((t (:bold t :foreground ,mf-dark-grey :height 1.5))))
			`(org-level-2 ((t (:extend nil :foreground ,mf-default-fg :weight normal :height 1.2))))
			`(org-level-3 ((t (:extend nil :foreground ,mf-default-fg :weight bold :height 1.0))))
			`(org-level-4 ((t (:extend nil :foreground ,mf-default-fg :weight normal :height 1.0))))
			'(org-link ((t (:foreground "#606060" :underline t :slant oblique))))
			`(org-scheduled ((t (:foreground ,mf-default-fg :slant oblique))))
			`(org-table ((t (:foreground ,mf-default-fg))))
			`(org-table-header ((t (:inherit org-table :foreground ,mf-default-fg :weight semi-bold))))
			'(org-time-grid ((t (:foreground "#a0a0a0"))))
			`(org-todo ((t (:foreground ,mf-default-fg :underline t :slant oblique :weight bold))))
			`(org-upcoming-deadline ((t (:foreground ,mf-default-fg :weight semi-bold))))

			;; Org-roam
			'(org-roam-preview-heading ((t (:inherit org-block))))
			'(org-roam-preview-heading-highlight ((t (:inherit org-roam-preview-heading))))

			;; Show-paren
			`(show-paren-match ((t (:background ,mf-dark-grey))))
			'(show-paren-mismatch ((t (:background "red"))))

			;; Speedbar
			`(speedbar-button-face ((t (:foreground ,mf-medium-grey))))
			`(speedbar-file-face ((t (:foreground ,mf-dark-grey))))
			`(speedbar-directory-face ((t (:weight bold :foreground ,mf-default-fg))))
			`(speedbar-tag-face ((t (:foreground ,mf-medium-grey))))
			`(speedbar-selected-face ((t (:underline ,mf-medium-grey :foreground ,mf-dark-grey))))
			`(speedbar-highlight-face ((t (:weight bold :background ,mf-default-bg :foreground ,mf-default-fg))))

			;; Vertico
			`(vertico-current ((t (:underline ,mf-default-fg :background ,mf-default-bg :foreground ,mf-default-fg))))

			;; Whitespace-mode
			'(whitespace-empty ((t (:background unspecified :foreground "red"))))
			`(whitespace-line ((t (:background ,mf-medium-grey :foreground ,mf-default-fg))))
			'(whitespace-trailing ((t (:background "red1")))))

(provide-theme 'mf)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; mf-theme.el ends here
