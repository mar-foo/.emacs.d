;;; mf-eww.el --- Configuration for eww -*- lexical-binding: t -*-
;;; Code
(eval-after-load 'eww
  '(append eww-suggest-uris (list #'mf/bookmarks)))
(provide 'mf-eww)
;;; mf-exwm.el ends here
