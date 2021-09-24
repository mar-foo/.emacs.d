;;; mf-programming.el --- My configuration for programming languages that I use
;;; Code:
;;; Programming
;; Golang
(mf/install go-mode)
(progn
  (unless
	  (fboundp 'go-mode)
	(autoload #'go-mode "go-mode" nil t))
  (unless
	  (fboundp 'gofmt-before-save)
	(autoload #'gofmt-before-save "gofmt-before-save" nil t))
  (eval-after-load 'go-mode
	'(progn
	   (message "Loaded go-mode")
	   (add-hook 'go-mode-hook 'gofmt-before-save))))

;; Haskell
(mf/install haskell-mode)
(progn
  (unless
	  (fboundp 'haskell-mode)
	(autoload #'haskell-mode "haskell-mode" nil t))
  (unless
	  (fboundp 'interactive-haskell-mode)
	(autoload #'interactive-haskell-mode "haskell-mode" nil t))
  (unless
	  (fboundp 'haskell-indent-mode)
	(autoload #'haskell-indent-mode "haskell-mode" nil t))
  (eval-after-load 'haskell-mode
	'(progn
	   (message "Loaded haskell-mode")
	   (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
	   (add-hook 'haskell-mode-hook 'haskell-indent-mode))))

(mf/install hindent)
(unless
	(fboundp 'hindent-mode)
  (autoload #'hindent-mode "hindent" nil t))
(eval-after-load 'haskell-mode
  '(progn
	 (message "Loaded hindent")
	 (add-hook 'haskell-mode-hook 'hindent-mode)
	 (setq hindent-reformat-buffer-on-save t)))

;; C
(add-hook 'c-mode-hook #'(lambda()
						   (c-set-style "k&r")))

;;; LSP
(mf/install lsp-mode)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)
(add-hook 'go-mode-hook 'lsp)
(eval-after-load 'lsp-mode
  '(progn
	 (message "Lsp-mode loaded")
	 (setq read-process-output-max (* 1024 1024)
		 lsp-idle-delay 0.5
		 lsp-headerline-breadcrumb-enable nil
		 lsp-lens-enable nil
		 lsp-modeline-diagnostics-enable nil
		 lsp-clangd-binary-path (executable-find "clangd")
		 lsp-enable-snippet nil)))

(provide 'mf-programming)
;;; mf-programming.el ends here
