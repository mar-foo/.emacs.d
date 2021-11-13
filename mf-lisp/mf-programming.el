;;; mf-programming.el --- My configuration for programming languages that I use
;;; Code:

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
	   (add-hook 'go-mode-hook #'gofmt-before-save))))

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

(mf/install slime)
(setq inferior-lisp-program "sbcl")
(eval-after-load 'slime
  '(progn
	 (message "Loaded slime")))

(mf/install paredit)
(add-hook 'lisp-mode-hook #'paredit-mode)
(eval-after-load 'paredit
  '(progn
	 (message "Loaded paredit")
	 (eval-after-load 'slime
	   '(add-hook 'slime-repl-mode #'paredit-mode))))

(setq c-default-style '((java-mode . "java")
						(awk-mode . "awk")
						(other . "bsd")))

(eval-after-load 'flymake
  '(progn
	 (message "Loaded flymake")
	 (add-hook 'flymake-mode-hook #'flymake-show-diagnostics-buffer)))

;; Yasnippet
   (mf/install yasnippet)
   (mf/autoload-func
	:func yas-minor-mode
	:file "yasnippet")
   (eval-after-load 'yasnippet
	 '(progn
		(setq yas-snippet-dirs '("~/.emacs.d/snippets"))))

 (provide 'mf-programming)
 ;;; mf-programming.el ends here
