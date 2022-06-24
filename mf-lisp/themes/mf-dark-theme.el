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

(defvar mf-dark-default-bg
  "#000000")

(defvar mf-dark-default-fg
  "#ffffff")

(defvar mf-medium-grey
  "#808080")

(defvar mf-dark-grey
  "#303030")

(custom-theme-set-faces 'mf-dark
			`(default ((t (:foreground ,mf-dark-default-fg :background ,mf-dark-default-bg))))
			`(cursor ((t (:background ,mf-dark-default-fg))))

			;; Highlighting faces
			'(bookmark-face ((t (:foreground "black" :background "#cccccc"))))
			`(fringe ((t (:foreground ,mf-dark-default-fg :background ,mf-dark-default-bg))))
			`(highlight ((t (:foreground "black" :background ,mf-dark-default-fg))))
			`(hl-line ((t (:background ,mf-dark-grey))))
			'(isearch ((t (:foreground "#f0f0f0" :background "#006800"))))
			`(lazy-highlight ((t (:foreground "black" :background ,mf-dark-grey))))
			'(linum ((t (:foreground "#f0f0f0" :slant italic))))
			'(match ((t (:background "green"))))
			`(region ((t (:extend t :foreground "black" :background ,mf-medium-grey))))
			`(secondary-selection ((t (:foreground: ,mf-dark-default-fg :background ,mf-dark-grey))))
			'(trailing-whitespace ((t (:background "red"))))

			;; Button and link faces
			'(link ((t (:underline t :foreground "#bababa"))))
			'(link-visited ((t (:underline t :foreground "#bababa"))))

			;; Company
			`(company-scrollbar-bg ((t (:background ,mf-dark-default-bg))))
			`(company-scrollbar-fg ((t (:foreground ,mf-dark-default-fg))))
			'(company-tooltip-annotation ((t (:foreground "#b0b0b0"))))
			`(company-tooltip-common ((t (:foreground ,mf-dark-default-fg :weight semi-bold))))
			`(company-tooltip-selection ((t (:foreground ,mf-dark-default-fg :background ,mf-medium-grey))))

			;; Corfu
			`(corfu-current ((t (:foreground ,mf-dark-default-fg :background "#b3b3b3"))))
			`(corfu-bar ((t (:background ,mf-dark-default-fg))))
			`(corfu-background ((t (:background ,mf-dark-default-bg))))
			'(corfu-border ((t (:background "#b3b3b3"))))

			;; Erc
			`(erc-current-nick-face ((t (:foreground ,mf-dark-default-fg :weight bold))))
			'(erc-error-face ((t (:inherit error))))
			`(erc-keyword-face ((t (:foreground ,mf-dark-default-fg :underline t :weight bold))))
			'(erc-my-nick-face ((t (:inherit erc-current-nick-face))))
			'(erc-notice-face ((t (:foreground "#b0b0b0" :weight bold))))
			`(erc-prompt-face ((t (:foreground ,mf-dark-default-fg :underline t :weight bold))))
			'(erc-timestamp-face ((t (:foreground "#b0b0b0" :weight bold))))

			;; Escape and prompt faces
			'(minibuffer-prompt ((t (:weight bold :foreground "#bababa"))))
			'(escape-glyph ((t (:foreground "#bababa"))))
			'(error ((t (:weight bold :slant italic :foreground "#900000"))))
			`(warning ((t (:foreground ,mf-dark-default-fg :background ,mf-dark-default-bg :inherit font-lock-warning-face))))
			'(success ((t (:foreground "green"))))

			;; EShell
			`(eshell-prompt ((t (:foreground ,mf-dark-default-fg :bold t))))
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
			`(font-lock-comment-face ((t (:weight bold :slant italic :foreground ,mf-dark-default-fg))))
			'(font-lock-constant-face ((t (:foreground "#bababa"))))
			`(font-lock-function-name-face ((t (:foreground ,mf-dark-default-fg))))
			`(font-lock-keyword-face ((t (:foreground ,mf-dark-default-fg))))
			`(font-lock-string-face ((t (:foreground ,mf-medium-grey))))
			'(font-lock-type-face ((t (:foreground "#bababa"))))
			`(font-lock-variable-name-face ((t (:foreground ,mf-dark-default-fg :slant oblique))))
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
			`(helm-header ((t (:foreground "#bababa" :background ,mf-dark-default-bg :underline nil :box nil))))
			'(helm-source-header
			  ((t (:foreground "#bababa"
					   :underline nil
					   :weight bold
					   :box (:line-width 1 :style released-button)))))
			'(helm-selection ((t (:underline t :foreground "#bababa"))))
			`(helm-visible-mark ((t (:foreground "#bababa" :background ,mf-dark-default-bg))))
			`(helm-candidate-number ((t (:foreground "#bababa" :background ,mf-dark-default-bg))))
			`(helm-separator ((t (:foreground "#bababa" :background ,mf-dark-default-bg))))
			`(helm-time-zone-current ((t (:foreground "#bababa" :background ,mf-dark-default-bg))))
			`(helm-time-zone-home ((t (:foreground "#bababa" :background ,mf-dark-default-bg))))
			`(helm-bookmark-addressbook ((t (:foreground "#bababa" :background ,mf-dark-default-bg))))
			'(helm-bookmark-directory ((t (:foreground nil :background nil :inherit helm-ff-directory))))
			'(helm-bookmark-file ((t (:foreground nil :background nil :inherit helm-ff-file))))
			`(helm-bookmark-gnus ((t (:foreground "#bababa" :background ,mf-dark-default-bg))))
			`(helm-bookmark-info ((t (:foreground "#bababa" :background ,mf-dark-default-bg))))
			`(helm-bookmark-man ((t (:foreground "#bababa" :background ,mf-dark-default-bg))))
			`(helm-bookmark-w3m ((t (:foreground "#bababa" :background ,mf-dark-default-bg))))
			`(helm-buffer-not-saved ((t (:foreground "#bababa" :background ,mf-dark-default-bg))))
			`(helm-buffer-process ((t (:foreground "#bababa" :background ,mf-dark-default-bg))))
			`(helm-buffer-saved-out ((t (:foreground "#bababa" :background ,mf-dark-default-bg))))
			`(helm-buffer-size ((t (:foreground "#bababa" :background ,mf-dark-default-bg))))
			`(helm-ff-directory ((t (:foreground "#bababa" :background ,mf-dark-default-bg :weight bold))))
			`(helm-ff-file ((t (:foreground "#bababa" :background ,mf-dark-default-bg :weight normal))))
			`(helm-ff-executable ((t (:foreground "#bababa" :background ,mf-dark-default-bg :weight normal))))
			`(helm-ff-invalid-symlink ((t (:foreground "black" :background ,mf-dark-default-bg :weight bold))))
			`(helm-ff-symlink ((t (:foreground "#bababa" :background ,mf-dark-default-bg :weight bold))))
			`(helm-ff-prefix ((t (:foreground "#bababa" :background ,mf-dark-default-bg :weight normal))))
			`(helm-grep-cmd-line ((t (:foreground "#bababa" :background ,mf-dark-default-bg))))
			`(helm-grep-file ((t (:foreground "#bababa" :background ,mf-dark-default-bg))))
			`(helm-grep-finish ((t (:foreground "#bababa" :background ,mf-dark-default-bg))))
			`(helm-grep-lineno ((t (:foreground "#bababa" :background ,mf-dark-default-bg))))
			'(helm-grep-match ((t (:foreground nil :background nil :inherit helm-match))))
			`(helm-grep-running ((t (:foreground "#bababa" :background ,mf-dark-default-bg))))
			`(helm-moccur-buffer ((t (:foreground "#bababa" :background ,mf-dark-default-bg))))
			`(helm-mu-contacts-address-face ((t (:foreground "#bababa" :background ,mf-dark-default-bg))))
			`(helm-mu-contacts-name-face ((t (:foreground "#bababa" :background ,mf-dark-default-bg))))

			;; ido
			'(ido-first-match ((t (:foreground "#bababa"))))
			'(ido-only-match ((t (:underline "#bababa" :foreground "#bababa"))))
			`(ido-subdir ((t (:weight bold :foreground ,mf-dark-default-fg))))

			;; Magit
			`(magit-branch-remote ((t (:foreground ,mf-dark-default-fg :underline t :slant oblique))))
			`(magit-section-heading ((t (:extend t :foreground ,mf-dark-default-fg :weight bold))))

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
			`(minibuffer-prompt ((t (:foreground ,mf-dark-default-fg :weight bold))))
			`(completions-common-part ((t (:foreground ,mf-dark-default-fg :weight bold))))
			`(completions-first-difference ((t (:underline ,mf-dark-default-fg :weight semi-bold))))

			;; Mode line faces
			`(mode-line ((t (:background ,mf-dark-grey :foreground ,mf-dark-default-fg))))
			`(mode-line-inactive ((t (:background ,mf-dark-default-bg :foreground ,mf-medium-grey))))

			;; Mini- modeline
			`(mini-modeline-mode-line ((t (:height 0.14 :background ,mf-dark-default-fg))))
			`(mini-modeline-mode-line-inactive ((t (:height 0.14 :background ,mf-dark-default-bg))))

			;; MuMaMo
			`(mumamo-background-chunk-major ((t (:background ,mf-dark-default-bg))))
			`(mumamo-background-chunk-submode1 ((t (:background ,mf-dark-default-bg))))
			`(mumamo-background-chunk-submode2 ((t (:background ,mf-dark-default-bg))))
			`(mumamo-background-chunk-submode3 ((t (:background ,mf-dark-default-bg))))
			`(mumamo-background-chunk-submode4 ((t (:background ,mf-dark-default-bg))))
			'(mumamo-border-face-in ((t (:slant unspecified :underline unspecified
							    :weight bold :foreground ,mf-dark-default-fg))))
			'(mumamo-border-face-out ((t (:slant unspecified :underline unspecified
							     :weight bold :foreground ,mf-dark-default-fg))))

			;; Notmuch
			`(notmuch-search-date ((t (:foreground ,mf-dark-default-fg :slant oblique :weight normal))))
			`(notmuch-search-matching-authors ((t (:foreground ,mf-dark-default-fg :weight semi-bold))))
			`(notmuch-search-subject ((t (:foreground ,mf-dark-default-fg :weight light))))
			'(notmuch-search-unread-face ((t (:inherit bold :underline t))))
			`(notmuch-tag-added ((t (:underline ,mf-dark-default-fg))))
			'(notmuch-tag-face ((t (:inherit shadow :foreground "#505050" :weight normal))))
			`(notmuch-tag-unread ((t (:foreground ,mf-dark-default-fg :weight bold))))
			`(notmuch-tree-match-author-face ((t (:foreground ,mf-dark-default-fg :weight semi-bold))))
			`(notmuch-tree-match-tag-face ((t (:foreground ,mf-dark-default-fg :weight bold))))

			;; Orderless
			`(orderless-match-face-0 ((t (:foreground ,mf-dark-default-fg :underline t  :weight bold))))
			'(orderless-match-face-1 ((t (:inherit orderless-match-face-0))))
			'(orderless-match-face-2 ((t (:inherit orderless-match-face-0))))
			'(orderless-match-face-3 ((t (:inherit orderless-match-face-0))))
			'(orderless-match-face-4 ((t (:inherit orderless-match-face-0))))

			;; Org-mode
			'(org-agenda-done ((t (:foreground "ForestGreen" :underline t :slant oblique :weight bold))))
			`(org-agenda-structure ((t (:foreground ,mf-dark-default-fg))))
			`(org-agenda-dimmed-todo-face ((t (:foreground ,mf-dark-default-fg))))
			`(org-block ((t (:inherit shadow :extend t :background ,mf-dark-default-bg))))
			'(org-date ((t (:underline t :foreground "#b0b0b0"))))
			`(org-document-info ((t (:foreground ,mf-dark-default-fg))))
			`(org-document-title ((t (:foreground ,mf-dark-default-fg :weight bold))))
			'(org-done ((t (:foregrounpd "green" :underline t :slant oblique :weight bold))))
			'(org-headline-done ((t (:extend t))))
			'(org-level-1 ((t (:bold t :foreground "#bababa" :height 1.5))))
			`(org-level-2 ((t (:extend nil :foreground ,mf-dark-default-fg :weight normal :height 1.2))))
			`(org-level-3 ((t (:extend nil :foreground ,mf-dark-default-fg :weight bold :height 1.0))))
			`(org-level-4 ((t (:extend nil :foreground ,mf-dark-default-fg :weight normal :height 1.0))))
			'(org-link ((t (:foreground "#b0b0b0" :underline t :slant oblique))))
			`(org-scheduled ((t (:foreground ,mf-dark-default-fg :slant oblique))))
			`(org-table ((t (:foreground ,mf-dark-default-fg))))
			`(org-table-header ((t (:inherit org-table :foreground ,mf-dark-default-fg :weight semi-bold))))
			'(org-time-grid ((t (:foreground "#a0a0a0"))))
			`(org-todo ((t (:foreground ,mf-dark-default-fg :underline t :slant oblique :weight bold))))
			`(org-upcoming-deadline ((t (:foreground ,mf-dark-default-fg :weight semi-bold))))

			;; Org-roam
			'(org-roam-preview-heading ((t (:inherit org-block))))
			'(org-roam-preview-heading-highlight ((t (:inherit org-roam-preview-heading))))

			;; Perspective
			'(persp-selected-face ((t (:weight bold))))

			;; Show-paren
			'(show-paren-match ((t (:background "#a0a0a0"))))
			'(show-paren-mismatch ((t (:background "red"))))

			;; Speedbar
			'(speedbar-button-face ((t (:foreground "#b3b3b3"))))
			'(speedbar-file-face ((t (:foreground "#bababa"))))
			`(speedbar-directory-face ((t (:weight bold :foreground ,mf-dark-default-fg))))
			'(speedbar-tag-face ((t (:foreground "#b3b3b3"))))
			'(speedbar-selected-face ((t (:underline "#b3b3b3" :foreground "#bababa"))))
			`(speedbar-highlight-face ((t (:weight bold :background ,mf-dark-default-bg :foreground ,mf-dark-default-fg))))

			;; Vertico
			`(vertico-current ((t (:background ,mf-medium-grey :foreground "black"))))

			;; Whitespace-mode
			'(whitespace-empty ((t (:background unspecified :foreground "red"))))
			`(whitespace-line ((t (:background "#b3b3b3" :foreground ,mf-dark-default-fg))))
			'(whitespace-trailing ((t (:background "red1")))))

(provide-theme 'mf-dark)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; mf-dark-theme.el ends here
