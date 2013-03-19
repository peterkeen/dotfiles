(require-el-get
 '(:name actionscript-mode
         :type git
         :url "https://github.com/austinhaas/actionscript-mode.git"))

(post-init (lambda()
    (autoload 'actionscript-mode "actionscript-mode" "Major mode for actionscript." t)
    (add-to-list 'auto-mode-alist '("\\.as$" . actionscript-mode))))