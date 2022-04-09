;;; early-init.el --- Early configuration for Emacs
;;; Code:
(add-to-list 'load-path (concat user-emacs-directory "mf-lisp/"))
(require 'mf-packages)

(defmacro mf/install (package)
  (unless
      (package-installed-p package)
    (package-install package)))

(require 'mf-look-and-feel)
(require 'mf-splash)
