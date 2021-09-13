;;; mf-org.el --- My configuration for Org mode and Org Roam -*- lexical-binding: t -*-
;;; Code:
(mf/install org-roam)
(progn
  (unless
	  (fboundp 'org-roam-find-node)
	(autoload #'org-roam-find-node "org-roam-find-node" nil t))
  (unless
	  (fboundp 'org-roam-insert-node)
	(autoload #'org-roam-insert-node "org-roam-insert-node" nil t))
  (eval-after-load 'org-roam
	   (setq org-roam-directory (file-truename "~/Documents/Personal/Notes/")
		org-roam-v2-ack t)))

(provide 'mf-org)
;;; mf-org.el ends here
