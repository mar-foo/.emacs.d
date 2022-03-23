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
       (add-hook 'go-mode-hook #'gofmt-before-save)
       (defun mf/go-sort-imports (orig-func &rest args)
	 "Sort import section. This function is meant to be added
as advice to `go-import-add'"
	 (if (eq major-mode 'go-mode)
	     (save-excursion
	       (goto-char (point-min))
	       (let ((beg (progn
			    (search-forward "import")
			    (next-line)
			    (beginning-of-line)
			    (point)))
		     (end (progn
			    (search-forward ")")
			    (previous-line)
			    (end-of-line)
			    (point))))
		 (sort-lines nil beg end)))))

       (advice-add 'go-import-add :after #'mf/go-sort-imports))))

(mf/install haskell-mode)
(mf/install hindent)
(mf/install lsp-haskell)
(mf/install flymake-haskell-multi)
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
       (add-hook 'haskell-mode-hook 'lsp)
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

(mf/install lsp-latex)
(eval-after-load "tex-mode"
  '(progn
     (require 'lsp-latex)
     (add-hook 'tex-mode-hook 'lsp)
     (add-hook 'latex-mode-hook 'lsp)
     (add-hook 'latex-mode-hook 'reftex-mode)
     (add-hook 'tex-mode-hook 'reftex-mode)))

(setq c-default-style '((java-mode . "java")
			(awk-mode . "awk")
			(other . "linux")))

;; Yasnippet
(mf/install yasnippet)
(mf/autoload-func
 :func yas-minor-mode
 :file "yasnippet")
(eval-after-load 'yasnippet
  '(progn
     (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
     (add-hook 'c-mode-hook #'yas-minor-mode-on)))

(mf/install lsp-mode)
(mf/autoload-func
 :func lsp
 :file "lsp-mode")
(eval-after-load 'lsp-mode
  '(progn
     (message "Lsp module loaded")
     (setq read-process-output-max (* 1024 1024)
	   lsp-idle-delay 0.5
	   lsp-headerline-breadcrumb-enable nil
	   lsp-lens-enable t
	   lsp-modeline-diagnostics-enable nil
	   lsp-enable-snippet t)))

(provide 'mf-programming)
 ;;; mf-programming.el ends here
