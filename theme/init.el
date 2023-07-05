(defun night ()
  (interactive)
  (load-theme 'solarized-dark))

(defun day ()
  (interactive)
  (load-theme 'solarized-light))

(defun theme-init ()
  (night))


(post-init 'theme-init)
