;;; mf-eww.el --- Configuration for eww -*- lexical-binding: t -*-
;;; Code
(eval-after-load 'eww
  '(add-to-list 'eww-suggest-uris #'mf/bookmarks))
(provide 'mf-eww)
;;; mf-eww.el ends here
