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
 '(:name ledger-new
         :type git
         :options ("xzf")
         :load-path ("lisp")
         :url "https://github.com/ledger/ledger.git"))

(post-init (lambda ()
    (setenv "LEDGER_FILE" "~/financials/ledger.txt")))

