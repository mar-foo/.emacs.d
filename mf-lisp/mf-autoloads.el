;;; mf-autoloads.el --- List of autoloads for custom Elisp modules -*- lexical-binding: t -*-
;;; Code:
(defmacro mf/my-func-autoload (func)
  `(unless
	  (fboundp #',func)
	(autoload #',func "mf-functions" nil t)))

(mf/my-func-autoload mf/alsamixer)
(mf/my-func-autoload mf/agenda)
(mf/my-func-autoload mf/big-font)
(mf/my-func-autoload mf/bookmarks)
(mf/my-func-autoload mf/delete-sexp)
(mf/my-func-autoload mf/edit-configuration)
(mf/my-func-autoload mf/executable-find-file)
(mf/my-func-autoload mf/infos)
(mf/my-func-autoload mf/find-recentf)
(mf/my-func-autoload mf/lcm)
(mf/my-func-autoload mf/open-emacsd)
(mf/my-func-autoload mf/quit-and-kill)
(mf/my-func-autoload mf/reload-configuration)
(mf/my-func-autoload mf/select-completion-and-exit)
(mf/my-func-autoload mf/switch-theme)
(mf/autoload-func
 :func mf/toggle-eshell
 :file "mf-shell")
(mf/autoload-func
 :func mf/toggle-shell
 :file "mf-shell")
(mf/autoload-func
 :func mf/toggle-telega
 :file "mf-telega")
(mf/my-func-autoload mf/youtube)

(provide 'mf-autoloads)
	;;; mf-autoloads.el ends here
