(require-el-get
 '(:name real-auto-save
         :type git
         :options ("xzf")
         :url "https://github.com/ChillarAnand/real-auto-save.git"))

(defun pak-goto-end-of-devlog ()
  (find-file (expand-file-name "~/notes/devlog.md"))
  (git-auto-commit-mode t)
  (visual-line-mode t)
  (auto-revert-mode t)
  (markdown-toggle-wiki-links t)
  (real-auto-save-mode t)
  (setq real-auto-save-interval 5)
  (setq gac-automatically-push-p 'f)
  (setq gac-debounce-interval 30)
  (end-of-buffer))
