(require-el-get '(:name color-theme-solarized))

(defun night ()
  (interactive)
  (color-theme-solarized-dark))

(defun day ()
  (interactive)
  (color-theme-solarized-light))

(defun theme-init ()
  (day))


(post-init 'theme-init)