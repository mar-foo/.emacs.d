;;; mf-eww.el --- Configuration for eww -*- lexical-binding: t -*-
;;; Code
(eval-after-load 'eww
  '(progn
     (append eww-suggest-uris (list #'mf/bookmarks))
     ;; From protesilaos prot-eww.el https://protesilaos/dotemacs
     (defun mf/eww--rename-buffer ()
       "Rename EWW buffer using page title or URL.
To be used by `eww-after-render-hook'."
       (let ((name (if (eq "" (plist-get eww-data :title))
		       (plist-get eww-data :url)
		     (plist-get eww-data :title))))
	 (rename-buffer (format "*eww | %s*" name) t)))

     (add-hook 'eww-after-render-hook #'mf/eww--rename-buffer)
     (advice-add 'eww-back-url :after #'mf/eww--rename-buffer)
     (advice-add 'eww-forward-url :after #'mf/eww--rename-buffer)))

(provide 'mf-eww)
;;; mf-eww.el ends here
