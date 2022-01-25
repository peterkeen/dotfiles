(require-el-get 'undo-tree)

(require-el-get
 '(:name s
         :type git
         :options ("xzf")
         :url "https://github.com/magnars/s.el.git"))

(require-el-get
 '(:name f
         :type git
         :options ("xzf")
         :url "https://github.com/rejeep/f.el.git"))

(require-el-get
 '(:name dash
         :type git
         :options ("xzf")
         :url "https://github.com/magnars/dash.el.git"))

(require-el-get
 '(:name flycheck
         :type git
         :options ("xzf")
         :url "https://github.com/flycheck/flycheck.git"))

(require-el-get
 '(:name ag-mode
         :type git
         :options ("xzf")
         :url "https://github.com/Wilfred/ag.el.git"))

(require 'cl)

(defalias 'qrr 'query-replace-regexp)
(defalias 'sir 'string-insert-rectangle)

(defun duration (time)
  "Takes in a time-value and returns the number of seconds since
   the epoch that value represents."
  (+ (* 65536 (car time)) (cadr time)))

(defun uptime ()
  "Prints the current uptime of Emacs as recorded on startup in
   the value 'start-time'"
  (interactive)
  (let* ((total (duration (time-subtract (current-time) start-time)))
         (days  (floor (/ total 86400)))
         (hours (progn (decf total (* days  86400)) (floor (/ total 3600))))
         (mins  (progn (decf total (* hours 3600))  (floor (/ total 60))))
         (secs  (progn (decf total (* mins  60))    (floor total))))
    (message "%d days, %d hours, %d minutes, %d seconds" days hours mins secs)))

(defalias 'unfuck-this-buffer 'toggle-input-method)

(defvar prev-frame-height)
(defvar prev-frame-width)
(defun embiggen-font ()
  (interactive)
  (setq prev-frame-height (frame-height))
  (setq prev-frame-width (frame-width))
  (set-face-attribute 'default' nil :height 200))

(defun recromulate-font ()
  (interactive)
  (set-face-attribute 'default' nil :height 140)
  (set-frame-width nil prev-frame-width)
  (set-frame-height nil prev-frame-height))

(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match that used by the user's shell.

This is particularly useful under Mac OSX, where GUI apps are not started from a shell."
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))



(defun core-init ()
  (require 'pcomplete)
  (require 'uniquify)
  (require 'ibuffer)

  (set-exec-path-from-shell-PATH)

  (setq loaded-init-module t)

  (ido-mode t)
  (setq ido-enable-flex-matching t)

  (setq uniquify-buffer-name-style 'post-forward)

  (setq ibuffer-enable t)
  (setq ibuffer-shrink-to-minimum-size t)
  (setq ibuffer-expert t)

  (scroll-bar-mode -1)
  (menu-bar-mode -1)
  (display-time)
  (tool-bar-mode -1)
  (show-paren-mode 1)

  (put 'upcase-region 'disabled nil)
  (setq x-select-enable-clipboard t)

  (put 'narrow-to-region 'disabled nil)

  (global-set-key "\C-cfb" 'embiggen-font)
  (global-set-key "\C-cfr" 'recromulate-font)
  (global-set-key "\C-cfp" 'find-file-at-point)

  (load "./emacs-lock+")

  (setq vc-follow-symlinks nil)

  (with-current-buffer "*scratch*"
    (setq emacs-lock-from-exiting 1)))


(pre-init (lambda()
  (setq start-time (current-time)) ; for M-x uptime
  (setq ring-bell-function (lambda () (message "*beep*")))
  (setq ns-command-modifier 'meta) ; this is *super important*
))
  
(post-init 'core-init)
