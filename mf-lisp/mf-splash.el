;;; mf-splash.el --- An alternative splash screen -*- lexical-binding: t; -*-

;; Copyright (C) 2020 Nicolas .P Rougier

;; Author: Nicolas P. Rougier <nicolas.rougier@inria.fr>
;; Mondifications: Colin McLear
;; URL: https://github.com/rougier/emacs-splash
;; Keywords: startup
;; Version: 0.1
;; Package-Requires:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;;  An alternative splash screen:

;;  - "q" or <esc> kills the splash screen
;;  - Any other key open the about-emacs buffer
;;
;; Note: The screen is not shown if there are opened file buffers. For
;;       example, if you start emacs with a filename on the command
;;       line, the splash is not shown.
;;
;; Usage:
;;
;;  (require 'mf-splash)
;;
;;; Code:
(require 'cl-lib)

(defgroup emacs-splash nil
  "Extensible splash screen."
  :group 'applications)

(defvar emacs-splash-ascii-art
  ;; ascii image from here:
  ;; https://github.com/Triagle/emax/blob/master/boot.txt
  "  

              ``                                         
        :oyhdmmmmdhs+-                                   
        sMMMMMMMMMMMMNdo.                                                                                                  
        .NMMMMMMMMMMMMMMm+                                                                                                 
         oMNNNMMMMMMMMMMMMh.                                                                                               
         n:sdMMMMMMMMMMMMMMd.                                                                                              
                 `+NMMMMMMMMm.                                                                                     
                   -mMMMMMMMMm.                                                                                    
                    -NMMMMMMMMd`                                                                                   
                     :NMMMMMMMMy                                                                                   
                      oMMMMMMMMM+                                                                                  
                       hMMMMMMMMN-                                                                                 
                       .mMMMMMMMMm`                                                                                
                        :MMMMMMMMMy                                                                                
                         sMMMMMMMMM+                                                                                                                 
                         `NMMMMMMMMN-                                                                                                                      
                        `yMMMMMMMMMMd`                                                                                     
                        yMMMMMMMMMMMMy                                                                                     
                       oMMMMMMMMMMMMMM/                                                                                    
                      oMMMMMMMMMMMMMMMN.                                                                                   
                     /MMMMMMMMdMMMMMMMMd`                                                                                  
                    /MMMMMMMMd`dMMMMMMMMs                
                   :NMMMMMMMN. :MMMMMMMMM/                                                                                 
                  -NMMMMMMMM/   yMMMMMMMMN.                                                                                
                 .NMMMMMMMM+    .NMMMMMMMMd                                                                                
                .mMMMMMMMMs      /MMMMMMMMMs                                                                               
               `dMMMMMMMMh`       yMMMMMMMMM:                                                                              
              `dMMMMMMMMd`        `mMMMMMMMMN.                                                                             
             `hMMMMMMMMm.          :MMMMMMMMMh                                                                             
             yMMMMMMMMN-            oMMMMMMMMMo                                                                            
            sMMMMMMMMN:             `dMMMMMMMMN:                                                                           
           oMMMMMMMMM/               -NMMMMMMMMm`                                                                          
          +MMMMMMMMMo                 +MMMMMMMMMh                                                                          
         /NMMMMMMMMs                   yMMMMMMMMM+                                                                         
        :NMMMMMMMMy`                   .mMMMMMMMMN-                                                                        
       -NMMMMMMMMd`                     :MMMMMMMMMm`                                                                       
      -mMMMMMMMMm.                       sMMMMMMMMMy                                                                       
     .mMMMMMMMMm-                        `dMMMMMMMMM+                                                                      
    .dMMMMMMMMN:                          -NMMMMMMMMN-                                                                     
   `dMMMMMMMMN/                            +MMMMMMMMMd`                                                                    
  `hMMMMMMMMM+                              hMMMMMMMMMy                                                                    
  yMMMMMMMMMs                               .NMMMMMMMMM/                                                                   
 `//////////                                 -/////////:                                                                   
                            
"
  "ascii art to use for the splash screen")

(defun point-calc-lines-offset (pt lines)
  (save-excursion
    (goto-char pt)
    (forward-line lines)
    (point)))

;; See https://github.com/emacs-dashboard/emacs-dashboard/blob/master/dashboard-widgets.el
;; https://github.com/hlissner/doom-emacs/blob/eddaae40e84b5eb1f0136aaba23d918f71b6a986/core/core.el#L479

(defcustom splash-init-info
  (lambda ()
    (let ((package-count 0) (time (emacs-init-time)))
      (setq package-count (- (length load-path) (length (get 'load-path 'initial-value))))
      (if (zerop package-count)
          (format "Emacs started in %s" time)
        (format "%d packages loaded in %s" package-count time))))
  "Init info with packages loaded and init time."
  :type '(function string)
  :group 'emacs-splash)

;;; Define Splash
(defun emacs-splash-screen ()
  "A custom splash screen for Emacs"

  (interactive)

  ;; check if splash exists and switch if so
  (if (get-buffer "*splash*")
      (switch-to-buffer "*splash*")

    ;; Otherwise create splash and go...
    ;; Hide modeline before window-body-height is computed
    (let* ((splash-buffer (get-buffer-create "*splash*")))
      (with-current-buffer splash-buffer
        (setq header-line-format nil)
        (setq mode-line-format nil)))

    (let* ((buffer-read-only)
           (splash-buffer  (get-buffer-create "*splash*"))
           (height         (- (window-body-height nil) 1))
           (width          (+ (window-body-width) 5)))


      (with-current-buffer splash-buffer
        (erase-buffer)

        ;; Buffer local settings
        (if (one-window-p)
            (setq mode-line-format nil))
        (setq-local cursor-type nil)
        (setq vertical-scroll-bar nil)
        (setq horizontal-scroll-bar nil)
        (setq fill-column width)
        (face-remap-add-relative 'link :underline nil)
        (if (not (display-graphic-p)) (menu-bar-mode 0))
        ;; Set padding
        (setq-local left-margin-width 15 right-margin-width 0) ; Define new widths.
        (set-window-buffer nil (current-buffer))

        ;; Add padding at top
        (insert-char ?\n 2)

        ;; Insert ascii art
        (goto-char width)
        (save-excursion
          (insert (propertize emacs-splash-ascii-art 'face 'shadow)))

        ;; Insert text
        (goto-char width)
        (save-excursion
          (insert (concat
                   (propertize "Welcome to GNU Emacs"  'face 'bold)
                   " "
                   (propertize (format "%d.%d" emacs-major-version emacs-minor-version) 'face 'bold))))

	(goto-char (+ width 145))
        (save-excursion (insert (propertize "Vi Vi Vi,the editor of the beast!" 'face 'shadow)))

	(goto-char (+ width 299))
        (save-excursion (let ((init-info (funcall splash-init-info)))
                          (insert (propertize init-info 'face 'shadow))))

        (goto-line 11)
	(end-of-line)
        (save-excursion (insert-text-button " [a] Agenda "
                                            'action (lambda (_) (mf/agenda))
                                            'help-echo "Open org agenda"
                                            'face 'warning
                                            'follow-link t))
        (goto-line 12)
	(end-of-line)
        (save-excursion (insert-text-button " [c] Config "
                                            'action (lambda (_) (mf/open-emacsd))
                                            'help-echo "Visit setup directory"
                                            'face 'warning
                                            'follow-link t))
	(goto-line 13)
	(end-of-line)
        (save-excursion (insert-text-button " [f] File "
                                            'action (lambda (_)  (find-file))
                                            'help-echo "Open file"
                                            'face 'warning
                                            'follow-link t))
        (goto-line 14)
	(end-of-line)
        (save-excursion (insert-text-button " [m] Mail "
                                            'action (lambda (_)  (mu4e))
                                            'help-echo "Open Email in Mu4e"
                                            'face 'warning
                                            'follow-link t))
        (goto-line 15)
	(end-of-line)
        (save-excursion (insert-text-button " [n] Notes "
                                            'action (lambda (_)  (org-roam-node-find))
                                            'help-echo "Visit org roam notes"
                                            'face 'warning
                                            'follow-link t))
        (goto-line 16)
	(end-of-line)
        (save-excursion (insert-text-button " [p] Projects "
                                            'action (lambda (_)  (mf/project-find-file-and-persp))
                                            'help-echo "Open project & workspace"
                                            'face 'warning
                                            'follow-link t))
	(goto-line 17)
	(end-of-line)
        (save-excursion (insert-text-button " [t] Telega "
                                            'action (lambda (_)  (mf/toggle-telega))
                                            'help-echo "Open Telega"
                                            'face 'warning
                                            'follow-link t))

        ;; Vertical padding to bottom
        (goto-char (point-max))

        ;; Footer text
        (save-excursion (insert-char ?\n 4)
                        (insert
                         (propertize
			  (concat "                              "
				  (shell-command-to-string "fortune"))
			  'face 'shadow)))

        (goto-char (point-min))
        (display-buffer-same-window splash-buffer nil))
      (switch-to-buffer "*splash*")))
  (emacs-splash-mode))

(defun splash-screen-kill ()
  "Kill the splash screen buffer (immediately)."
  (interactive)
  (if (get-buffer "*splash*")
      (progn
        (emacs-splash-mode)
        (kill-buffer "*splash*"))))

;;; Define Minor Mode
;; Custom splash screen
(defvar emacs-splash-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "a") 'mf/agenda)
    (define-key map (kbd "c") 'mf/open-emacsd)
    (define-key map (kbd "f") 'find-file)
    (define-key map (kbd "m") 'mu4e)
    (define-key map (kbd "n") 'org-roam-node-find)
    (define-key map (kbd "p") 'mf/project-find-file-and-persp)
    (define-key map (kbd "t") 'mf/toggle-telega)
    (define-key map (kbd "q") 'splash-screen-kill)
    map)
  "Keymap for emacs-splash-mode.")

(define-minor-mode emacs-splash-mode
  "Emacs minor mode for splash screen."
  :global nil
  :group 'emacs-splash
  :require 'mf-splash.el

  (buffer-disable-undo)
  (whitespace-mode -1)
  (linum-mode -1)
  (setq-local cursor-type nil)
  (setq-local hl-line-mode nil)
  (setq-local mode-line-format nil)
  (setq-local header-line-format nil)
  (when (>= emacs-major-version 26)
    (display-line-numbers-mode -1))
  (setq inhibit-startup-screen t
        buffer-read-only t
        truncate-lines nil
        inhibit-startup-message t
        inhibit-startup-echo-area-message t)
  (goto-char (point-min)))

;; Suppress any startup message in the echo area
(run-with-idle-timer 0.05 nil (lambda() (message nil)))

;; Install hook after frame parameters have been applied and only if
;; no option on the command line
(if (and (not (member "--no-splash" command-line-args))
         (not (member "--file"      command-line-args))
         (not (member "--insert"    command-line-args))
         (not (member "--find-file" command-line-args)))
    (add-hook 'window-setup-hook 'emacs-splash-screen))

;; don't highlight when idle
(add-hook 'emacs-splash-mode-hook (lambda () (when emacs-splash-mode (hl-line-mode -1))))

;;; Provide Splash
(provide 'mf-splash)
;;; setup-splash.el ends here
