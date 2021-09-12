;;; Emacs.el --- Use package driven emacs configuration
;;; Code:
(require 'mf-autoloads)
(require 'mf-look-and-feel)
(require 'mf-notmuch)
(require 'mf-completion)

;;; Keybindings
(define-key emacs-lisp-mode-map (kbd "C-M-d") #'mf/delete-sexp)

(use-package general
  :init
  (general-override-mode 1)
  :config
  (general-create-definer mf/leader-keys
    :prefix "C-c")
  (mf/leader-keys
	"i" 'mf/infos
	"RET" 'mf/toggle-eshell
	"m" 'notmuch
	"o" 'delete-other-windows
	"/" 'occur
	"d"  'kill-current-buffer
	"cc" 'compile
	"cr" 'recompile
	"c(" 'check-parens))

;;; Programming
(use-package projectile
  :defer t
  :commands projectile-mode
  :hook
  (c-mode . projectile-mode)
  (c++-mode . projectile-mode)
  (go-mode . projectile-mode)
  (haskell-mode . projectile-mode)
  (emacs-lisp-mode . projectile-mode))

;; Golang
(defun go-fmt()
  (when (eq major-mode 'go-mode)
	(add-hook 'before-save-hook 'gofmt-before-save)))

(use-package go-mode
  :defer t
  :commands go-mode
  :config
  (add-hook 'go-mode-hook 'gofmt-before-save))

; Requires gocode binary ``go get github.com/mdempsky/gocode
(use-package go-complete
  :defer t
  :after go-mode
  :config
  (add-hook 'completion-at-point-functions 'go-complete-at-point))

;; Haskell
(use-package hindent
  :defer t
  :commands hindent-mode
  :hook (haskell-mode-hook . hindent-mode)
  :config (setq hindent-reformat-buffer-on-save t))

;; C
(add-hook 'c-mode-hook '(lambda()
						  (c-set-style 'k&r)))

;; Git
(use-package magit
  :defer t
  :commands magit magit-status)
;;; Emacs.el ends here
