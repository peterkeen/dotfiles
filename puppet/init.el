(require-el-get '(:name puppet-mode-2
       :description "A simple mode for editing puppet manifests"
       :type http
       :url "https://raw.github.com/puppetlabs/puppet/master/ext/emacs/puppet-mode.el"
       :after (lambda ()
                (autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet manifests" t)
                (add-to-list 'auto-mode-alist '("\\.pp$" . puppet-mode)))))
