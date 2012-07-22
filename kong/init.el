(defun kong-test-server ()
  (interactive)
  (remote-shell-command
   "kongdev"
   "bash -c \"export LC_ALL='en_US.UTF-8' && cd /k/kongregate/current && exec script/test_server\""
   "*test-server*"))

(defun kong-console ()
  (interactive)
  (remote-shell-command
   "kongdev"
   "bash -c \"export LC_ALL='en_US.UTF-8' && cd /k/kongregate/current && exec script/console\""
   "*console*"))

(defun kong-kill-test-server ()
  (interactive)
  (shell-command (concat "ssh kongdev " (shell-quote-argument "ps aux | grep test_server | grep -v ssh | grep -v grep | awk '{print $2}' | xargs kill -9")))
  (kill-buffer "*test-server*"))

(defun kong-run-test-file (file)
  (interactive "MTest File: ")
  (compile (format "ssh kongdev 'export LC_ALL=en_US.UTF-8 && cd /k/kongregate/current && exec ruby %s'" file)))

(defun kong-run-current-test-file ()
  (interactive)
  (kong-run-test-file (kong-current-relative-file-name)))

(defun kong-run-test-at-point ()
  (interactive)
  (compile (format "ssh kongdev 'export LC_ALL=en_US.UTF-8 && cd /k/kongregate/current && exec ruby %s -n %s'" (kong-current-relative-file-name) (rinari-test-function-name))))

(defun kong-current-relative-file-name ()
  (file-relative-name (buffer-file-name) (getenv "KONGROOT")))

(defun growl (message)
  (interactive "M")
  (shell-command (concat (getenv "HOME") "/bin/compile-notify.rb " message)))

(defun growl-compilation-result(buffer msg)
  (growl msg))

(post-init (lambda ()
  (add-to-list 'compilation-finish-functions 'growl-compilation-result)
  (set-face-font 'default "Meslo LG L DZ 14")
  (setenv "KONGROOT" "/Users/pkeen/devel/kongregate")

  (setq message-send-mail-function 'smtpmail-send-it
        smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
        smtpmail-default-smtp-server "smtp.gmail.com"
        smtpmail-smtp-server "smtp.gmail.com"
        smtpmail-smtp-service 587
        mail-host-address "pkeen.kongregate.com"
        smtpmail-local-domain "kongregate.com")

  (setq smtpmail-auth-credentials "/Users/pkeen/.authinfo")
  (setq starttls-gnutls-program "/usr/local/bin/gnutls-cli")

  (setq notmuch-show-all-multipart/alternative-parts nil)

  (color-theme-solarized-dark)
))