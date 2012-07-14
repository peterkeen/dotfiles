(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(defun ansi-color-apply-on-buffer ()
  "Apply the ansi-color filter to the current buffer"
  (interactive)
  (ansi-color-apply-on-region (point-min) (point-max)))

(defun pak-pager (filename)
  "Open a pager buffer on the filename specified"
  (find-file filename)
  (with-current-buffer
    (rename-buffer "*PAGER*" 1)
    (ansi-color-apply-on-buffer)
    (set-buffer-modified-p nil)
    (view-mode)))
