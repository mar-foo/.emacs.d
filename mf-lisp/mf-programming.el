;;; mf-programming.el --- My configuration for programming languages that I use
;;; Code:
;;; Programming
;; Golang
(mf/install go-mode)
(progn
  (mf/autoload-func
   :func go-mode
   :file "go-mode")
  (mf/autoload-func
   :func gofmt-before-save
   :file "go-mode")
  (eval-after-load 'go-mode
	'(progn
	   (message "Loaded go-mode")
	   (add-hook 'go-mode-hook #'gofmt-before-save)))

;; Haskell
(mf/install haskell-mode)
(mf/install hindent)
(progn
  (mf/autoload-func
   :func haskell-mode
   :file "haskell-mode")
  (mf/autoload-func
   :func interactive-haskell-mode
   :file "haskell-mode")
  (mf/autoload-func
   :func haskell-indent-mode
   :file "haskell-mode")
  (mf/autoload-func
   :func hindent-mode
   :file "hindent")
  (eval-after-load 'haskell-mode
	'(progn
	   (message "Loaded haskell-mode")
	   (add-hook 'haskell-mode-hook 'interactive-haskell-mode)
	   (add-hook 'haskell-mode-hook 'haskell-indent-mode)
	   (add-hook 'haskell-mode-hook 'hindent-mode)
	   (setq hindent-reformat-buffer-on-save t))))

;; C
(add-hook 'c-mode-hook #'(lambda()
						   (c-set-style "k&r")))

;;; LSP
(mf/install lsp-mode)
(mf/autoload-func
 :func lsp
 :file "lsp-mode")
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
