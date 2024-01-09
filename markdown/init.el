(use-package markdown-mode)

(post-init (lambda ()
  (setq auto-mode-list
        (cons '("\\.md" . markdown-mode) auto-mode-alist))))
