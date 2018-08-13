(require-el-get 'ruby-mode)
(require-el-get 'inf-ruby)
(require-el-get 'rinari)
(require-el-get 'rhtml-mode)
(require-el-get 'textmate)
(require-el-get 'yaml-mode)

(post-init (lambda()
  (autoload 'ruby-mode "ruby-mode" nil t)
  (add-to-list 'auto-mode-alist '("Capfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.json\\.jb\\'" . ruby-mode))

  (require 'align)

  (add-to-list 'align-rules-list
               '(ruby-comma-delimiter
                 (regexp . ",\\(\\s-*\\)[^# \t\n]")
                 (repeat . t)
                 (modes  . '(ruby-mode))))

  (add-to-list 'align-rules-list
               '(ruby-hash-literal
                 (regexp . "\\(\\s-*\\)=>\\s-*[^# \t\n]")
                 (group 2 3)
                 (repeat . t)
                 (modes  . '(ruby-mode))))

  (add-to-list 'align-rules-list
               '(ruby-assignment-literal
                 (regexp . "\\(\\s-*\\)=\\s-*[^# \t\n]")
                 (repeat . t)
                 (modes  . '(ruby-mode))))

  (add-to-list 'align-rules-list
               '(ruby-xmpfilter-mark
                 (regexp . "\\(\\s-*\\)# => [^#\t\n]")
                 (repeat . nil)
                 (modes  . '(ruby-mode))))

  (add-hook 'ruby-mode-hook '(lambda ()
                               (flycheck-mode)
                               (setq ruby-deep-arglist t)
                               (setq ruby-deep-indent-paren nil)
                               (setq c-tab-always-indent nil)
                               (require 'inf-ruby)
                               (require 'ruby-compilation)
                               (define-key ruby-mode-map (kbd "M-r") 'run-rails-test-or-ruby-buffer)))
  (autoload 'rhtml-mode "rhtml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . rhtml-mode))
  (add-to-list 'auto-mode-alist '("\\.rjs\\'" . rhtml-mode))
  (add-hook 'rhtml-mode '(lambda ()
                           (define-key rhtml-mode-map (kbd "M-s") 'save-buffer)))
  (autoload 'yaml-mode "yaml-mode" nil t)
  (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
  (autoload 'css-mode "css-mode" nil t)
  (add-hook 'css-mode-hook '(lambda ()
                              (setq css-indent-level 2)
                              (setq css-indent-offset 2)))


  (setenv "PATH" (concat (getenv "HOME") "/.rbenv/shims:" (getenv "HOME") "/.rbenv/bin:" (getenv "PATH")))
  (setq exec-path (cons (concat (getenv "HOME") "/.rbenv/shims") (cons (concat (getenv "HOME") "/.rbenv/bin") exec-path)))

(require 'align)

(add-to-list 'align-rules-list
             '(ruby-comma-delimiter
               (regexp . ",\\(\\s-*\\)[^# \t\n]")
               (repeat . t)
               (modes  . '(ruby-mode))))

(add-to-list 'align-rules-list
             '(ruby-hash-literal
               (regexp . "\\(\\s-*\\)=>\\s-*[^# \t\n]")
               (group 2 3)
               (repeat . t)
               (modes  . '(ruby-mode))))

(add-to-list 'align-rules-list
             '(ruby-hash-literal2
               (regexp . "[a-z0-9]:\\(\\s-*\\)[^# \t\n]")
               (repeat . t)
               (modes  . '(ruby-mode))))

(add-to-list 'align-rules-list
             '(ruby-assignment-literal
               (regexp . "\\(\\s-*\\)=\\s-*[^# \t\n]")
               (repeat . t)
               (modes  . '(ruby-mode))))

(add-to-list 'align-rules-list
             '(ruby-xmpfilter-mark
               (regexp . "\\(\\s-*\\)# => [^#\t\n]")
               (repeat . nil)
               (modes  . '(ruby-mode))))
))
