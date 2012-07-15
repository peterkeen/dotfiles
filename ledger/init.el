(require-el-get 'ledger-mode)

(add-hook 'post-init-hook (lambda ()
    (setenv "LEDGER_FILE" "~/financials/ledger.txt")))