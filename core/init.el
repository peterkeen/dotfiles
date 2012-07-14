(require-el-get 'emacs-lock+)
(require-el-get 'undo-tree)
(require-el-get 'evil)

(require 'cl)

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

(defun core-init ()
  (require 'pcomplete)
  (require 'uniquify)
  (require 'ibuffer)

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

  (with-current-buffer "*scratch*"
    (setq emacs-lock-from-exiting 1)))

(add-hook 'pre-init-hook (lambda()
  (setq start-time (current-time)) ; for M-x uptime
  (setq visual-bell t)
  (setq ns-command-modifier 'meta) ; this is *super important*
))
  
(add-hook 'post-init-hook 'core-init)


