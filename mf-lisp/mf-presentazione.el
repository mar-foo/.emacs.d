;;; mf-presentazione.el --- Scorciatoie per la presentazione a scuola

;;;###autoload
(defun mf/sent-presentation()
  (interactive)
  (start-process-shell-command "sent" nil "sent /home/mario/Projects/Traccia_Informatica/Presentazione/static/sent.txt")
  (delete-other-windows))

;;;###autoload
(defun mf/presentation-setup()
  (interactive)
  (split-window-right)
  (start-process-shell-command "st" nil "st")
  (split-window-right)
  (find-file "/home/mario/Projects/Traccia_Informatica/Presentazione/demo/calcio.go")
  (find-file "/home/mario/Projects/Traccia_Informatica/Presentazione/demo/timer.go")
  (mf/sent-presentation))

(provide 'mf-presentazione)
;;; mf-presentazione.el ends here
