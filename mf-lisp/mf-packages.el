;;; mf-packages.el --- Configuration for package manager -*- lexical-binding: t -*-
;;; Code:
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
						 ("org" . "https://orgmode.org/elpa/")
						 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Populate the load-path
(dolist
	(package-dir (directory-files (concat user-emacs-directory "elpa/") t directory-files-no-dot-files-regexp))
  (add-to-list 'load-path package-dir))

(provide 'mf-packages)
;;; mf-packages.el ends here
