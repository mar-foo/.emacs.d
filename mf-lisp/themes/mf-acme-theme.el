;;; mf-acme-theme.el --- Port of "No Frils Acme" Vim theme.

;; Copyright (c) 2018 Eric Sessoms
;; Copyright (c) 2021 Mario Forzanini <mario.forzanini@studenti.unimi.it>
;; See COPYING for details.

;; Author: Eric Sessoms <esessoms@protonmail.com>
;; Package-Requires: ((emacs "24"))
;; URL: https://gitlab.com/esessoms/nofrils-theme
;; Version: 0.1.0

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Minimal syntax highlighting to reduce distractions.  Only
;; highlights comments and errors by default.  High-contrast
;; black-on-yellow and other colors inspired by Plan 9's Acme.

;; (require 'nofrils-acme-theme)
;; (load-theme 'nofrils-acme t)

;;; Credits:

;; This theme was ported from No Frils Acme by Robert Melton.
;; https://github.com/robertmeta/nofrils

;;; Code:

(deftheme mf-acme
  "Port of No Frils Acme by Robert Melton. Modified by me.")

(let ((background "#FFFFEA")
      (foreground "#000000")
      (error "#FF5555")
      (search "#40883F")
      (selection "#CCCC7C")
      (status "#EAFFFF")
	  (special "#EEEE9E"))

  (custom-theme-set-faces
   'mf-acme

   `(default ((t :background ,background :foreground ,foreground)))

   ;; Highlight only comments and errors.
   `(error ((t :background "white" :foreground ,error)))
   `(font-lock-builtin-face ((t nil)))
   `(font-lock-comment-face ((t :weight semi-bold)))
   `(font-lock-constant-face ((t nil)))
   `(font-lock-function-name-face ((t nil)))
   `(font-lock-keyword-face ((t nil)))
   `(font-lock-negation-char-face ((t nil)))
   `(font-lock-regexp-grouping-backslash ((t nil)))
   `(font-lock-regexp-grouping-construct ((t nil)))
   `(font-lock-string-face ((t nil)))
   `(font-lock-type-face ((t nil)))
   `(font-lock-variable-name-face ((t nil)))

   ;; Show searches and selections.
   `(isearch ((t :background ,search :foreground "white")))
   `(lazy-highlight ((t :background "white" :foreground ,foreground)))
   `(highlight ((t :background ,special)))
   `(region ((t :background ,selection)))
   `(secondary-selection ((t :background ,special)))

   ;; Parenthesis matching is never wrong.
   `(show-paren-match ((t :weight bold)))
   `(show-paren-mismatch ((t :background ,error :weight bold)))

   ;; Decorate the frame to resemble Acme.
   `(fringe ((t :background ,background)))
   `(minibuffer-prompt ((t :foreground ,foreground)))
   `(mode-line ((t :background ,status :box (:line-width 1 :color ,foreground))))
   `(mode-line-inactive ((t :background ,status)))

   ;; Gnus
   `(gnus-header-from ((t :weight bold)))
   `(gnus-header-name ((t nil)))
   `(gnus-header-subject ((t :weight bold)))
   `(gnus-header-content ((t :slant oblique)))

   ;; Orderless
   `(orderless-match-face-0 ((t :weight bold)))
   `(orderless-match-face-1 ((t :weight bold)))
   `(orderless-match-face-2 ((t :weight bold)))
   `(orderless-match-face-3 ((t :weight bold)))

   ;; Org mode needs to chill.
   `(org-done ((t :weight bold)))
   `(org-todo ((t :weight bold)))
   `(org-agenda-done ((t :weight bold)))
   `(org-agenda-structure ((t nil)))
   `(org-agenda-dimmed-todo-face ((t nil)))
   `(org-block ((t :background ,special)))
   `(org-date ((t nil)))
   `(org-document-info ((t nil)))
   `(org-document-title ((t :weight bold)))
   `(org-done ((t :weight bold)))
   `(org-headline-done ((t nil)))
   `(org-level-1 ((t :bold t :height 1.5)))
   `(org-level-2 ((t :height 1.2)))
   `(org-level-3 ((t nil)))
   `(org-level-4 ((t nil)))
   `(org-link ((t :underline t)))
   `(org-scheduled ((t nil)))
   `(org-table ((t nil)))
   `(org-table-header ((t nil)))
   `(org-time-grid ((t nil)))
   `(org-todo ((t nil)))
   `(org-upcoming-deadline ((t nil)))

   ;; Org agenda
   `(org-agenda-clocking ((t nil)))
   `(org-agenda-column-dateline ((t nil)))
   `(org-agenda-current-time ((t nil)))
   `(org-agenda-date ((t :inherit org-date)))
   `(org-agenda-date-today ((t :inherit org-date)))
   `(org-agenda-date-weekend ((t nil)))
   `(org-agenda-structure ((t nil)))

   ;; Org-roam
   `(org-roam-preview-heading ((t (:inherit org-block))))
   `(org-roam-preview-heading-highlight ((t (:inherit org-roam-preview-heading))))

   ;; Packages
   `(completions-common-part ((t :foreground ,foreground :weight bold)))
   `(eshell-prompt ((t :inherit minibuffer-prompt)))
   `(message-header-name ((t nil)))
   `(message-separator ((t :weight bold)))
   `(vertico-current ((t :underline t)))
   `(whitespace-empty ((t :background ,special)))
   `(whitespace-trailing ((t :background ,special)))))

;;; Footer:

;;;###autoload
(when load-file-name
  (add-to-list
   'custom-theme-load-path
   (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'mf-acme)

(provide 'mf-acme-theme)

;;; mf-acme-theme.el ends here
