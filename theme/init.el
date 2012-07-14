(require-el-get '(:name color-theme-solarized))

(defun theme-init ()
  (color-theme-solarized-light))

(add-hook 'post-init-hook 'theme-init)