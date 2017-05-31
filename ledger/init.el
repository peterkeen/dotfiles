(defun ledger-db ()
  (interactive)
  (let ((sql-database "ledger")
        (sql-server "kodos.zrail.net")
        (sql-user "ledger"))
    (sql-postgres)))

(defun okapi-db ()
  (interactive)
  (let ((sql-database "okapi")
        (sql-server "kodos.zrail.net")
        (sql-user "okapi"))
    (sql-postgres)))

(require-el-get
 '(:name ledger-new2
         :type git
         :options ("xzf")
         :url "https://github.com/ledger/ledger-mode.git"))

(post-init (lambda ()
    (require 'ledger-mode)
    (setenv "LEDGER_FILE" "~/financials/ledger.txt")))

