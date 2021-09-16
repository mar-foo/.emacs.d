;;; mf-org.el --- My configuration for Org mode and Org Roam -*- lexical-binding: t -*-
;;; Code:
(progn
  (mf/install org-roam)
  (unless
	  (fboundp 'org-roam-find-node)
	(autoload #'org-roam-find-node "org-roam-find-node" nil t))
  (unless
	  (fboundp 'org-roam-insert-node)
	(autoload #'org-roam-insert-node "org-roam-insert-node" nil t))
  (unless
	  (fboundp 'org-roam-capture)
	(autoload #'org-roam-capure "org-roam-capture" nil t))
  (define-key global-map (kbd "C-. o") #'org-roam-capture)
  (define-key global-map (kbd "C-. n f") #'org-roam-node-find)
  (define-key global-map (kbd "C-. n i") #'org-roam-node-insert)
  (eval-after-load 'org-roam
	(setq org-roam-directory (file-truename "~/Documents/Personal/Notes/")
		  org-roam-v2-ack t)))

(provide 'mf-org)
;;; mf-org.el ends here
