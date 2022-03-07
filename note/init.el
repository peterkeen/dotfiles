(require-el-get 'git-auto-commit-mode)
(require-el-get 'real-auto-save)

(defun pak-goto-end-of-devlog ()
  (interactive)
  (find-file (expand-file-name "~/notes/devlog.md"))
  (git-auto-commit-mode t)
  (visual-line-mode t)
  (auto-revert-mode t)
  (markdown-toggle-wiki-links t)
  (real-auto-save-mode t)
  (setq real-auto-save-interval 5)
  (setq gac-automatically-push-p 't)
  (setq gac-debounce-interval 30)
  (end-of-buffer))
