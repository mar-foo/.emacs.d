;;; mf-autoloads.el --- List of autoloads for custom Elisp modules -*- lexical-binding: t -*-
;;; Code:
(unless
    (fboundp #'mf/delete-sexp)
  (autoload #'mf/delete-sexp "mf-functions" nil t))
(unless
    (fboundp #'mf/edit-configuration)
  (autoload #'mf/edit-configuration "mf-functions" nil t))
(unless
    (fboundp #'mf/ensure-package)
  (autoload #'mf/ensure-package "mf-functions" nil t))
(unless
    (fboundp #'mf/infos)
  (autoload #'mf/infos "mf-functions" nil t))
(unless
    (fboundp #'mf/find-recentf)
  (autoload #'mf/find-recentf "mf-functions" nil t))
(unless
    (fboundp #'mf/reload-configuration)
  (autoload #'mf/reload-configuration "mf-functions" nil t))
(unless
	(fboundp #'mf/select-completion-and-exit)
  (autoload #'mf/select-completion-and-exit "mf-functions" nil t))
(unless
    (fboundp #'mf/toggle-eshell)
  (autoload #'mf/toggle-eshell "mf-functions" nil t))
(unless
	(fboundp #'mf/youtube)
  (autoload #'mf/youtube "mf-functions" nil t))
(unless
	(fboundp #'mf/presentation-setup)
  (autoload #'mf/presentation-setup "mf-presentazione" nil t))

(provide 'mf-autoloads)
;;; mf-autoloads.el ends here
