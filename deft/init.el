(require-el-get 
 '(:name deft-github
         :type git
         :options ("xzf")
         :url "https://github.com/jrblevin/deft.git"))

(post-init (lambda()
  (setq deft-extension "md")
  (setq deft-directory "~/notes")
  (setq deft-text-mode 'markdown-mode)
  (setq deft-use-filename-as-title nil)
  (setq deft-use-filter-string-for-filename t)
))
