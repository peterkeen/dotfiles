(require-el-get
 '(:name ledger
         :type http
         :url "https://raw.github.com/jwiegley/ledger/next/lisp/ledger.el"))

(add-hook 'post-init-hook (lambda ()
    (setenv "LEDGER_FILE" "~/financials/ledger.txt")))