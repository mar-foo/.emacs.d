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

       (advice-add 'go-import-add :after #'mf/go-sort-imports)
       (defun mf/go-packages-go-list ()
	 "Return a list of go packages using `go list'."
	 (process-lines go-command "list" "..."))
       (setq go-packages-function #'mf/go-packages-go-list))))

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

(mf/install tuareg)
(mf/install merlin)
(add-hook 'merlin-mode-hook #'corfu-mode)
(add-hook 'tuareg-mode-hook #'merlin-mode)

(mf/install sly)
(setq inferior-lisp-program "sbcl")
(eval-after-load 'sly
  '(progn
     (message "Loaded sly")))

(mf/install geiser-racket)
(mf/install geiser-guile)
(mf/install geiser-gambit)

(mf/install paredit)
(add-hook 'lisp-mode-hook #'paredit-mode)
(eval-after-load 'paredit
  '(progn
     (message "Loaded paredit")
     (eval-after-load 'sly
       '(add-hook 'sly-mrepl-mode #'paredit-mode))))

(mf/install lsp-latex)
(eval-after-load "tex-mode"
  '(progn
     (require 'lsp-latex)
     (add-hook 'tex-mode-hook 'lsp)
     (add-hook 'latex-mode-hook 'lsp)
     (add-hook 'latex-mode-hook 'reftex-mode)
     (add-hook 'tex-mode-hook 'reftex-mode)))

(c-add-style
 "linux-kernel"
 '((c-basic-offset . 8)
   (c-label-minimum-indentation . 0)
   (c-offsets-alist . ((arglist-intro         . +)
		       (topmost-intro         . 0)
		       (topmost-intro-cont    . 0)
		       (brace-list-intro      . +)
                       (c                     . c-lineup-C-comments)
                       (case-label            . 0)
                       (comment-intro         . c-lineup-comment)
                       (cpp-define-intro      . +)
                       (cpp-macro             . -1000)
                       (cpp-macro-cont        . +)
		       (defun-open            . 0)
                       (defun-block-intro     . +)
		       (defun-close           . 0)
                       (else-clause           . 0)
                       (func-decl-cont        . +)
                       (inclass               . +)
                       (inher-cont            . c-lineup-multi-inher)
                       (knr-argdecl-intro     . 0)
                       (label                 . -1000)
                       (statement             . 0)
                       (statement-block-intro . +)
                       (statement-case-intro  . +)
                       (statement-cont        . +)
                       (substatement          . +)))
   (c-cleanup-list nil)))

(setq c-default-style '((java-mode . "java")
			(awk-mode . "awk")
			(other . "linux-kernel")))

(defun mf/c-mode-hook ()
  (local-set-key (kbd "C-c C-c") #'compile))

(add-hook 'c-mode-hook #'mf/c-mode-hook)

;; Yasnippet
(mf/install yasnippet)
(mf/autoload-func
 :func yas-minor-mode
 :file "yasnippet")
(eval-after-load 'yasnippet
  '(progn
     (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
     (yas-reload-all)))

(mf/install lsp-mode)
(mf/autoload-func
 :func lsp
 :file "lsp-mode")
(setq lsp-keymap-prefix "C-c l")
(eval-after-load 'lsp-mode
  '(progn
     (message "Lsp module loaded")
     (add-hook 'lsp-mode-hook #'yas-minor-mode)
     (setq read-process-output-max (* 1024 1024)
	   lsp-idle-delay 0.5
	   lsp-headerline-breadcrumb-enable nil
	   lsp-lens-enable t
	   lsp-modeline-diagnostics-enable nil
	   lsp-enable-snippet t)))

(provide 'mf-programming)
;;; mf-programming.el ends here
