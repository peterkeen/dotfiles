(require-el-get '(:name multi-term))

(defun sh1 ()
  (interactive)
  (my-shell 1))

(defun sh2 ()
  (interactive)
  (my-shell 2))

(defun sh3 ()
  (interactive)
  (my-shell 3))

(defun my-shell (arg)
  (interactive)
  (let ((arg (or arg 1)))
    (shell (format "*sh%d*" arg))))

(defun my-shell-interactively (arg)
  (interactive "nSwitch to sh #:")
  (my-shell arg))

(defun multi-term-shell-command (command buffername)
  (let ((multi-term-program (format "%s/bin/multi-term-helper.sh" (getenv "HOME"))))
    (setenv "MULTI_TERM_PROGRAM" command)
    (multi-term)
    (rename-buffer buffername)))

(defun term-stuff-init ()
  (global-unset-key (kbd "C-z"))
  (global-set-key (kbd "C-z z") 'my-shell)
  (global-set-key (kbd "C-z 1") '(lambda () (interactive) (my-shell 1)))
  (global-set-key (kbd "C-z 2") '(lambda () (interactive) (my-shell 2)))
  (global-set-key (kbd "C-z 3") '(lambda () (interactive) (my-shell 3)))
  (global-set-key (kbd "C-z 4") '(lambda () (interactive) (my-shell 4)))
  (global-set-key (kbd "C-z 5") '(lambda () (interactive) (my-shell 5)))
  (global-set-key (kbd "C-z 6") '(lambda () (interactive) (my-shell 6)))
  (global-set-key (kbd "C-z 7") '(lambda () (interactive) (my-shell 7)))
  (global-set-key (kbd "C-z 8") '(lambda () (interactive) (my-shell 8)))
  (global-set-key (kbd "C-z 9") '(lambda () (interactive) (my-shell 9)))

  (setq multi-term-program "/bin/bash")
  (server-start))

(post-init 'term-stuff-init)