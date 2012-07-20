(require-el-get
 '(:name notmuch
         :type git
         :url "git://notmuchmail.org/git/notmuch"
         :load-path ("./emacs")))

(defun inbox ()
  (interactive)
  (notmuch-search "tag:inbox"))

(post-init (lambda ()
  (setq notmuch-command "/usr/local/bin/notmuch")))