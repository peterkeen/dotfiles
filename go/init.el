(require-el-get 'go-mode)

(post-init (lambda()
  (add-to-list 'interpreter-mode-alist
               '("gorun" . go-mode))))