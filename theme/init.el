(use package solarized-theme))

(defun night ()
  (interactive)
  (load-theme 'solarized-dark))

(defun day ()
  (interactive)
  (load-theme 'solarized-light))

(defun theme-init ()
  (day))

(post-init 'theme-init)
