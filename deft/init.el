(require-el-get 'deft)

(post-init (lambda()
  (setq deft-extension "md")
  (setq deft-directory "~/notes")
  (setq deft-text-mode 'markdown-mode)
  (setq deft-use-filename-as-title nil)
))